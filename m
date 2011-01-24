From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 16:57:11 +0100
Subject: [Buildroot] ARM cores
In-Reply-To: <87lj2ahe4y.fsf@macbook.be.48ers.dk>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	<87lj2ahe4y.fsf@macbook.be.48ers.dk>
Message-ID: <20110124165711.381989cf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jan 2011 09:58:21 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Thinking a bit more about it - For the omap3 stuff, they are all with
> A8 cores, so we could even do 'depends on BR2_cortex_a8', right?

Besides those OMAP-specific packages, there are also other packages
that could depend on CPU-specific features.

For example, some video decoders have specific code to use NEON
instructions, but those instructions are not available on Cortex-A8
cores for example.

Should we go all the way down to specifying the particular CPU the user
is going to use (OMAP3, OMAP4, etc.) and then select the appropriate
mtune/march according to this, show/hide packages according to this,
and tune specifically some packages according to this ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
