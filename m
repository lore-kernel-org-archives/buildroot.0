From: Mark Fisher <fobs12@ymail.com>
Date: Thu, 13 May 2010 12:29:21 +0000 (UTC)
Subject: [Buildroot] Status of external toolchain support
References: <4BEAE23A.2000906@carallon.com>
	<201005122319.35163.yann.morin.1998@anciens.enib.fr>
	<4BEB1F7B.8010301@carallon.com>
	<201005122347.39990.yann.morin.1998@anciens.enib.fr>
Message-ID: <loom.20100513T141936-42@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN <yann.morin.1998@...> writes:

> > If you need to tell buildroot the type of threading used (linuxthread 
> > old/new or nptl) then currently buildroot does not check that they match 
> > up, as I have an nptl toolchain but am unable to select that in 
> > buildroot so it is set to linuxthreads new, but I got no error.
> 
> Oh, I see what you mean:
> - the prompt for the threading model is wrong when dealing with external
>   toolchains: we only need to know if threads are supported or not
> - a check is missing to check coherency btw external toolchain threading
>   capabilties, and buildroot configuration.

I think the problem is that the file toolchain\Config.in.2 is configured to 
only allow BR2_THREADS_NATIVE (NPTL threading option) to be selected if uclibc 
was set to the latest snapshot. This was a change made in February. It seems 
like this selection should also be allowed if glibc is the C library.

> 
> Regards,
> Yann E. MORIN.
> 


Mark
