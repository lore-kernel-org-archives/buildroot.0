From: Julien Letessier <julien.letessier@technosens.fr>
Date: Fri, 22 Jun 2007 18:40:02 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target: device
	device/mips
In-Reply-To: <20070622084710.5B20648010@busybox.net>
References: <20070622084710.5B20648010@busybox.net>
Message-ID: <f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug: This breaks building the linux kernel for other devices, which
use zImage or bzImage.

Why: LINUX26_BINLOC is always defined in target/device/mips/Makefile.in
Therefore it its definition in target/linux26.mk is never used

Fix: For now, remove target/device/mips/Makefile.in, which is not
protected by a board-support menuconfig option.

2007/6/22, aldot at uclibc.org <aldot@uclibc.org>:
> Author: aldot
> Date: 2007-06-22 01:47:09 -0700 (Fri, 22 Jun 2007)
> New Revision: 18892
>
> Log:
> - add a sample (pseudo-)board for a mips malta box
>
>
> Added:
>    trunk/buildroot/target/device/mips/
>    trunk/buildroot/target/device/mips/Makefile.in
>    trunk/buildroot/target/device/mips/linux26.config
>
> Modified:
>    trunk/buildroot/target/linux26.mk
>
>
> Changeset:
>
> Sorry, the patch is too large to include (1635 lines).
> Please use ViewCVS to see it!
>
> http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=18892
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>


-- 
Julien Letessier
<julien.letessier@technosens.fr>
