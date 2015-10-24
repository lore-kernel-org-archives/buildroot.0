From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:53 +0200
Subject: [Buildroot] [PATCH v5 13/36] package/efl/libefl: add jp2k config
	option
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-14-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for webp format, add an option to enable the JPEG 2000
codec support in the efl libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename to libefl
    improve commit log
---
 package/efl/libefl/Config.in | 7 +++++++
 package/efl/libefl/libefl.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index e25911f..53adea2 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -51,6 +51,13 @@ config BR2_PACKAGE_LIBEFL_PNG
 	  This enables the loader code that loads png files using
 	  libpng.
 
+config BR2_PACKAGE_LIBEFL_JP2K
+	bool "libevas jp2k loader"
+	select BR2_PACKAGE_OPENJPEG
+	help
+	  This enables the loader code that loads jp2k files using
+	  openjpeg.
+
 config BR2_PACKAGE_LIBEFL_JPEG
 	bool "libevas jpeg loader"
 	help
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 3a4aab1..e53470d 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -201,6 +201,13 @@ else
 LIBEFL_CONF_OPTS += --enable-image-loader-tiff=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_JP2K),y)
+LIBEFL_CONF_OPTS += --enable-image-loader-jp2k=yes
+LIBEFL_DEPENDENCIES += openjpeg
+else
+LIBEFL_CONF_OPTS += --enable-image-loader-jp2k=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
 LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
 LIBEFL_DEPENDENCIES += webp
-- 
2.4.3
