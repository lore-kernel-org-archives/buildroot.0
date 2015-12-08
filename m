From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  9 Dec 2015 00:02:05 +0100
Subject: [Buildroot] [PATCH v8 02/33] package/libevas-generic-loaders: move
	to package directory
In-Reply-To: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
References: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449615756-19115-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As for expedite package, there is no advantage for efl related
packages to share the same version number anymore
(except for efl and libelementary).

Also, we usually do not have a sub-directory for a family of related
packages which doen't share the same version number, so move
libevas-generic-loaders to package directory.
Libevas-generic-loaders appear now in "Libraries" -> "Graphics" in
the Kconfig menu.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: keep the reverse dependency on BR2_USE_WCHAR (Yann E.Morin)
v5: Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
v4: improve the commit log (ThomasP)
    move libevas-generic-loaders to "Libraries" -> "Graphics" (ThomasP)
    fix package comment dependency on BR2_USE_MMU
---
 package/Config.in                                                    | 1 +
 package/efl/Config.in                                                | 1 -
 package/{efl => }/libevas-generic-loaders/Config.in                  | 1 +
 package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk | 0
 4 files changed, 2 insertions(+), 1 deletion(-)
 rename package/{efl => }/libevas-generic-loaders/Config.in (97%)
 rename package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 2a2fdfb..ac29967 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -826,6 +826,7 @@ menu "Graphics"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libevas-generic-loaders/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeimage/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index cb91660..7ce5a36 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -16,7 +16,6 @@ source "package/efl/libeet/Config.in"
 source "package/efl/libefreet/Config.in"
 source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
-source "package/efl/libevas-generic-loaders/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
similarity index 97%
rename from package/efl/libevas-generic-loaders/Config.in
rename to package/libevas-generic-loaders/Config.in
index 3f7581f..c69f5e8 100644
--- a/package/efl/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	bool "libevas generic loaders"
+	depends on BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
similarity index 100%
rename from package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
rename to package/libevas-generic-loaders/libevas-generic-loaders.mk
-- 
2.4.3
