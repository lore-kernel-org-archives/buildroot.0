From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 22:38:24 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <50105627.6010905@zacarias.com.ar>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
 <50105627.6010905@zacarias.com.ar>
Message-ID: <20120725223824.4881c01a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 17:25:11 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> > Makes sense. Gustavo, what do you think?
> 
> Yes, it's the best option since we'll have the same dilemma sooner or
> latter with powerpc(64) for example.

Ok.

> > No, it could be this way. The bigger question is:
> > 
> >>>   TARGET_CFLAGS+=-fno-pic -mno-abicalls
> > 
> > Why are those special CFLAGS needed from the beginning?
> 
> From what i could unearth it basically breaks dynamic linking though it
> makes for smaller binaries.
> I've tried removing it in my tests to get uClibc dynamic linking working
> but something else is wrong, seemingly in the uClibc side.
> For starters the loader is wrong, ld-linux in the target vs. ld64-linux
> wanted by ELF files. And it seems there's something funky in the uClibc
> Makefile about that (wants mips64 arch to build it, but they're using
> unified ARCH as the kernel, so...)

Do you have a working mips64 kernel under Qemu? I vaguely remember that
you said that it was working with statically linked binary, but not
dynamically linked ones. Is this correct?

If you have a working mips64 kernel under Qemu, I'm interested by the
kernel config and Qemu config.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
