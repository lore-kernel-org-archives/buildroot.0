From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 23 Nov 2009 14:10:03 +0100
Subject: [Buildroot] help crosscompile
In-Reply-To: <20091123125925.153760@gmx.net>
References: <20091123125925.153760@gmx.net>
Message-ID: <4d28d4b50911230510u76e2cb31qda4c4c2b32fda1bd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looks like you miss-applied a xenomai patch or you're using a xenomai patch
that does not support the arm architecture...

On Mon, Nov 23, 2009 at 1:59 PM, Jens Kleinhans <Jens.Kleinhans@gmx.de>wrote:

>  On Mon, Nov 23, 2009 at 01:22:21PM +0100, Jens Kleinhans wrote:
> > I want to crosscompile kernel with the following command:
> >
> > make ARCH=arm
> CROSS_COMPILE=<path_to_cross-compiler/cross-compiler-prefix->
> >
> > I build up my buildroot follwing the guide of
> http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild.
> >
> > What must I replace for
> "<path_to_cross-compiler/cross-compiler-prefix->".
> > What is the cross-compiler-prefix?
>
> /path/to/your/buildroot/build_arm/staging_dir/usr/bin/arm-linux-
>
> should work.
>
> Daniel
> _______________________________________________
>
> Hi Daniel I thanks for this information. But when I type I get the
> following problem. The ipipe directory is missing.  When I do the menuconfig
> of the Linux Kernel with "$ Make ARCH=arm menuconfig"  no option about ipipe
> appears. Have you an idea how to solve this problem
>
> root at benjamin-laptop:/usr/src/linux# make ARCH=arm
> CROSS_COMPILE=/buildroot_new/buildroot/build_arm/staging_dir/usr/bin/arm-linux-
> scripts/kconfig/conf -s arch/arm/Kconfig
>   CHK     include/linux/version.h
>   UPD     include/linux/version.h
>   SYMLINK include/asm-arm/arch -> include/asm-arm/arch-at91
>   Generating include/asm-arm/mach-types.h
>   CHK     include/linux/utsrelease.h
>   UPD     include/linux/utsrelease.h
>   SYMLINK include/asm -> include/asm-arm
>   CC      arch/arm/kernel/asm-offsets.s
> In file included from include/asm/system.h:366,
>                  from include/asm/bitops.h:27,
>                  from include/linux/bitops.h:17,
>                  from include/linux/kernel.h:15,
>                  from include/linux/sched.h:52,
>                  from arch/arm/kernel/asm-offsets.c:13:
> include/asm-generic/cmpxchg-local.h:4:28: error: asm/ipipe_base.h: No such
> file or directory
> In file included from include/linux/sched.h:62,
>                  from arch/arm/kernel/asm-offsets.c:13:
> include/linux/ipipe.h:32:23: error: asm/ipipe.h: No such file or directory
> make[1]: *** [arch/arm/kernel/asm-offsets.s] Fehler 1
> make: *** [prepare0] Fehler 2
> root at benjamin-laptop:/usr/src/linux#
>
> --
> GRATIS f?r alle GMX-Mitglieder: Die maxdome Movie-FLAT!
> Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01
>
>
>
> --
> Preisknaller: GMX DSL Flatrate f?r nur 16,99 Euro/mtl.!
> http://portal.gmx.net/de/go/dsl02
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091123/10c85b6b/attachment.htm>
