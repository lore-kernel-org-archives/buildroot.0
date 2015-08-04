From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 20:07:22 +0200
Subject: [Buildroot] [PATCH] binutils: fix buildng of Linux kernel for
 ARCv2 ISA
In-Reply-To: <1438688562-26476-1-git-send-email-abrodkin@synopsys.com>
References: <1438688562-26476-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150804200722.6effb8d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue,  4 Aug 2015 14:42:42 +0300, Alexey Brodkin wrote:
> With fix of missing .tdata/.tbss sections we unintentionally introduced
> a regression for ARCv2 ISA (read ARC HS38) kernel building.
> 
> That's what we got on attempt to build kernel:
> ----------------------------------->8--------------------------------------
>   LD      drivers/video/fbdev/built-in.o
> arc-linux-ld: ERROR: Attempting to link drivers/video/fbdev/omap2/built-in.o with a binary drivers/video/fbdev/built-in.o of different architecture
> arc-linux-ld: failed to merge target specific data of file drivers/video/fbdev/omap2/built-in.o
> scripts/Makefile.build:337: recipe for target 'drivers/video/fbdev/built-in.o' failed
> make[3]: *** [drivers/video/fbdev/built-in.o] Error 1
> scripts/Makefile.build:403: recipe for target 'drivers/video/fbdev' failed
> make[2]: *** [drivers/video/fbdev] Error 2
> scripts/Makefile.build:403: recipe for target 'drivers/video' failed
> make[1]: *** [drivers/video] Error 2
> Makefile:944: recipe for target 'drivers' failed
> make: *** [drivers] Error 2
> ----------------------------------->8--------------------------------------

I've fixed the typo in the commit title, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
