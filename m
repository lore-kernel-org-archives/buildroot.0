From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 20:33:16 +0200
Subject: [Buildroot] [PATCH 4/5] libglib12: remove deprecated package
In-Reply-To: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d09721c451a358a02f31f82f9f63587b16def22b.1284316269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is part of the removal of the Gtk 1.x stack.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_nptl_toolchain_defconfig          |    1 -
 configs/arm_toolchain_defconfig               |    1 -
 configs/at91rm9200df_defconfig                |    1 -
 configs/at91rm9200df_ext_bare_defconfig       |    1 -
 configs/at91rm9200df_ext_defconfig            |    1 -
 configs/at91sam9260dfc_defconfig              |    1 -
 configs/at91sam9260dfc_ext_bare_defconfig     |    1 -
 configs/at91sam9260dfc_ext_defconfig          |    1 -
 configs/at91sam9260pf_defconfig               |    1 -
 configs/at91sam9261ek_defconfig               |    1 -
 configs/at91sam9261ek_ext_bare_defconfig      |    1 -
 configs/at91sam9261ek_ext_defconfig           |    1 -
 configs/at91sam9263ek_defconfig               |    1 -
 configs/at91sam9263ek_ext_bare_defconfig      |    1 -
 configs/at91sam9263ek_ext_defconfig           |    1 -
 configs/at91sam9g20dfc_defconfig              |    1 -
 configs/at91sam9g20dfc_ext_bare_defconfig     |    1 -
 configs/at91sam9g20dfc_ext_defconfig          |    1 -
 configs/atngw100-base_defconfig               |    1 -
 configs/atngw100_defconfig                    |    1 -
 configs/atstk1005_defconfig                   |    1 -
 configs/atstk100x_defconfig                   |    1 -
 configs/i386_defconfig                        |    1 -
 configs/i686_defconfig                        |    1 -
 configs/integrator926_defconfig               |    1 -
 configs/integrator926_huge_defconfig          |    1 -
 configs/kb9202_defconfig                      |    1 -
 configs/v100sc2_defconfig                     |    1 -
 package/Config.in                             |    1 -
 package/libglib12/Config.in                   |    7 -
 package/libglib12/glib-1.2.10-gcc34-fix.patch |   41 -
 package/libglib12/libglib-libtool.patch       |   88 --
 package/libglib12/libglib12.mk                |   97 --
 package/libglib12/libglib_configure.patch     | 1800 -------------------------
 34 files changed, 0 insertions(+), 2062 deletions(-)
 delete mode 100644 package/libglib12/Config.in
 delete mode 100644 package/libglib12/glib-1.2.10-gcc34-fix.patch
 delete mode 100644 package/libglib12/libglib-libtool.patch
 delete mode 100644 package/libglib12/libglib12.mk
 delete mode 100644 package/libglib12/libglib_configure.patch

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 02e6844..d7b26a5 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -568,7 +568,6 @@ BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 # BR2_PACKAGE_LIBDAEMON is not set
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_LIBOIL is not set
 
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index bd6f3e2..08f5485 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -615,7 +615,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 8abbef9..f589eeb 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -721,7 +721,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index fec2c04..651ac37 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -539,7 +539,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 54755e7..d261fb8 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -650,7 +650,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index c0dbac1..8aeff0f 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -735,7 +735,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 540eef6..9527522 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -539,7 +539,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 3a6191d..e9ad28b 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -658,7 +658,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 0bc17ae..a2a7fef 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -501,7 +501,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_ATK is not set
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 BR2_PACKAGE_FONTCONFIG=y
 BR2_PACKAGE_FREETYPE=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index dd63d5b..5d45cd4 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -737,7 +737,6 @@ BR2_PACKAGE_PANGO=y
 # BR2_PACKAGE_LIBDRM is not set
 BR2_PACKAGE_LIBERATION=y
 # BR2_PACKAGE_LIBGLADE is not set
-BR2_PACKAGE_LIBGLIB12=y
 BR2_PACKAGE_LIBGLIB2=y
 BR2_PACKAGE_LIBGTK2=y
 BR2_PACKAGE_LIBGTK2_ENGINES=y
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index ab8851f..99b124d 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -542,7 +542,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 367bcfa..45c8744 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -696,7 +696,6 @@ BR2_PACKAGE_PANGO=y
 # BR2_PACKAGE_LIBDRM is not set
 BR2_PACKAGE_LIBERATION=y
 # BR2_PACKAGE_LIBGLADE is not set
-BR2_PACKAGE_LIBGLIB12=y
 BR2_PACKAGE_LIBGLIB2=y
 BR2_PACKAGE_LIBGTK2=y
 BR2_PACKAGE_LIBGTK2_ENGINES=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 8fb9b00..e4200e1 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -734,7 +734,6 @@ BR2_PACKAGE_PANGO=y
 # BR2_PACKAGE_LIBDRM is not set
 BR2_PACKAGE_LIBERATION=y
 # BR2_PACKAGE_LIBGLADE is not set
-BR2_PACKAGE_LIBGLIB12=y
 BR2_PACKAGE_LIBGLIB2=y
 BR2_PACKAGE_LIBGTK2=y
 BR2_PACKAGE_LIBGTK2_ENGINES=y
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 2578b95..b9712b5 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -541,7 +541,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 3f6e478..5c499e9 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -659,7 +659,6 @@ BR2_PACKAGE_PANGO=y
 # BR2_PACKAGE_LIBDRM is not set
 BR2_PACKAGE_LIBERATION=y
 # BR2_PACKAGE_LIBGLADE is not set
-BR2_PACKAGE_LIBGLIB12=y
 BR2_PACKAGE_LIBGLIB2=y
 BR2_PACKAGE_LIBGTK2=y
 BR2_PACKAGE_LIBGTK2_ENGINES=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index bdab741..bd46557 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -669,7 +669,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 49a5124..a48822a 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -539,7 +539,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index cb21324..f233890 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -658,7 +658,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 0af8bc2..b498524 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -586,7 +586,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 01d0d7a..619cae6 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -544,7 +544,6 @@ BR2_PACKAGE_ZLIB=y
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_LIBOIL is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 2e6d94f..48ea915 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -631,7 +631,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index ca9902f..4be9767 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -730,7 +730,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 184bc30..7910511 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -574,7 +574,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index e537a8a..e75f105 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -574,7 +574,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index cd25820..724b025 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -572,7 +572,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index cc6e866..2b20b0b 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -551,7 +551,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 842a8a6..ee2db69 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -557,7 +557,6 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
 # BR2_PACKAGE_LIBSEXY is not set
 
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index c82e7d7..f71a0d3 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -574,7 +574,6 @@ BR2_PACKAGE_QT_OPENSSL=y
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
-# BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
diff --git a/package/Config.in b/package/Config.in
index 62ff1b6..50f8841 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -315,7 +315,6 @@ source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
-source "package/libglib12/Config.in"
 source "package/libglib2/Config.in"
 source "package/liboil/Config.in"
 source "package/startup-notification/Config.in"
diff --git a/package/libglib12/Config.in b/package/libglib12/Config.in
deleted file mode 100644
index f6b7d24..0000000
--- a/package/libglib12/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBGLIB12
-	bool "libglib12"
-	depends on BR2_DEPRECATED
-	help
-	  Low-level core library that forms the basis of GTK+ and GNOME.
-
-	  http://www.gtk.org/
diff --git a/package/libglib12/glib-1.2.10-gcc34-fix.patch b/package/libglib12/glib-1.2.10-gcc34-fix.patch
deleted file mode 100644
index 1b89648..0000000
--- a/package/libglib12/glib-1.2.10-gcc34-fix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
---- glib-1.2.10/gstrfuncs.c.orig	2001-02-27 07:00:22.000000000 +0100
-+++ glib-1.2.10/gstrfuncs.c	2004-03-01 13:19:49.531603760 +0100
-@@ -867,7 +867,7 @@
-                   /* beware of positional parameters
-                    */
-                 case '$':
--                  g_warning (G_GNUC_PRETTY_FUNCTION
-+                  g_warning ("%s%s", G_GNUC_PRETTY_FUNCTION,
-                              "(): unable to handle positional parameters (%%n$)");
-                   len += 1024; /* try adding some safety padding */
-                   break;
-@@ -1034,7 +1034,7 @@
-                   /*          n   .   dddddddddddddddddddddddd   E   +-  eeee */
-                   conv_len += 1 + 1 + MAX (24, spec.precision) + 1 + 1 + 4;
-                   if (spec.mod_extra_long)
--                    g_warning (G_GNUC_PRETTY_FUNCTION
-+                    g_warning ("%s%s", G_GNUC_PRETTY_FUNCTION,
-                                "(): unable to handle long double, collecting double only");
- #ifdef HAVE_LONG_DOUBLE
- #error need to implement special handling for long double
-@@ -1077,7 +1077,7 @@
-                   conv_done = TRUE;
-                   if (spec.mod_long)
-                     {
--                      g_warning (G_GNUC_PRETTY_FUNCTION
-+                      g_warning ("%s%s", G_GNUC_PRETTY_FUNCTION,
-                                  "(): unable to handle wide char strings");
-                       len += 1024; /* try adding some safety padding */
-                     }
-@@ -1108,9 +1108,8 @@
-                   conv_len += format - spec_start;
-                   break;
-                 default:
--                  g_warning (G_GNUC_PRETTY_FUNCTION
--                             "(): unable to handle `%c' while parsing format",
--                             c);
-+                  g_warning ("%s(): unable to handle `%c' while parsing format",
-+                             G_GNUC_PRETTY_FUNCTION, c);
-                   break;
-                 }
-               conv_done |= conv_len > 0;
diff --git a/package/libglib12/libglib-libtool.patch b/package/libglib12/libglib-libtool.patch
deleted file mode 100644
index 5a78c69..0000000
--- a/package/libglib12/libglib-libtool.patch
+++ /dev/null
@@ -1,88 +0,0 @@
---- glib/ltconfig
-+++ glib/ltconfig
-@@ -450,6 +450,7 @@
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case "$host_os" in
- linux-gnu*) ;;
-+linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1981,6 +1982,28 @@
-   fi
-   ;;
- 
-+linux-uclibc*)
-+  version_type=linux
-+  need_lib_prefix=no
-+  need_version=no
-+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
-+  soname_spec='${libname}${release}.so$major'
-+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
-+  shlibpath_var=LD_LIBRARY_PATH
-+  shlibpath_overrides_runpath=no
-+  # deplibs_check_method=pass_all
-+  deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [LM]SB (shared object|dynamic lib )'
-+  file_magic_cmd=/usr/bin/file
-+  file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  # This implies no fast_install, which is unacceptable.
-+  # Some rework will be needed to allow for fast_install
-+  # before this can be enabled.
-+  # Note: copied from linux-gnu, and may not be appropriate.
-+  hardcode_into_libs=yes
-+  # Assume using the uClibc dynamic linker.
-+  dynamic_linker="uClibc ld.so"
-+  ;;
-+
- netbsd*)
-   version_type=sunos
-   if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
---- g/configure
-+++ g/configure
-@@ -966,6 +966,7 @@
- host_vendor=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
- host_os=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
- echo "$ac_t""$host" 1>&6
-+host_alias=$host
- 
- echo $ac_n "checking build system type""... $ac_c" 1>&6
- echo "configure:972: checking build system type" >&5
-diff -urN glib-1.2.10-0rig/ltconfig glib-1.2.10/ltconfig
---- glib-1.2.10-0rig/ltconfig	2009-01-17 02:56:10.000000000 +0100
-+++ glib-1.2.10/ltconfig	2009-01-17 02:55:40.000000000 +0100
-@@ -448,6 +448,9 @@
- fi
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
-+echo $ac_n "host_os... $host_os" 1>&5
-+echo $ac_n "host_os... $host_os" 1>&6
-+
- case "$host_os" in
- linux-gnu*) ;;
- linux-uclibc*) ;;
-@@ -761,6 +764,7 @@
-     ;;
-   *)
-     can_build_shared=no
-+    echo "$progname:764: No OS found: host_os = $host_os" >&5
-     ;;
-   esac
- fi
-@@ -1791,6 +1795,8 @@
- # If you have `file' or equivalent on your system and you're not sure
- # whether `pass_all' will *always* work, you probably want this one.
- echo $ac_n "checking dynamic linker characteristics... $ac_c" 1>&6
-+echo $ac_n "host_os... $host_os" 1>&5
-+echo $ac_n "host_os... $host_os" 1>&6
- case "$host_os" in
- aix3*)
-   version_type=linux
-@@ -1982,7 +1988,7 @@
-   fi
-   ;;
- 
--linux-uclibc*)
-+*-linux | linux-uclibc*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/package/libglib12/libglib12.mk b/package/libglib12/libglib12.mk
deleted file mode 100644
index 6d7d101..0000000
--- a/package/libglib12/libglib12.mk
+++ /dev/null
@@ -1,97 +0,0 @@
-#############################################################
-#
-# libglib1.2
-#
-#############################################################
-LIBGLIB12_VERSION:=1.2.10
-LIBGLIB12_SOURCE:=glib-$(LIBGLIB12_VERSION).tar.gz
-LIBGLIB12_SITE:=http://ftp.gtk.org/pub/gtk/v1.2
-LIBGLIB12_CAT:=$(ZCAT)
-LIBGLIB12_DIR:=$(BUILD_DIR)/glib-$(LIBGLIB12_VERSION)
-LIBGLIB12_BINARY:=libglib.a
-
-$(DL_DIR)/$(LIBGLIB12_SOURCE):
-	 $(call DOWNLOAD,$(LIBGLIB12_SITE),$(LIBGLIB12_SOURCE))
-
-$(LIBGLIB12_DIR)/.unpacked: $(DL_DIR)/$(LIBGLIB12_SOURCE)
-	$(LIBGLIB12_CAT) $(DL_DIR)/$(LIBGLIB12_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBGLIB12_DIR) package/libglib12/ \*.patch*
-	$(CONFIG_UPDATE) $(LIBGLIB12_DIR)
-	touch $@
-
-$(LIBGLIB12_DIR)/.configured: $(LIBGLIB12_DIR)/.unpacked
-	(cd $(LIBGLIB12_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-shared \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(LIBGLIB12_DIR)/.libs/$(LIBGLIB12_BINARY): $(LIBGLIB12_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(LIBGLIB12_DIR)
-
-$(STAGING_DIR)/lib/$(LIBGLIB12_BINARY): $(LIBGLIB12_DIR)/.libs/$(LIBGLIB12_BINARY)
-	$(MAKE) prefix=$(STAGING_DIR) \
-	    exec_prefix=$(STAGING_DIR) \
-	    bindir=$(STAGING_DIR)/bin \
-	    sbindir=$(STAGING_DIR)/sbin \
-	    libexecdir=$(STAGING_DIR)/bin \
-	    datadir=$(STAGING_DIR)/share \
-	    sysconfdir=$(STAGING_DIR)/etc \
-	    sharedstatedir=$(STAGING_DIR)/com \
-	    localstatedir=$(STAGING_DIR)/var \
-	    libdir=$(STAGING_DIR)/lib \
-	    includedir=$(STAGING_DIR)/usr/include \
-	    oldincludedir=$(STAGING_DIR)/include \
-	    infodir=$(STAGING_DIR)/info \
-	    mandir=$(STAGING_DIR)/man \
-	    -C $(LIBGLIB12_DIR) install
-
-$(TARGET_DIR)/lib/libglib-1.2.so.0.0.10: $(STAGING_DIR)/lib/$(LIBGLIB12_BINARY)
-	cp -dpf $(STAGING_DIR)/lib/libglib.so $(TARGET_DIR)/lib/
-	cp -dpf $(STAGING_DIR)/lib/libglib-1.2.so.0 $(TARGET_DIR)/lib/
-	cp -dpf $(STAGING_DIR)/lib/libglib-1.2.so.0.0.10 $(TARGET_DIR)/lib/
-	cp -dpf $(STAGING_DIR)/lib/libgmodule.so $(TARGET_DIR)/lib/
-	cp -dpf $(STAGING_DIR)/lib/libgmodule-1.2.so.0 $(TARGET_DIR)/lib/
-	cp -dpf $(STAGING_DIR)/lib/libgmodule-1.2.so.0.0.10 $(TARGET_DIR)/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libglib-1.2.so.0.0.10
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgmodule-1.2.so.0.0.10
-
-libglib12-source: $(DL_DIR)/$(LIBGLIB12_SOURCE)
-
-libglib12-unpacked: $(LIBGLIB12_DIR)/.unpacked
-
-libglib12: $(TARGET_DIR)/lib/libglib-1.2.so.0.0.10
-
-libglib12-clean:
-	rm -f $(TARGET_DIR)/lib/$(LIBGLIB12_BINARY)
-	-$(MAKE) -C $(LIBGLIB12_DIR) clean
-
-libglib12-dirclean:
-	rm -rf $(LIBGLIB12_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBGLIB12),y)
-TARGETS+=libglib12
-endif
diff --git a/package/libglib12/libglib_configure.patch b/package/libglib12/libglib_configure.patch
deleted file mode 100644
index 632669a..0000000
--- a/package/libglib12/libglib_configure.patch
+++ /dev/null
@@ -1,1800 +0,0 @@
-diff -urN glib-1.2.10/acglib.m4 glib-1.2.10-1/acglib.m4
---- glib-1.2.10/acglib.m4	1999-01-04 16:37:40.000000000 -0700
-+++ glib-1.2.10-1/acglib.m4	2002-03-13 21:38:32.000000000 -0700
-@@ -122,6 +122,18 @@
- 		fi
- 		echo "#define GLIB_SYSDEF_$glib_sysdef$glib_default" >>$glib_sysdefso
- 	done
--	AC_MSG_RESULT(failed)])
-+	AC_MSG_RESULT(failed)],
-+[	for glib_sysdef_input in $2 ; do
-+		glib_sysdef=`echo $glib_sysdef_input | sed 's/^\([[^:]]*\):.*$/\1/'`
-+		glib_default=`echo $glib_sysdef_input | sed 's/^[[^:]]*:\(.*\)$/\1/'`
-+		if test $glib_sysdef != $glib_default; then
-+			glib_default=" $4$glib_default"
-+		else
-+			glib_default=
-+		fi
-+		echo "#define GLIB_SYSDEF_$glib_sysdef$glib_default" >>$glib_sysdefso
-+	done
-+	AC_MSG_WARN(cannot check it if cross compiling -- using defaults)]
-+)
- rm -f confrun.c
- ])
-diff -urN glib-1.2.10/configure glib-1.2.10-1/configure
---- glib-1.2.10/configure	2001-03-15 08:44:01.000000000 -0700
-+++ glib-1.2.10-1/configure	2002-03-13 21:38:32.000000000 -0700
-@@ -2099,15 +2099,16 @@
- glib_save_LIBS=$LIBS
- LIBS="$LIBS -lm"
- if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to none needed" 1>&2
-+
- else
-   cat > conftest.$ac_ext <<EOF
--#line 2106 "configure"
-+#line 2107 "configure"
- #include "confdefs.h"
- #include <math.h>
-              int main (void) { return (log(1) != log(1.)); }
- EOF
--if { (eval echo configure:2111: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:2112: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   echo "$ac_t""none needed" 1>&6
- else
-@@ -2117,15 +2118,16 @@
-   glib_save_CFLAGS=$CFLAGS
-      CFLAGS="$CFLAGS -std1"
-      if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: suppress autoconf warning message" 1>&2
-+     
- else
-   cat > conftest.$ac_ext <<EOF
--#line 2124 "configure"
-+#line 2126 "configure"
- #include "confdefs.h"
- #include <math.h>
-                  int main (void) { return (log(1) != log(1.)); }
- EOF
--if { (eval echo configure:2129: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:2131: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   echo "$ac_t""-std1" 1>&6
- else
-@@ -2135,12 +2137,10 @@
-   echo "$ac_t""" 1>&6
-          CFLAGS=$glib_save_CFLAGS
-          echo "configure: warning: No ANSI prototypes found in library. (-std1 didn't work.)" 1>&2
--     
- fi
- rm -fr conftest*
- fi
- 
--
- fi
- rm -fr conftest*
- fi
-@@ -2544,7 +2544,7 @@
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  ac_cv_sizeof_char=1
- else
-   cat > conftest.$ac_ext <<EOF
- #line 2551 "configure"
-@@ -2583,7 +2583,7 @@
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  ac_cv_sizeof_short=2
- else
-   cat > conftest.$ac_ext <<EOF
- #line 2590 "configure"
-@@ -2622,7 +2622,7 @@
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  ac_cv_sizeof_long=4
- else
-   cat > conftest.$ac_ext <<EOF
- #line 2629 "configure"
-@@ -2661,7 +2661,7 @@
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  ac_cv_sizeof_int=4
- else
-   cat > conftest.$ac_ext <<EOF
- #line 2668 "configure"
-@@ -2700,7 +2700,7 @@
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  ac_cv_sizeof_void_p=4
- else
-   cat > conftest.$ac_ext <<EOF
- #line 2707 "configure"
-@@ -2739,7 +2739,7 @@
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  ac_cv_sizeof_long_long=8
- else
-   cat > conftest.$ac_ext <<EOF
- #line 2746 "configure"
-@@ -2785,7 +2785,7 @@
- int main() {
- 
- /* Ultrix mips cc rejects this.  */
--typedef int charset[2]; const charset x;
-+typedef int charset[2]; const charset x = {0,0};
- /* SunOS 4.1.1 cc rejects this.  */
- char const *const *ccp;
- char **p;
-@@ -2855,31 +2855,29 @@
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
--        if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
--else
--  cat > conftest.$ac_ext <<EOF
--#line 2863 "configure"
-+        cat > conftest.$ac_ext <<EOF
-+#line 2860 "configure"
- #include "confdefs.h"
- 
-+int main() {
-+
- 	__inline int foo () { return 0; }
- 	int main () { return foo (); }
-        	
-+; return 0; }
- EOF
--if { (eval echo configure:2870: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
--then
-+if { (eval echo configure:2870: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+  rm -rf conftest*
-   glib_cv_has__inline=yes
-         
- else
-   echo "configure: failed program was:" >&5
-   cat conftest.$ac_ext >&5
--  rm -fr conftest*
-+  rm -rf conftest*
-   glib_cv_has__inline=no
--        
--fi
--rm -fr conftest*
-+	
- fi
--
-+rm -f conftest*
- 
- fi
- 
-@@ -2891,36 +2889,34 @@
- 
- esac
- echo $ac_n "checking for __inline__""... $ac_c" 1>&6
--echo "configure:2895: checking for __inline__" >&5
-+echo "configure:2893: checking for __inline__" >&5
- if eval "test \"`echo '$''{'glib_cv_has__inline__'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
--        if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
--else
--  cat > conftest.$ac_ext <<EOF
--#line 2904 "configure"
-+        cat > conftest.$ac_ext <<EOF
-+#line 2899 "configure"
- #include "confdefs.h"
- 
-+int main() {
-+
- 	__inline__ int foo () { return 0; }
- 	int main () { return foo (); }
-        	
-+; return 0; }
- EOF
--if { (eval echo configure:2911: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
--then
-+if { (eval echo configure:2909: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+  rm -rf conftest*
-   glib_cv_has__inline__=yes
-         
- else
-   echo "configure: failed program was:" >&5
-   cat conftest.$ac_ext >&5
--  rm -fr conftest*
-+  rm -rf conftest*
-   glib_cv_has__inline__=no
-         
- fi
--rm -fr conftest*
--fi
--
-+rm -f conftest*
- 
- fi
- 
-@@ -2932,36 +2928,34 @@
- 
- esac
- echo $ac_n "checking for inline""... $ac_c" 1>&6
--echo "configure:2936: checking for inline" >&5
-+echo "configure:2932: checking for inline" >&5
- if eval "test \"`echo '$''{'glib_cv_hasinline'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
--        if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
--else
--  cat > conftest.$ac_ext <<EOF
--#line 2945 "configure"
-+        cat > conftest.$ac_ext <<EOF
-+#line 2938 "configure"
- #include "confdefs.h"
- 
-+int main() {
-+
- 	inline int foo () { return 0; }
- 	int main () { return foo (); }
-        	
-+; return 0; }
- EOF
--if { (eval echo configure:2952: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
--then
-+if { (eval echo configure:2948: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+  rm -rf conftest*
-   glib_cv_hasinline=yes
-         
- else
-   echo "configure: failed program was:" >&5
-   cat conftest.$ac_ext >&5
--  rm -fr conftest*
-+  rm -rf conftest*
-   glib_cv_hasinline=no
-         
- fi
--rm -fr conftest*
--fi
--
-+rm -f conftest*
- 
- fi
- 
-@@ -2973,112 +2967,22 @@
- 
- esac
- 
--echo $ac_n "checking whether byte ordering is bigendian""... $ac_c" 1>&6
--echo "configure:2978: checking whether byte ordering is bigendian" >&5
--if eval "test \"`echo '$''{'ac_cv_c_bigendian'+set}'`\" = set"; then
--  echo $ac_n "(cached) $ac_c" 1>&6
--else
--  ac_cv_c_bigendian=unknown
--# See if sys/param.h defines the BYTE_ORDER macro.
--cat > conftest.$ac_ext <<EOF
--#line 2985 "configure"
--#include "confdefs.h"
--#include <sys/types.h>
--#include <sys/param.h>
--int main() {
--
--#if !BYTE_ORDER || !BIG_ENDIAN || !LITTLE_ENDIAN
-- bogus endian macros
--#endif
--; return 0; }
--EOF
--if { (eval echo configure:2996: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
--  rm -rf conftest*
--  # It does; now see whether it defined to BIG_ENDIAN or not.
--cat > conftest.$ac_ext <<EOF
--#line 3000 "configure"
--#include "confdefs.h"
--#include <sys/types.h>
--#include <sys/param.h>
--int main() {
--
--#if BYTE_ORDER != BIG_ENDIAN
-- not big endian
--#endif
--; return 0; }
--EOF
--if { (eval echo configure:3011: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
--  rm -rf conftest*
--  ac_cv_c_bigendian=yes
--else
--  echo "configure: failed program was:" >&5
--  cat conftest.$ac_ext >&5
--  rm -rf conftest*
--  ac_cv_c_bigendian=no
--fi
--rm -f conftest*
--else
--  echo "configure: failed program was:" >&5
--  cat conftest.$ac_ext >&5
--fi
--rm -f conftest*
--if test $ac_cv_c_bigendian = unknown; then
--if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
--else
--  cat > conftest.$ac_ext <<EOF
--#line 3031 "configure"
--#include "confdefs.h"
--main () {
--  /* Are we little or big endian?  From Harbison&Steele.  */
--  union
--  {
--    long l;
--    char c[sizeof (long)];
--  } u;
--  u.l = 1;
--  exit (u.c[sizeof (long) - 1] == 1);
--}
--EOF
--if { (eval echo configure:3044: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
--then
--  ac_cv_c_bigendian=no
--else
--  echo "configure: failed program was:" >&5
--  cat conftest.$ac_ext >&5
--  rm -fr conftest*
--  ac_cv_c_bigendian=yes
--fi
--rm -fr conftest*
--fi
--
--fi
--fi
--
--echo "$ac_t""$ac_cv_c_bigendian" 1>&6
--if test $ac_cv_c_bigendian = yes; then
--  cat >> confdefs.h <<\EOF
--#define WORDS_BIGENDIAN 1
--EOF
--
--fi
--
- 
- for ac_hdr in float.h
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3072: checking for $ac_hdr" >&5
-+echo "configure:2976: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3077 "configure"
-+#line 2981 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3082: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:2986: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3111,17 +3015,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3115: checking for $ac_hdr" >&5
-+echo "configure:3019: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3120 "configure"
-+#line 3024 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3125: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3029: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3154,17 +3058,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3158: checking for $ac_hdr" >&5
-+echo "configure:3062: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3163 "configure"
-+#line 3067 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3168: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3072: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3197,17 +3101,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3201: checking for $ac_hdr" >&5
-+echo "configure:3105: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3206 "configure"
-+#line 3110 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3211: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3115: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3240,17 +3144,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3244: checking for $ac_hdr" >&5
-+echo "configure:3148: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3249 "configure"
-+#line 3153 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3254: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3158: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3283,17 +3187,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3287: checking for $ac_hdr" >&5
-+echo "configure:3191: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3292 "configure"
-+#line 3196 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3297: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3201: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3326,17 +3230,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3330: checking for $ac_hdr" >&5
-+echo "configure:3234: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3335 "configure"
-+#line 3239 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3340: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3244: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3369,17 +3273,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3373: checking for $ac_hdr" >&5
-+echo "configure:3277: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3378 "configure"
-+#line 3282 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3383: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3287: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3412,17 +3316,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3416: checking for $ac_hdr" >&5
-+echo "configure:3320: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3421 "configure"
-+#line 3325 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3426: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3330: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3455,17 +3359,17 @@
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3459: checking for $ac_hdr" >&5
-+echo "configure:3363: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3464 "configure"
-+#line 3368 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3469: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3373: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3499,12 +3403,12 @@
- for ac_func in lstat strerror strsignal memmove vsnprintf strcasecmp strncasecmp poll
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:3503: checking for $ac_func" >&5
-+echo "configure:3407: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3508 "configure"
-+#line 3412 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -3527,7 +3431,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3531: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:3435: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -3554,9 +3458,9 @@
- 
- # Check for sys_errlist
- echo $ac_n "checking for sys_errlist""... $ac_c" 1>&6
--echo "configure:3558: checking for sys_errlist" >&5
-+echo "configure:3462: checking for sys_errlist" >&5
- cat > conftest.$ac_ext <<EOF
--#line 3560 "configure"
-+#line 3464 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -3567,7 +3471,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3571: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:3475: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   glib_ok=yes
- else
-@@ -3587,9 +3491,9 @@
- 
- # Check for sys_siglist
- echo $ac_n "checking for sys_siglist""... $ac_c" 1>&6
--echo "configure:3591: checking for sys_siglist" >&5
-+echo "configure:3495: checking for sys_siglist" >&5
- cat > conftest.$ac_ext <<EOF
--#line 3593 "configure"
-+#line 3497 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -3599,7 +3503,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3603: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:3507: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   glib_ok=yes
- else
-@@ -3619,9 +3523,9 @@
- 
- # Check for sys_siglist decl (see Tue Jan 19 00:44:24 1999 in changelog)
- echo $ac_n "checking for sys_siglist declaration""... $ac_c" 1>&6
--echo "configure:3623: checking for sys_siglist declaration" >&5
-+echo "configure:3527: checking for sys_siglist declaration" >&5
- cat > conftest.$ac_ext <<EOF
--#line 3625 "configure"
-+#line 3529 "configure"
- #include "confdefs.h"
- #include <signal.h>
- int main() {
-@@ -3630,7 +3534,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3634: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3538: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   glib_ok=yes
- else
-@@ -3650,16 +3554,16 @@
- 
- # Check if <sys/select.h> needs to be included for fd_set
- echo $ac_n "checking for fd_set""... $ac_c" 1>&6
--echo "configure:3654: checking for fd_set" >&5
-+echo "configure:3558: checking for fd_set" >&5
- cat > conftest.$ac_ext <<EOF
--#line 3656 "configure"
-+#line 3560 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- int main() {
- fd_set readMask, writeMask;
- ; return 0; }
- EOF
--if { (eval echo configure:3663: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3567: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   gtk_ok=yes
- else
-@@ -3673,7 +3577,7 @@
-     echo "$ac_t""yes, found in sys/types.h" 1>&6
- else
-     cat > conftest.$ac_ext <<EOF
--#line 3677 "configure"
-+#line 3581 "configure"
- #include "confdefs.h"
- #include <sys/select.h>
- EOF
-@@ -3707,14 +3611,14 @@
- # Check for wchar.h
- 
- echo $ac_n "checking for wchar.h""... $ac_c" 1>&6
--echo "configure:3711: checking for wchar.h" >&5
-+echo "configure:3615: checking for wchar.h" >&5
- cat > conftest.$ac_ext <<EOF
--#line 3713 "configure"
-+#line 3617 "configure"
- #include "confdefs.h"
- #include <wchar.h>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3718: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3622: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3738,14 +3642,14 @@
- # Check for wctype.h (for iswalnum)
- 
- echo $ac_n "checking for wctype.h""... $ac_c" 1>&6
--echo "configure:3742: checking for wctype.h" >&5
-+echo "configure:3646: checking for wctype.h" >&5
- cat > conftest.$ac_ext <<EOF
--#line 3744 "configure"
-+#line 3648 "configure"
- #include "confdefs.h"
- #include <wctype.h>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3749: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3653: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -3769,12 +3673,12 @@
- oLIBS="$LIBS"
- # in Solaris 2.5, `iswalnum' is in -lw
- echo $ac_n "checking for iswalnum""... $ac_c" 1>&6
--echo "configure:3773: checking for iswalnum" >&5
-+echo "configure:3677: checking for iswalnum" >&5
- if eval "test \"`echo '$''{'ac_cv_func_iswalnum'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3778 "configure"
-+#line 3682 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char iswalnum(); below.  */
-@@ -3797,7 +3701,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3801: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:3705: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_iswalnum=yes"
- else
-@@ -3815,7 +3719,7 @@
- else
-   echo "$ac_t""no" 1>&6
- echo $ac_n "checking for iswalnum in -lw""... $ac_c" 1>&6
--echo "configure:3819: checking for iswalnum in -lw" >&5
-+echo "configure:3723: checking for iswalnum in -lw" >&5
- ac_lib_var=`echo w'_'iswalnum | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -3823,7 +3727,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lw  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 3827 "configure"
-+#line 3731 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -3834,7 +3738,7 @@
- iswalnum()
- ; return 0; }
- EOF
--if { (eval echo configure:3838: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:3742: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -3866,9 +3770,9 @@
- 
- # The following is necessary for Linux libc-5.4.38
- echo $ac_n "checking if iswalnum() and friends are properly defined""... $ac_c" 1>&6
--echo "configure:3870: checking if iswalnum() and friends are properly defined" >&5
-+echo "configure:3774: checking if iswalnum() and friends are properly defined" >&5
- cat > conftest.$ac_ext <<EOF
--#line 3872 "configure"
-+#line 3776 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- int main() {
-@@ -3888,7 +3792,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3892: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:3796: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   glib_working_wctype=yes
- else
-@@ -3909,16 +3813,22 @@
- echo "$ac_t""$glib_working_wctype" 1>&6
- 
- echo $ac_n "checking whether realloc (NULL,) will work""... $ac_c" 1>&6
--echo "configure:3913: checking whether realloc (NULL,) will work" >&5
-+echo "configure:3817: checking whether realloc (NULL,) will work" >&5
- if eval "test \"`echo '$''{'glib_cv_sane_realloc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
- 	if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to yes" 1>&2
-+	 glib_cv_sane_realloc=yes
-+	 cat >> confdefs.h <<\EOF
-+#define REALLOC_0_WORKS 1
-+EOF
-+
-+	
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3922 "configure"
-+#line 3832 "configure"
- #include "confdefs.h"
- 
- 	#include <stdlib.h>
-@@ -3926,7 +3836,7 @@
- 	  return realloc (0, sizeof (int)) == 0;
- 	}
- EOF
--if { (eval echo configure:3930: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:3840: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv_sane_realloc=yes
- 	cat >> confdefs.h <<\EOF
-@@ -3951,16 +3861,18 @@
- 
- 
- echo $ac_n "checking for an implementation of va_copy()""... $ac_c" 1>&6
--echo "configure:3955: checking for an implementation of va_copy()" >&5
-+echo "configure:3865: checking for an implementation of va_copy()" >&5
- if eval "test \"`echo '$''{'glib_cv_va_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
- 	if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to no" 1>&2
-+	glib_cv_va_copy=no
-+	
- else
-   cat > conftest.$ac_ext <<EOF
--#line 3964 "configure"
-+#line 3876 "configure"
- #include "confdefs.h"
- 
- 	#include <stdarg.h>
-@@ -3977,7 +3889,7 @@
- 	  return 0;
- 	}
- EOF
--if { (eval echo configure:3981: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:3893: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv_va_copy=yes
- 	
-@@ -3996,16 +3908,18 @@
- 
- echo "$ac_t""$glib_cv_va_copy" 1>&6
- echo $ac_n "checking for an implementation of __va_copy()""... $ac_c" 1>&6
--echo "configure:4000: checking for an implementation of __va_copy()" >&5
-+echo "configure:3912: checking for an implementation of __va_copy()" >&5
- if eval "test \"`echo '$''{'glib_cv___va_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
- 	if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to yes" 1>&2
-+	glib_cv___va_copy=yes
-+	
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4009 "configure"
-+#line 3923 "configure"
- #include "confdefs.h"
- 
- 	#include <stdarg.h>
-@@ -4022,7 +3936,7 @@
- 	  return 0;
- 	}
- EOF
--if { (eval echo configure:4026: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:3940: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv___va_copy=yes
- 	
-@@ -4041,16 +3955,18 @@
- 
- echo "$ac_t""$glib_cv___va_copy" 1>&6
- echo $ac_n "checking whether va_lists can be copied by value""... $ac_c" 1>&6
--echo "configure:4045: checking whether va_lists can be copied by value" >&5
-+echo "configure:3959: checking whether va_lists can be copied by value" >&5
- if eval "test \"`echo '$''{'glib_cv_va_val_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
- 	if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to yes" 1>&2
-+	glib_cv_va_val_copy=yes
-+	
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4054 "configure"
-+#line 3970 "configure"
- #include "confdefs.h"
- 
- 	#include <stdarg.h>
-@@ -4067,7 +3983,7 @@
- 	  return 0;
- 	}
- EOF
--if { (eval echo configure:4071: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:3987: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv_va_val_copy=yes
- 	
-@@ -4112,12 +4028,12 @@
- G_MODULE_HAVE_DLERROR=0
- if test -z "$G_MODULE_IMPL"; then
- 	echo $ac_n "checking for dlopen""... $ac_c" 1>&6
--echo "configure:4116: checking for dlopen" >&5
-+echo "configure:4032: checking for dlopen" >&5
- if eval "test \"`echo '$''{'ac_cv_func_dlopen'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4121 "configure"
-+#line 4037 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char dlopen(); below.  */
-@@ -4140,7 +4056,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:4144: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4060: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_dlopen=yes"
- else
-@@ -4155,12 +4071,12 @@
- if eval "test \"`echo '$ac_cv_func_'dlopen`\" = yes"; then
-   echo "$ac_t""yes" 1>&6
-   echo $ac_n "checking for dlsym""... $ac_c" 1>&6
--echo "configure:4159: checking for dlsym" >&5
-+echo "configure:4075: checking for dlsym" >&5
- if eval "test \"`echo '$''{'ac_cv_func_dlsym'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4164 "configure"
-+#line 4080 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char dlsym(); below.  */
-@@ -4183,7 +4099,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:4187: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4103: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_dlsym=yes"
- else
-@@ -4211,7 +4127,7 @@
- fi
- if test -z "$G_MODULE_IMPL"; then
- 	echo $ac_n "checking for dlopen in -ldl""... $ac_c" 1>&6
--echo "configure:4215: checking for dlopen in -ldl" >&5
-+echo "configure:4131: checking for dlopen in -ldl" >&5
- ac_lib_var=`echo dl'_'dlopen | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4219,7 +4135,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-ldl  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4223 "configure"
-+#line 4139 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4230,7 +4146,7 @@
- dlopen()
- ; return 0; }
- EOF
--if { (eval echo configure:4234: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4150: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4246,7 +4162,7 @@
- if eval "test \"`echo '$ac_cv_lib_'$ac_lib_var`\" = yes"; then
-   echo "$ac_t""yes" 1>&6
-   echo $ac_n "checking for dlsym in -ldl""... $ac_c" 1>&6
--echo "configure:4250: checking for dlsym in -ldl" >&5
-+echo "configure:4166: checking for dlsym in -ldl" >&5
- ac_lib_var=`echo dl'_'dlsym | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4254,7 +4170,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-ldl  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4258 "configure"
-+#line 4174 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4265,7 +4181,7 @@
- dlsym()
- ; return 0; }
- EOF
--if { (eval echo configure:4269: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4185: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4295,18 +4211,18 @@
- fi
- if test -z "$G_MODULE_IMPL"; then
-         echo $ac_n "checking how to export all symbols""... $ac_c" 1>&6
--echo "configure:4299: checking how to export all symbols" >&5
-+echo "configure:4215: checking how to export all symbols" >&5
-         SAVED_LDFLAGS=$LDFLAGS
-         LDFLAGS="$LDFLAGS -Wl,-E"
-         cat > conftest.$ac_ext <<EOF
--#line 4303 "configure"
-+#line 4219 "configure"
- #include "confdefs.h"
- 
- int main() {
-  return 0; 
- ; return 0; }
- EOF
--if { (eval echo configure:4310: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4226: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-    G_MODULE_LDFLAGS="-Wl,-E" 
- else
-@@ -4316,14 +4232,14 @@
-   
-                 LDFLAGS="$SAVED_LDFLAGS -bexpall"
-                 cat > conftest.$ac_ext <<EOF
--#line 4320 "configure"
-+#line 4236 "configure"
- #include "confdefs.h"
- 
- int main() {
-  return 0; 
- ; return 0; }
- EOF
--if { (eval echo configure:4327: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4243: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   G_MODULE_LDFLAGS="-bexpall"
- else
-@@ -4343,7 +4259,7 @@
-                 G_MODULE_LDFLAGS=
-         fi
- 	echo $ac_n "checking for shl_load in -ldld""... $ac_c" 1>&6
--echo "configure:4347: checking for shl_load in -ldld" >&5
-+echo "configure:4263: checking for shl_load in -ldld" >&5
- ac_lib_var=`echo dld'_'shl_load | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4351,7 +4267,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-ldld  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4355 "configure"
-+#line 4271 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4362,7 +4278,7 @@
- shl_load()
- ; return 0; }
- EOF
--if { (eval echo configure:4366: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4282: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4396,16 +4312,17 @@
- 	LIBS="$LIBS $G_MODULE_LIBS"
- 	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
-         echo $ac_n "checking for RTLD_GLOBAL brokenness""... $ac_c" 1>&6
--echo "configure:4400: checking for RTLD_GLOBAL brokenness" >&5
-+echo "configure:4316: checking for RTLD_GLOBAL brokenness" >&5
- if eval "test \"`echo '$''{'glib_cv_rtldglobal_broken'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
-                 if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to no" 1>&2
-+			 glib_cv_rtldglobal_broken=no
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4409 "configure"
-+#line 4326 "configure"
- #include "confdefs.h"
- 
-                 #include <dlfcn.h>
-@@ -4425,7 +4342,7 @@
-                 return global == local;
-                 }
- EOF
--if { (eval echo configure:4429: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:4346: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv_rtldglobal_broken=no
- else
-@@ -4448,16 +4365,18 @@
-                 G_MODULE_BROKEN_RTLD_GLOBAL=0
-         fi
- 	echo $ac_n "checking for preceeding underscore in symbols""... $ac_c" 1>&6
--echo "configure:4452: checking for preceeding underscore in symbols" >&5
-+echo "configure:4369: checking for preceeding underscore in symbols" >&5
- 	if eval "test \"`echo '$''{'glib_cv_uscore'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   
- 		if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to no" 1>&2
-+			glib_cv_uscore=no
-+		
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4461 "configure"
-+#line 4380 "configure"
- #include "confdefs.h"
- 
- 		#include <dlfcn.h>
-@@ -4471,7 +4390,7 @@
- 		  } return (!f2 || f1);
- 		}
- EOF
--if { (eval echo configure:4475: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:4394: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv_uscore=yes
- else
-@@ -4496,12 +4415,12 @@
- 
- 	LDFLAGS="$LDFLAGS_orig"
- 	echo $ac_n "checking for dlerror""... $ac_c" 1>&6
--echo "configure:4500: checking for dlerror" >&5
-+echo "configure:4419: checking for dlerror" >&5
- if eval "test \"`echo '$''{'ac_cv_func_dlerror'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4505 "configure"
-+#line 4424 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char dlerror(); below.  */
-@@ -4524,7 +4443,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:4528: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4447: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_dlerror=yes"
- else
-@@ -4608,7 +4527,7 @@
-        	case $host in
-                	*-*-solaris*)
-               	echo $ac_n "checking for cond_init in -lthread""... $ac_c" 1>&6
--echo "configure:4612: checking for cond_init in -lthread" >&5
-+echo "configure:4531: checking for cond_init in -lthread" >&5
- ac_lib_var=`echo thread'_'cond_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4616,7 +4535,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lthread  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4620 "configure"
-+#line 4539 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4627,7 +4546,7 @@
- cond_init()
- ; return 0; }
- EOF
--if { (eval echo configure:4631: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4550: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4654,17 +4573,17 @@
-         if test "x$have_threads" = xnone; then
-                 ac_safe=`echo "pthread.h" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for pthread.h""... $ac_c" 1>&6
--echo "configure:4658: checking for pthread.h" >&5
-+echo "configure:4577: checking for pthread.h" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4663 "configure"
-+#line 4582 "configure"
- #include "confdefs.h"
- #include <pthread.h>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:4668: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:4587: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -4690,7 +4609,7 @@
- if test "x$want_threads" = xyes || test "x$want_threads" = xnspr; then
-         if test "x$have_threads" = xnone; then
- 		echo $ac_n "checking for PRP_NewNakedCondVar in -lnspr21""... $ac_c" 1>&6
--echo "configure:4694: checking for PRP_NewNakedCondVar in -lnspr21" >&5
-+echo "configure:4613: checking for PRP_NewNakedCondVar in -lnspr21" >&5
- ac_lib_var=`echo nspr21'_'PRP_NewNakedCondVar | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4698,7 +4617,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lnspr21  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4702 "configure"
-+#line 4621 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4709,7 +4628,7 @@
- PRP_NewNakedCondVar()
- ; return 0; }
- EOF
--if { (eval echo configure:4713: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4632: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4733,7 +4652,7 @@
- fi
- 
- echo $ac_n "checking for thread implementation""... $ac_c" 1>&6
--echo "configure:4737: checking for thread implementation" >&5
-+echo "configure:4656: checking for thread implementation" >&5
- 
- if test "x$have_threads" = xnone && test "x$want_threads" != xno; then
- 	echo "$ac_t""none available" 1>&6
-@@ -4752,7 +4671,7 @@
-         posix)
- 		G_THREAD_LIBS=error
- 		echo $ac_n "checking for pthread_attr_init in -lpthread""... $ac_c" 1>&6
--echo "configure:4756: checking for pthread_attr_init in -lpthread" >&5
-+echo "configure:4675: checking for pthread_attr_init in -lpthread" >&5
- ac_lib_var=`echo pthread'_'pthread_attr_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4760,7 +4679,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lpthread  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4764 "configure"
-+#line 4683 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4771,7 +4690,7 @@
- pthread_attr_init()
- ; return 0; }
- EOF
--if { (eval echo configure:4775: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4694: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4793,7 +4712,7 @@
- 
- 		if test "x$G_THREAD_LIBS" = xerror; then
-                 	echo $ac_n "checking for pthread_attr_init in -lpthreads""... $ac_c" 1>&6
--echo "configure:4797: checking for pthread_attr_init in -lpthreads" >&5
-+echo "configure:4716: checking for pthread_attr_init in -lpthreads" >&5
- ac_lib_var=`echo pthreads'_'pthread_attr_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4801,7 +4720,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lpthreads  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4805 "configure"
-+#line 4724 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4812,7 +4731,7 @@
- pthread_attr_init()
- ; return 0; }
- EOF
--if { (eval echo configure:4816: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4735: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4835,7 +4754,7 @@
- 		fi
- 		if test "x$G_THREAD_LIBS" = xerror; then
-                 	echo $ac_n "checking for pthread_attr_init in -lthread""... $ac_c" 1>&6
--echo "configure:4839: checking for pthread_attr_init in -lthread" >&5
-+echo "configure:4758: checking for pthread_attr_init in -lthread" >&5
- ac_lib_var=`echo thread'_'pthread_attr_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4843,7 +4762,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lthread  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4847 "configure"
-+#line 4766 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4854,7 +4773,7 @@
- pthread_attr_init()
- ; return 0; }
- EOF
--if { (eval echo configure:4858: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4777: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4877,7 +4796,7 @@
- 		fi
- 		if test "x$G_THREAD_LIBS" = xerror; then
-                 	echo $ac_n "checking for pthread_attr_init in -lc_r""... $ac_c" 1>&6
--echo "configure:4881: checking for pthread_attr_init in -lc_r" >&5
-+echo "configure:4800: checking for pthread_attr_init in -lc_r" >&5
- ac_lib_var=`echo c_r'_'pthread_attr_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4885,7 +4804,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lc_r  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4889 "configure"
-+#line 4808 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4896,7 +4815,7 @@
- pthread_attr_init()
- ; return 0; }
- EOF
--if { (eval echo configure:4900: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4819: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -4919,12 +4838,12 @@
- 		fi
- 		if test "x$G_THREAD_LIBS" = xerror; then
- 			echo $ac_n "checking for pthread_attr_init""... $ac_c" 1>&6
--echo "configure:4923: checking for pthread_attr_init" >&5
-+echo "configure:4842: checking for pthread_attr_init" >&5
- if eval "test \"`echo '$''{'ac_cv_func_pthread_attr_init'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 4928 "configure"
-+#line 4847 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char pthread_attr_init(); below.  */
-@@ -4947,7 +4866,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:4951: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4870: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_pthread_attr_init=yes"
- else
-@@ -4969,7 +4888,7 @@
- 		fi
- 		        	if test "x$G_THREAD_LIBS" = xerror; then
-                 	echo $ac_n "checking for __d10_pthread_attr_init in -lthread""... $ac_c" 1>&6
--echo "configure:4973: checking for __d10_pthread_attr_init in -lthread" >&5
-+echo "configure:4892: checking for __d10_pthread_attr_init in -lthread" >&5
- ac_lib_var=`echo thread'_'__d10_pthread_attr_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4977,7 +4896,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lthread  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 4981 "configure"
-+#line 4900 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -4988,7 +4907,7 @@
- __d10_pthread_attr_init()
- ; return 0; }
- EOF
--if { (eval echo configure:4992: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4911: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5012,7 +4931,7 @@
-         	fi
- 		        	if test "x$G_THREAD_LIBS" = xerror; then
-                 	echo $ac_n "checking for __pthread_attr_init_system in -lpthread""... $ac_c" 1>&6
--echo "configure:5016: checking for __pthread_attr_init_system in -lpthread" >&5
-+echo "configure:4935: checking for __pthread_attr_init_system in -lpthread" >&5
- ac_lib_var=`echo pthread'_'__pthread_attr_init_system | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5020,7 +4939,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lpthread  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5024 "configure"
-+#line 4943 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5031,7 +4950,7 @@
- __pthread_attr_init_system()
- ; return 0; }
- EOF
--if { (eval echo configure:5035: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:4954: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5061,7 +4980,7 @@
-         solaris)
- 		G_THREAD_LIBS=error
-                 echo $ac_n "checking for cond_init in -lthread""... $ac_c" 1>&6
--echo "configure:5065: checking for cond_init in -lthread" >&5
-+echo "configure:4984: checking for cond_init in -lthread" >&5
- ac_lib_var=`echo thread'_'cond_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5069,7 +4988,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lthread  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5073 "configure"
-+#line 4992 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5080,7 +4999,7 @@
- cond_init()
- ; return 0; }
- EOF
--if { (eval echo configure:5084: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5003: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5108,7 +5027,7 @@
-                 ;;
- 	nspr)
- 		echo $ac_n "checking for PRP_NewNakedCondVar in -lnspr21""... $ac_c" 1>&6
--echo "configure:5112: checking for PRP_NewNakedCondVar in -lnspr21" >&5
-+echo "configure:5031: checking for PRP_NewNakedCondVar in -lnspr21" >&5
- ac_lib_var=`echo nspr21'_'PRP_NewNakedCondVar | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5116,7 +5035,7 @@
-   ac_save_LIBS="$LIBS"
- LIBS="-lnspr21  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5120 "configure"
-+#line 5039 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5127,7 +5046,7 @@
- PRP_NewNakedCondVar()
- ; return 0; }
- EOF
--if { (eval echo configure:5131: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5050: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5163,7 +5082,7 @@
- fi
- 
- echo $ac_n "checking necessary linker options""... $ac_c" 1>&6
--echo "configure:5167: checking necessary linker options" >&5
-+echo "configure:5086: checking necessary linker options" >&5
- echo "$ac_t""$G_THREAD_LIBS" 1>&6
- 
- 
-@@ -5191,7 +5110,7 @@
-     old_CPPFLAGS=$CPPFLAGS
-     CPPFLAGS="$CPPFLAGS $G_THREAD_CFLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 5195 "configure"
-+#line 5114 "configure"
- #include "confdefs.h"
- #include <time.h>
- EOF
-@@ -5208,7 +5127,7 @@
-     CPPFLAGS=$old_CPPFLAGS
- 
-     echo $ac_n "checking necessary compiler options""... $ac_c" 1>&6
--echo "configure:5212: checking necessary compiler options" >&5
-+echo "configure:5131: checking necessary compiler options" >&5
- 
-     echo "$ac_t""$G_THREAD_CFLAGS" 1>&6
- else
-@@ -5226,12 +5145,12 @@
- 	for ac_func in localtime_r rand_r
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:5230: checking for $ac_func" >&5
-+echo "configure:5149: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5235 "configure"
-+#line 5154 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -5254,7 +5173,7 @@
- 
- ; return 0; }
- EOF
--if { (eval echo configure:5258: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5177: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -5280,15 +5199,17 @@
- 
- 	if test "$ac_cv_header_pwd_h" = "yes"; then
- 		echo $ac_n "checking for getpwuid_r""... $ac_c" 1>&6
--echo "configure:5284: checking for getpwuid_r" >&5
-+echo "configure:5203: checking for getpwuid_r" >&5
- 	 	if eval "test \"`echo '$''{'ac_cv_func_getpwuid_r'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to yes" 1>&2
-+				ac_cv_func_getpwuid_r=yes
-+			
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5292 "configure"
-+#line 5213 "configure"
- #include "confdefs.h"
- #include <errno.h>
- 				int main () { char buffer[10000], *pointer; 
-@@ -5300,7 +5221,7 @@
- 					sizeof (buffer), &pointer);
- 				return errno == ENOSYS || error == ENOSYS;}
- EOF
--if { (eval echo configure:5304: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:5225: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_func_getpwuid_r=yes
- else
-@@ -5312,6 +5233,7 @@
- rm -fr conftest*
- fi
- 
-+		
- fi
- 
- 		if test "$ac_cv_func_getpwuid_r" = yes; then
-@@ -5325,11 +5247,11 @@
- 		fi
- 		if test "$ac_cv_func_getpwuid_r" = "yes"; then
- 			echo $ac_n "checking whether getpwuid_r is posix like""... $ac_c" 1>&6
--echo "configure:5329: checking whether getpwuid_r is posix like" >&5
-+echo "configure:5251: checking whether getpwuid_r is posix like" >&5
- 			# The signature for the POSIX version is:
- 			# int getpwuid_r(uid_t, struct passwd *, char *, size_t, struct passwd **)
- 			cat > conftest.$ac_ext <<EOF
--#line 5333 "configure"
-+#line 5255 "configure"
- #include "confdefs.h"
- #include <pwd.h>
-                                         #include <sys/types.h>
-@@ -5338,7 +5260,7 @@
- getpwuid_r((uid_t)0, NULL, NULL, (size_t)0, NULL);
- ; return 0; }
- EOF
--if { (eval echo configure:5342: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:5264: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   cat >> confdefs.h <<\EOF
- #define HAVE_GETPWUID_R_POSIX 1
-@@ -5357,17 +5279,17 @@
- 	if test x"$have_threads" = xposix; then
- 		LIBS="$LIBS $G_THREAD_LIBS"
- 		echo $ac_n "checking whether pthread_getspecific is posix like""... $ac_c" 1>&6
--echo "configure:5361: checking whether pthread_getspecific is posix like" >&5
-+echo "configure:5283: checking whether pthread_getspecific is posix like" >&5
- 		# PCThreads has pthread_getspecific(pthread_key_t, void **);
- 		cat > conftest.$ac_ext <<EOF
--#line 5364 "configure"
-+#line 5286 "configure"
- #include "confdefs.h"
- #include <pthread.h>
- int main() {
- pthread_getspecific(0,NULL);
- ; return 0; }
- EOF
--if { (eval echo configure:5371: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:5293: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   echo "$ac_t""no" 1>&6
- else
-@@ -5382,20 +5304,25 @@
- fi
- rm -f conftest*
- 		echo $ac_n "checking whether pthread_mutex_trylock is posix like""... $ac_c" 1>&6
--echo "configure:5386: checking whether pthread_mutex_trylock is posix like" >&5
-+echo "configure:5308: checking whether pthread_mutex_trylock is posix like" >&5
- 		# DCE Threads return 1 as success, posix 0. what a mess.
- 		if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to yes" 1>&2
-+			cat >> confdefs.h <<\EOF
-+#define HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX 1
-+EOF
-+
-+		
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5392 "configure"
-+#line 5319 "configure"
- #include "confdefs.h"
- #include <pthread.h>
- 			pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
- 			int main () { 
- 			return !pthread_mutex_trylock (&mutex); }
- EOF
--if { (eval echo configure:5399: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:5326: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   echo "$ac_t""no" 1>&6
- else
-@@ -5412,13 +5339,18 @@
- fi
- 
- 		echo $ac_n "checking whether pthread_cond_timedwait is posix like""... $ac_c" 1>&6
--echo "configure:5416: checking whether pthread_cond_timedwait is posix like" >&5
-+echo "configure:5343: checking whether pthread_cond_timedwait is posix like" >&5
- 		# DCE Threads return -1 as failure, posix ETIMEDOUT.
- 		if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  echo "configure: warning: cannot check it if cross compiling -- defaulting to yes" 1>&2
-+			cat >> confdefs.h <<\EOF
-+#define HAVE_PTHREAD_COND_TIMEDWAIT_POSIX 1
-+EOF
-+
-+		
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5422 "configure"
-+#line 5354 "configure"
- #include "confdefs.h"
- #include <pthread.h>
- 			int main () { 
-@@ -5432,7 +5364,7 @@
- 			return pthread_cond_timedwait (&cond,&mutex,&tspec) 
- 				!= -1;}
- EOF
--if { (eval echo configure:5436: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:5368: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   echo "$ac_t""no" 1>&6
- else
-@@ -5475,15 +5407,16 @@
-         case "$mutex_has_default" in
-         "yes")
-                 echo $ac_n "checking size of $mutex_default_type""... $ac_c" 1>&6
--echo "configure:5479: checking size of $mutex_default_type" >&5
-+echo "configure:5411: checking size of $mutex_default_type" >&5
- if eval "test \"`echo '$''{'glib_cv_sizeof_gmutex'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  glib_cv_sizeof_gmutex=24
-+                    
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5487 "configure"
-+#line 5420 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- #include <$mutex_header_file>
-@@ -5495,7 +5428,7 @@
-   exit(0);
- }
- EOF
--if { (eval echo configure:5499: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:5432: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv_sizeof_gmutex=`cat conftestval`
- else
-@@ -5515,7 +5448,7 @@
- 
- 
- 	echo $ac_n "checking byte contents of $mutex_default_type""... $ac_c" 1>&6
--echo "configure:5519: checking byte contents of $mutex_default_type" >&5
-+echo "configure:5452: checking byte contents of $mutex_default_type" >&5
- if eval "test \"`echo '$''{'glib_cv_byte_contents_gmutex'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -5523,7 +5456,7 @@
-   glib_cv_byte_contents_gmutex=0
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5527 "configure"
-+#line 5460 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- #include <$mutex_header_file>
-@@ -5540,7 +5473,7 @@
-   exit(0);
- }
- EOF
--if { (eval echo configure:5544: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:5477: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   glib_cv_byte_contents_gmutex=`cat conftestval`
- else
-@@ -5576,7 +5509,7 @@
-   glib_nl='\n'
- fi
- echo $ac_n "checking system definitions for $glib_sysdef_msg""... $ac_c" 1>&6
--echo "configure:5580: checking system definitions for $glib_sysdef_msg" >&5
-+echo "configure:5513: checking system definitions for $glib_sysdef_msg" >&5
- cat >confrun.c <<_______EOF
- #include <stdio.h>
- #include <sys/types.h>
-@@ -5600,14 +5533,25 @@
- done
- echo "return 0; }" >>confrun.c
- if test "$cross_compiling" = yes; then
--    { echo "configure: error: can not run test program while cross compiling" 1>&2; exit 1; }
-+  	for glib_sysdef_input in POLLIN:1 POLLOUT:4 POLLPRI:2 POLLERR:8 POLLHUP:16 POLLNVAL:32 ; do
-+		glib_sysdef=`echo $glib_sysdef_input | sed 's/^\([^:]*\):.*$/\1/'`
-+		glib_default=`echo $glib_sysdef_input | sed 's/^[^:]*:\(.*\)$/\1/'`
-+		if test $glib_sysdef != $glib_default; then
-+			glib_default=" =$glib_default"
-+		else
-+			glib_default=
-+		fi
-+		echo "#define GLIB_SYSDEF_$glib_sysdef$glib_default" >>$glib_sysdefso
-+	done
-+	echo "configure: warning: cannot check it if cross compiling -- using defaults" 1>&2
-+
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5607 "configure"
-+#line 5551 "configure"
- #include "confdefs.h"
- `cat confrun.c`
- EOF
--if { (eval echo configure:5611: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:5555: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   echo "$ac_t""done" 1>&6
- else
-- 
1.7.0.4
