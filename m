From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:08:47 +0200
Subject: [Buildroot] [git commit] libftdi: rename option to have proper
 prefix
Message-ID: <20180521212027.03EC7815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc4e4aac03eab81228841749aeb19b9fcb9fedb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option name BR2_PACKAGE_LIBTFDI_CPP obviously had a typo: it
should have been named BR2_PACKAGE_LIBFTDI_CPP, and add the necessary
Config.in.legacy handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           | 9 +++++++++
 package/libftdi/Config.in  | 2 +-
 package/libftdi/libftdi.mk | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f1938a13d2..7ec9526710 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_LIBTFDI_CPP
+	bool "libftdi C++ bindings option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBFTDI_CPP
+	help
+	  The option BR2_PACKAGE_LIBTFDI_CPP was renamed to
+	  BR2_PACKAGE_LIBFTDI_CPP in order to fix a typo in the option
+	  name.
+
 config BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
 	bool "jquery-ui-themes option black-tie renamed"
 	select BR2_LEGACY
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index beb42d34c5..23dae1be1f 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBFTDI
 
 if BR2_PACKAGE_LIBFTDI
 
-config BR2_PACKAGE_LIBTFDI_CPP
+config BR2_PACKAGE_LIBFTDI_CPP
 	bool "C++ bindings"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index c1952ac68b..cdd77c2e68 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -15,7 +15,7 @@ LIBFTDI_AUTORECONF = YES
 LIBFTDI_CONF_OPTS = --without-examples
 
 # configure detect it automaticaly so we need to force it
-ifeq ($(BR2_PACKAGE_LIBTFDI_CPP),y)
+ifeq ($(BR2_PACKAGE_LIBFTDI_CPP),y)
 LIBFTDI_DEPENDENCIES += boost
 LIBFTDI_CONF_OPTS += --enable-libftdipp
 else
