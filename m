From: Simon Pasch <fpasch@googlemail.com>
Date: Fri, 11 Apr 2008 13:46:57 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
In-Reply-To: <20080318115143.B649712CFC1@busybox.net>
References: <20080318115143.B649712CFC1@busybox.net>
Message-ID: <f90898420804110446v7e60cae4iaec0da33ef0a5ee0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this change it isn't possible any more to create a custom
x86-board with kernel-patches and kernel-configuration because
"trunk/buildroot/target/device/x86/i386/Makefile.in" overrides custom
BOARD_PATH.

Perhaps it should be modfied or reverted.



2008/3/18, ulf at uclibc.org <ulf@uclibc.org>:
> Author: ulf
>  Date: 2008-03-18 04:51:43 -0700 (Tue, 18 Mar 2008)
>  New Revision: 21389
>
>  Log:
>  Use BOARD_PATH instead of BR2_BOARD_PATH for x86
>
>  Modified:
>    trunk/buildroot/target/device/x86/i386/Makefile.in
>
>
>  Changeset:
>  Modified: trunk/buildroot/target/device/x86/i386/Makefile.in
>  ===================================================================
>  --- trunk/buildroot/target/device/x86/i386/Makefile.in  2008-03-18 11:47:31 UTC (rev 21388)
>  +++ trunk/buildroot/target/device/x86/i386/Makefile.in  2008-03-18 11:51:43 UTC (rev 21389)
>  @@ -1,8 +1,9 @@
>  -BR2_BOARD_PATH:=target/device/x86/i386
>  +# BR2_BOARD_PATH:=target/device/x86/i386
>  +BOARD_PATH:=target/device/x86/i386
>
>   ifeq ($(strip $(BR2_PACKAGE_LINUX_KCONFIG)),)
>   ifndef LINUX26_KCONFIG
>  -LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
>  +LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
>   endif
>   else
>   LINUX26_KCONFIG=$(strip $(BR2_PACKAGE_LINUX_KCONFIG))
>  @@ -16,4 +17,4 @@
>   LINUX26_FORMAT=$(strip $(BR2_PACKAGE_LINUX_FORMAT))
>   endif
>
>  -KERNEL_HEADERS_PATCH_DIR:=$(BR2_BOARD_PATH)/kernel-header-patches
>  +KERNEL_HEADERS_PATCH_DIR:=$(BOARD_PATH)/kernel-header-patches
>
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
