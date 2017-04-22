From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:47 +0200
Subject: [Buildroot] [PATCH v8 04/12] e2fsprogs: remove uuidgen support
In-Reply-To: <20170422115955.22718-1-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
Message-ID: <20170422115955.22718-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

In fact, uuidgen was never built because we pass --disable-libuuid. So
the option was a NOP.

Remove the license info for libuuid.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout:
 - do not remove --disable-uuidd - even though that is implied by
   --disable-libuuid, it's better to be explicit about it;
 - remove license info of libuuid]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in    | 7 +++----
 package/e2fsprogs/e2fsprogs.mk | 5 ++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 055ad5067f..79b77eac4c 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -7,6 +7,9 @@ menuconfig BR2_PACKAGE_E2FSPROGS
 	help
 	  The EXT2 file system utilities.
 
+	  The uuid utilities (uuidd, uuidgen) are not built. Use the
+	  ones from util-linux, instead.
+
 	  http://e2fsprogs.sourceforge.net
 
 if BR2_PACKAGE_E2FSPROGS
@@ -95,8 +98,4 @@ config BR2_PACKAGE_E2FSPROGS_TUNE2FS
 	default y
 	select BR2_PACKAGE_E2FSPROGS_E2LABEL
 
-config BR2_PACKAGE_E2FSPROGS_UUIDGEN
-	bool "uuidgen"
-	default y
-
 endif
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 3f235c5372..896f01414d 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -7,8 +7,8 @@
 E2FSPROGS_VERSION = 1.43.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
-E2FSPROGS_LICENSE = GPL-2.0, BSD-3-Clause (libuuid), MIT-like with advertising clause (libss and libet)
-E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
+E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
+E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 # we don't have a host-util-linux
@@ -91,7 +91,6 @@ E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += usr/sbin/logsave
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LSATTR) += usr/bin/lsattr
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += usr/sbin/mklost+found
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += usr/bin/uuidgen
 
 # files to remove
 E2FSPROGS_TXTTARGETS_ = \
-- 
2.11.0
