From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 09:19:52 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20070729173645.72ECCA4577@busybox.net>
References: <20070729173645.72ECCA4577@busybox.net>
Message-ID: <20070730071952.GA21479@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 29, 2007 at 10:36:45AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-29 10:36:45 -0700 (Sun, 29 Jul 2007)
>New Revision: 19330
>
>Log:
>gcc config for AVR32
>
>Modified:
>   trunk/buildroot/toolchain/gcc/Config.in
>
>
>Changeset:
>Modified: trunk/buildroot/toolchain/gcc/Config.in
>===================================================================
>--- trunk/buildroot/toolchain/gcc/Config.in	2007-07-29 17:34:20 UTC (rev 19329)
>+++ trunk/buildroot/toolchain/gcc/Config.in	2007-07-29 17:36:45 UTC (rev 19330)

>@@ -147,27 +159,29 @@
> config BR2_INSTALL_LIBSTDCPP
> 	bool "Build/install c++ compiler and libstdc++?"
> 	default n
>-	# >= 4.2.0 work fine without LARGEFILE
>-	select BR2_LARGEFILE if BR2_GCC_VERSION_3_3_5 || BR2_GCC_VERSION_3_3_6 || BR2_GCC_VERSION_3_4_2 || BR2_GCC_VERSION_3_4_3 || BR2_GCC_VERSION_3_4_4 || BR2_GCC_VERSION_3_4_5 || BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_0 || BR2_GCC_VERSION_4_0_1 || BR2_GCC_VERSION_4_0_2 || BR2_GCC_VERSION_4_0_3 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_0 || BR2_GCC_VERSION_4_1_1 || BR2_GCC_VERSION_4_1_2
>+	# huh? why so? select BR2_LARGEFILE
>+	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_3
> 	help
> 	  Build/install c++ compiler and libstdc++?

heh! Why did you revert my change ?

Please fix.
