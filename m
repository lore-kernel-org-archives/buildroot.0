From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:21 +0200
Subject: [Buildroot] [PATCH v3 16/37] package/efl: add jp2k config option
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-17-git-send-email-romain.naour@openwide.fr>
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
index 00b14ca..75369b7 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -50,6 +50,13 @@ config BR2_PACKAGE_EFL_PNG
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
index 35ee466..9938b6f 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -200,6 +200,13 @@ else
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
