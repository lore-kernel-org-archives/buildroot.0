From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 17:03:00 +0100
Subject: [Buildroot] ARM cores
In-Reply-To: <20110124165711.381989cf@surf> (Thomas Petazzoni's message of
	"Mon, 24 Jan 2011 16:57:11 +0100")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	<87lj2ahe4y.fsf@macbook.be.48ers.dk> <20110124165711.381989cf@surf>
Message-ID: <87y66athl7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Thinking a bit more about it - For the omap3 stuff, they are all with
 >> A8 cores, so we could even do 'depends on BR2_cortex_a8', right?

 Thomas> Besides those OMAP-specific packages, there are also other packages
 Thomas> that could depend on CPU-specific features.

 Thomas> For example, some video decoders have specific code to use NEON
 Thomas> instructions, but those instructions are not available on Cortex-A8
 Thomas> cores for example.

Not available? Doesn't almost all A8 implementations have NEON? Do we
have any packages that cannot work on !NEON arms? (E.G. where it isn't
just an optimization)

 Thomas> Should we go all the way down to specifying the particular CPU
 Thomas> the user is going to use (OMAP3, OMAP4, etc.) and then select
 Thomas> the appropriate mtune/march according to this, show/hide
 Thomas> packages according to this, and tune specifically some packages
 Thomas> according to this ?

That would imho be a lot of work to keep uptodate with the maze of ARM
SoCs available.

I think a few defconfigs for commonly used boards would be good enough.

-- 
Bye, Peter Korsgaard
