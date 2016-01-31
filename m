From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:09:24 +0100
Subject: [Buildroot] [git commit] package/libserialport: bump version to
	0.1.1
Message-ID: <20160201224702.74D5F7F87D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff4d8da4984268571cc72a9a192aed617f9f5882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to upstream tarball, remove autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libserialport/libserialport.hash |  2 ++
 package/libserialport/libserialport.mk   | 13 ++-----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/libserialport/libserialport.hash b/package/libserialport/libserialport.hash
new file mode 100644
index 0000000..f261902
--- /dev/null
+++ b/package/libserialport/libserialport.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d	libserialport-0.1.1.tar.gz
diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
index 3dcbccb..d8c3a3d 100644
--- a/package/libserialport/libserialport.mk
+++ b/package/libserialport/libserialport.mk
@@ -4,20 +4,11 @@
 #
 ################################################################################
 
-LIBSERIALPORT_VERSION = f77bb46df5d883527da8b7eb4a5328ea7e990dbb
-# No https access on upstream git
-LIBSERIALPORT_SITE = git://sigrok.org/libserialport
+LIBSERIALPORT_VERSION = 0.1.1
+LIBSERIALPORT_SITE = http://sigrok.org/download/source/libserialport
 LIBSERIALPORT_LICENSE = LGPLv3+
 LIBSERIALPORT_LICENSE_FILES = COPYING
-# Git checkout has no configure script
-LIBSERIALPORT_AUTORECONF = YES
 LIBSERIALPORT_INSTALL_STAGING = YES
 LIBSERIALPORT_DEPENDENCIES = host-pkgconf
 
-define LIBSERIALPORT_ADD_MISSING
-	mkdir -p $(@D)/autostuff
-endef
-
-LIBSERIALPORT_PRE_CONFIGURE_HOOKS += LIBSERIALPORT_ADD_MISSING
-
 $(eval $(autotools-package))
