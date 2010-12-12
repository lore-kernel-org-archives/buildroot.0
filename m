From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 23:46:25 +0100
Subject: [Buildroot] [PATCH 07/15] ltp-testsuite: bump version and use
	autotargets
In-Reply-To: <87aakaljiz.fsf@macbook.be.48ers.dk>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<c3f16255f702a6cdd4936c2c91d13ac61db35c82.1291541115.git.thomas.petazzoni@free-electrons.com>
	<87bp4slyo4.fsf@macbook.be.48ers.dk> <20101212123150.77a2569e@surf>
	<87aakaljiz.fsf@macbook.be.48ers.dk>
Message-ID: <20101212234625.29f64f1a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Dec 2010 23:21:24 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> ltp-testsuite uses sigset(), which is obsolete. uClibc can
>  Thomas> implement it, but not with our default configuration. I
>  Thomas> thought ltp-testsuite was not of sufficiently general usage
>  Thomas> to decide to make the change of our default uClibc
>  Thomas> configuration. The option is UCLIBC_HAS_OBSOLETE_BSD_SIGNAL.
> 
> Ok.
> 
>  Thomas> BTW, I have the same problem with the mrouted package, which
>  Thomas> needs UCLIBC_SUPPORT_AI_ADDRCONFIG enabled in uClibc to
>  Thomas> compile. For this package, I just added a comment in the
>  Thomas> Config.in help text mentionning this. Should I do the same
>  Thomas> with ltp-testsuite ?
> 
> Yeah, I would say this is good enough.

So you mean that just like for mrouted, I should allow the selection of
ltp-testsuite with uClibc, even though it would not build with our
default uClibc configuration ?

> We could ofcourse add toolchain knobs for all of these, but as you say
> they are probably not worth the effort / extra complexity. I think
> just leaving them like this is good enough.

Obviously, I don't think it's reasonable to add dozens of toolchain
configuration knobs.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
