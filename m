From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:25 +0200
Subject: [Buildroot] [RFC 15/37] package/efl: add webp dependency
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-16-git-send-email-romain.naour@openwide.fr>
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
index 9f204d6..ea607d7 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -65,6 +65,11 @@ config BR2_PACKAGE_EFL_TIFF
 	help
 	  This enables the loader code that loads tiff files.
 
+config BR2_PACKAGE_EFL_WEBP
+	bool "libevas webp image loader"
+	help
+	  This enables the loader code that loads images using WebP.
+
 endif # BR2_PACKAGE_EFL
 
 comment "efl needs udev /dev management and a (e)glibc toolchain w/ C++"
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 5ee3622..17a08fa 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -188,6 +188,13 @@ else
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
