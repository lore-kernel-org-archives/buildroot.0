From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 07 Mar 2015 01:49:04 +0100
Subject: [Buildroot] asm/errno.h: No such file or directory compiling
	luajit
In-Reply-To: <CA+TH9Vm09qBNY2qrykL1zTe5JmPmiRObfg_-K1juURVSjWwvZA@mail.gmail.com>
References: <CA+TH9Vn=OjM74WB46dgXXm3Xcjy5X6z8i++p8o6EK1vBs9xrxQ@mail.gmail.com>
 <20150306195416.62f7424b@free-electrons.com>
 <CA+TH9Vm09qBNY2qrykL1zTe5JmPmiRObfg_-K1juURVSjWwvZA@mail.gmail.com>
Message-ID: <54FA4B00.4000901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 22:52, Angelo Compagnucci wrote:
[snip]
> /usr/bin/make all "LJCORE_O=ljamalg.o"
> HOSTCC    host/minilua.o
> HOSTCC    host/buildvm_asm.o
> HOSTCC    host/buildvm_peobj.o
> HOSTCC    host/buildvm_lib.o
> HOSTCC    host/buildvm_fold.o
> CC        luajit.o
> In file included from /usr/include/bits/errno.h:24:0,
>                  from /usr/include/errno.h:35,
>                  from host/buildvm.h:13,
>                  from host/buildvm_asm.c:6:
> /usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such
> file or directory
>  #include <asm/errno.h>

 The error actually pertains to the compilation of host/buildvm_asm.o, which is
a host file not a target file. It helps to debug this kind of thing with
BR2_JLEVEL=1...

 It looks like there is something wrong with your system's toolchain
installation. There really should be a /usr/include/asm/errno.h. In a multilib
installation, asm is typically a symlink to <arch>/asm. Is it possible that this
symlink got removed by a botched package install?


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
