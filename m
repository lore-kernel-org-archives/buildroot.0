From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Sat, 21 Sep 2019 09:11:11 +0000
Subject: [Buildroot] [PATCH 1/1] package/libsodium: add config for minimal
 build
Message-ID: <20190921091110.18708-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/libsodium/Config.in    | 9 +++++++++
 package/libsodium/libsodium.mk | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
index 47b9bb350c..e9b9960dae 100644
--- a/package/libsodium/Config.in
+++ b/package/libsodium/Config.in
@@ -4,3 +4,12 @@ config BR2_PACKAGE_LIBSODIUM
 	  A modern and easy-to-use crypto library.
 
 	  http://libsodium.org/
+
+if BR2_PACKAGE_LIBSODIUM
+
+config BR2_PACKAGE_LIBSODIUM_MINIMAL
+	bool "minimal"
+	help
+	  Build minimal version.
+
+endif
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index a94a8271c5..17bccb5796 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -14,5 +14,9 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSODIUM_MINIMAL),y)
+LIBSODIUM_CONF_OPTS += --enable-minimal
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.19.1
