From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 18:32:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/xenomai: drop unrecognized option
Message-ID: <20210119173208.436382-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-doc-install is not available since version 3.0.6 and
https://gitlab.denx.de/Xenomai/xenomai/-/commit/6076f0951c7c37917c625b1aa1cd6905c27310f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 11c69000df..7e3b130085 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -37,7 +37,7 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
+XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
 
 ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
 XENOMAI_CONF_OPTS += --with-core=mercury
-- 
2.29.2
