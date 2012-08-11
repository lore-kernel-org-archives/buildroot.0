From: Jonathan Liu <net147@gmail.com>
Date: Sat, 11 Aug 2012 16:31:47 +1000
Subject: [Buildroot] [PATCH] opkg: bump version to svn r635
Message-ID: <1344666707-27833-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is recommended to use the most recent revision from subversion as it
contains various fixes.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/opkg/opkg.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index be67f8e..486ccbb 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,12 +4,20 @@
 #
 #############################################################
 
-OPKG_VERSION = 0.1.8
+OPKG_VERSION = 635
 OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
-OPKG_SITE = http://opkg.googlecode.com/files
+OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
+OPKG_SITE_METHOD = svn
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPT = --disable-curl --disable-gpg
 
+define OPKG_AUTOGEN
+	cd $(@D) ; \
+	./autogen.sh
+endef
+
+OPKG_PRE_CONFIGURE_HOOKS += OPKG_AUTOGEN
+
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
 	mkdir -p $(TARGET_DIR)/usr/lib/opkg
-- 
1.7.11.3
