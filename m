From: Jack Breese <jack@kumunetworks.com>
Date: Wed,  5 Apr 2017 18:09:08 -0700
Subject: [Buildroot] [PATCH 1/1] gnupg: Add options for SHA-256 and SHA-512
	hashes
Message-ID: <20170406010908.95234-1-jack@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jack Breese <jack@kumunetworks.com>
---
 package/gnupg/Config.in | 10 ++++++++++
 package/gnupg/gnupg.mk  | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 30f215fed..87b3afe76 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -26,6 +26,16 @@ config BR2_PACKAGE_GNUPG_RSA
 	help
 	  Support for RSA public key algorithm
 
+config BR2_PACKAGE_GNUPG_SHA256
+	bool "SHA256 support"
+	help
+	  Support for SHA256 hash algorithm
+
+config BR2_PACKAGE_GNUPG_SHA512
+	bool "SHA512 support"
+	help
+	  Support for SHA512 hash algorithm
+
 config BR2_PACKAGE_GNUPG_GPGV
 	bool "gpgv"
 	help
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index caa9d2c46..be3e00282 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -48,6 +48,18 @@ else
 GNUPG_CONF_OPTS += --disable-rsa
 endif
 
+ifeq ($(BR2_PACKAGE_GNUPG_SHA256),y)
+GNUPG_CONF_OPTS += --enable-sha256
+else
+GNUPG_CONF_OPTS += --disable-sha256
+endif
+
+ifeq ($(BR2_PACKAGE_GNUPG_SHA512),y)
+GNUPG_CONF_OPTS += --enable-sha512
+else
+GNUPG_CONF_OPTS += --disable-sha512
+endif
+
 ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
 define GNUPG_REMOVE_GPGV
 	rm -f $(TARGET_DIR)/usr/bin/gpgv
-- 
2.11.0 (Apple Git-81)
