From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:16 +0200
Subject: [Buildroot] [06/37] package/libelementary: move to package directory
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-7-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add efl reverse dependencies.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                                | 1 +
 package/efl/Config.in                            | 1 -
 package/{efl => }/libelementary/Config.in        | 6 ++++--
 package/{efl => }/libelementary/libelementary.mk | 0
 4 files changed, 5 insertions(+), 3 deletions(-)
 rename package/{efl => }/libelementary/Config.in (77%)
 rename package/{efl => }/libelementary/libelementary.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 0b2c131..4dfafe7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,6 +241,7 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libelementary/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index cb91660..cf82f8b 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -20,7 +20,6 @@ source "package/efl/libevas-generic-loaders/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
-source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/libelementary/Config.in b/package/libelementary/Config.in
similarity index 77%
rename from package/efl/libelementary/Config.in
rename to package/libelementary/Config.in
index 4f62592..320d160 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/libelementary/Config.in
@@ -1,5 +1,5 @@
-comment "libelementary needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "libelementary needs a toolchain w/ threads, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
@@ -8,6 +8,8 @@ config BR2_PACKAGE_LIBELEMENTARY
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBEDJE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
 	depends on !BR2_STATIC_LIBS
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
diff --git a/package/efl/libelementary/libelementary.mk b/package/libelementary/libelementary.mk
similarity index 100%
rename from package/efl/libelementary/libelementary.mk
rename to package/libelementary/libelementary.mk
-- 
2.4.3
