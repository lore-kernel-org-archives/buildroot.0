From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 12:17:04 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/device/Atmel/u-boot
In-Reply-To: <20070729070516.A15AEA461B@busybox.net>
References: <20070729070516.A15AEA461B@busybox.net>
Message-ID: <20070730101704.GI23273@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 29, 2007 at 12:05:16AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-29 00:05:13 -0700 (Sun, 29 Jul 2007)
>New Revision: 19312
>
>Log:
>Reintroduce ATMEL_MIRROR in u-boot
>
>Modified:
>   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
>
>
>Changeset:
>Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
>===================================================================
>--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-29 06:51:35 UTC (rev 19311)
>+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-29 07:05:13 UTC (rev 19312)
>@@ -8,6 +8,8 @@
> #
> #############################################################
> UBOOT_VERSION:=1.2.0-atmel
>+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
>+#"))

This is redundant.
What about doing this once, cleanly?

target/device/Atmel/Makefile.in would be the obvious place where i'd put
this once and for all..
