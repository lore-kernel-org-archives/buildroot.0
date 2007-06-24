From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 24 Jun 2007 13:34:25 +0200
Subject: [Buildroot] 4.1.2 build breakage [was: Re: svn commit:
	trunk/buildroot/toolchain/gcc]
In-Reply-To: <20070624113006.5A946A65FE@busybox.net>
References: <20070624113006.5A946A65FE@busybox.net>
Message-ID: <20070624113425.GV4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 24, 2007 at 04:30:06AM -0700, aldot at uclibc.org wrote:
>Author: aldot
>Date: 2007-06-24 04:30:05 -0700 (Sun, 24 Jun 2007)
>New Revision: 18904
>
>Log:
>- disable sysroot support for anything but the current, stable release series

> config BR2_TOOLCHAIN_SYSROOT
> #	bool "Enable toolchain with --sysroot support"
> 	bool
>-	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6
>+	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 &&!BR2_GCC_VERSION_4_0_0 && !BR2_GCC_VERSION_4_0_1 && !BR2_GCC_VERSION_4_0_2 && !BR2_GCC_VERSION_4_0_3 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_0 && !BR2_GCC_VERSION_4_1_1 && !BR2_GCC_VERSION_4_1_2
> 	default y
> 	help
> 	  Enables --sysroot=dir for binutils and gcc.
>@@ -122,6 +122,9 @@
> 	  /usr/include and libraries in /usr/lib, it will instead search
> 	  dir/usr/include and dir/usr/lib.
> 
>+	  This does not work with gcc < 4.2.0 (4.1.2 gets
>+	  ORIGINAL_AS_FOR_TARGET wrong)
>+

If anyone uses 4.1.2 and wants sysroot support then send a patch. In my
mind, 4.2.0 is the current, stable release which is actively
maintained and works.

regards,
