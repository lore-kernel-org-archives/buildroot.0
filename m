From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:19:50 +0200
Subject: [Buildroot] [PACH v2 16/38] package/efl: add webp dependency
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1441747212-27421-17-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 5 +++++
 package/efl/efl.mk    | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index eb15e98..2f93ce6 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -64,6 +64,11 @@ config BR2_PACKAGE_EFL_TIFF
 	help
 	  This enables the loader code that loads tiff files.
 
+config BR2_PACKAGE_EFL_WEBP
+	bool "libevas webp image loader"
+	help
+	  This enables the loader code that loads images using WebP.
+
 endif # BR2_PACKAGE_EFL
 
 comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library, wchar"
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index c28fe06..f8a981d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -193,6 +193,13 @@ else
 EFL_CONF_OPTS += --enable-image-loader-tiff=no
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_WEBP),y)
+EFL_CONF_OPTS += --enable-image-loader-webp=yes
+EFL_DEPENDENCIES += webp
+else
+EFL_CONF_OPTS += --enable-image-loader-webp=no
+endif
+
 $(eval $(autotools-package))
 
 ################################################################################
-- 
2.4.3
