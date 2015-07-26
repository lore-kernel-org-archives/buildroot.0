From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:27 +0200
Subject: [Buildroot] [RFC 17/37] package/efl: add jp2k config option
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-18-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 7 +++++++
 package/efl/efl.mk    | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 4077565..d36a38e 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -51,6 +51,13 @@ config BR2_PACKAGE_EFL_PNG
 	  This enables the loader code that loads png files using
 	  libpng.
 
+config BR2_PACKAGE_EFL_JP2K
+	bool "libevas jp2k loader"
+	select BR2_PACKAGE_OPENJPEG
+	help
+	  This enables the loader code that loads jp2k files using
+	  openjpeg.
+
 config BR2_PACKAGE_EFL_JPEG
 	bool "libevas jpeg loader"
 	help
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 8f5c9fb..201e578 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -194,6 +194,13 @@ else
 EFL_CONF_OPTS += --enable-image-loader-tiff=no
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_JP2K),y)
+EFL_CONF_OPTS += --enable-image-loader-jp2k=yes
+EFL_DEPENDENCIES += openjpeg
+else
+EFL_CONF_OPTS += --enable-image-loader-jp2k=no
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_WEBP),y)
 EFL_CONF_OPTS += --enable-image-loader-webp=yes
 EFL_DEPENDENCIES += webp
-- 
2.4.3
