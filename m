From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 14:52:42 +0100
Subject: [Buildroot] [PATCH] package/libassuan: fixup libassuan-config
Message-ID: <20181116135242.27171-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libassuan library installs libassuan-config, but it is not
currently fixed up by our <pkg>_CONFIG_SCRIPTS logic. While this
doesn't cause any problem today, it fails badly with per-package
folders, so let's use <pkg>_CONFIG_SCRIPTS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index e807086b73..4dc8f70d1f 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -13,5 +13,6 @@ LIBASSUAN_INSTALL_STAGING = YES
 LIBASSUAN_DEPENDENCIES = libgpg-error
 LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 
 $(eval $(autotools-package))
-- 
2.19.1
