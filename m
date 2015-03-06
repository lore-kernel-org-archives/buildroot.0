From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Mar 2015 09:50:29 -0300
Subject: [Buildroot] [PATCH 1/6] samba4: install to staging
Message-ID: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required for packages that need libsmbclient.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 527d584..78d92ef 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -7,6 +7,7 @@
 SAMBA4_VERSION = 4.2.0
 SAMBA4_SITE = http://ftp.samba.org/pub/samba
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
+SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPLv3+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
@@ -113,6 +114,10 @@ define SAMBA4_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
+define SAMBA4_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
 define SAMBA4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
-- 
2.0.5
