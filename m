From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 28 Dec 2013 18:10:58 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: bump to version 2.6.3
Message-ID: <1388250659-10192-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --disable-doc-install to configure script.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/xenomai/xenomai.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 786bdfd..2dd1bf6 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 2.6.2.1
+XENOMAI_VERSION = 2.6.3
 endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable/
@@ -19,7 +19,7 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/
+XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install
 
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
-- 
1.8.1.4
