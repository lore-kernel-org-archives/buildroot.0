From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 18 Dec 2008 16:52:00 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20081218165200.C303576D12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-18 16:52:00 +0000 (Thu, 18 Dec 2008)
New Revision: 24449

Log:
toolchain/binutils: fix non-sysroot build

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-18 08:16:32 UTC (rev 24448)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-18 16:52:00 UTC (rev 24449)
@@ -109,8 +109,8 @@
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
+		--mandir=$(BR2_SYSROOT_PREFIX)/usr/share/man \
+		--infodir=$(BR2_SYSROOT_PREFIX)/usr/share/info \
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		$(BR2_CONFIGURE_STAGING_SYSROOT) \
 		$(DISABLE_NLS) \
