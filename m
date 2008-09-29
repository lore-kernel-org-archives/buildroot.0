From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 29 Sep 2008 12:57:01 +0200
Subject: [Buildroot] Standalone toolchain
In-Reply-To: <48E09A70.5020801@cetrtapot.si>
References: <48DA3D47.5060204@cetrtapot.si>
	<20080924134635.GA14882@mx.loc>	<48E0969E.9090509@cetrtapot.si>
	<48E09A70.5020801@cetrtapot.si>
Message-ID: <48E0B47D.2080102@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hinko Kocevar wrote:
> It can be seen that --sysroot argument is not applied to the linker command - it is using default sysroot (used when creating toolchain) '/work/buildroot/build_cris/staging_dir' instead of '/work/git/sdk.git/toolchain' I'm trying to set.
> 
> LD should indeed accept the argument (from the help):
> hinkok at alala /work/git/sdk.git $ /work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/ld --help|grep sysroot
>   --sysroot=<DIRECTORY>       Override the default sysroot location
> 

These options seem to work:
CFLAGS += --sysroot=$(TOOLCHAIN)
LDFLAGS += --sysroot=$(TOOLCHAIN) -Wl,--sysroot,$(TOOLCHAIN)


Best regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
