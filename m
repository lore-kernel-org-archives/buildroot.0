From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 27 Apr 2013 20:04:57 +0200
Subject: [Buildroot] [git commit] pciutils: bump to version 3.2.0
Message-ID: <20130427180801.DE7929B3CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56e99deca7c242837dcfacc73dc2e3a0715d174d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 6219711..2cd10c0 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCIUTILS_VERSION = 3.1.10
+PCIUTILS_VERSION = 3.2.0
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPLv2+
@@ -24,6 +24,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	PCIUTILS_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_KMOD),y)
+	PCIUTILS_DEPENDENCIES += kmod
+	PCIUTILS_KMOD = yes
+else
+	PCIUTILS_KMOD = no
+endif
+
 define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
 	$(SED) 's/uname -s/echo Linux/' \
@@ -43,6 +50,7 @@ define PCIUTILS_BUILD_CMDS
 		SHARED=$(PCIUTILS_SHARED) \
 		ZLIB=$(PCIUTILS_ZLIB) \
 		DNS=$(PCIUTILS_DNS) \
+		LIBKMOD=$(PCIUTILS_KMOD) \
 		PREFIX=/usr
 endef
 
