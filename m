From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 16:37:05 -0300
Subject: [Buildroot] [PATCH 3/3] cantarell: new package
In-Reply-To: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447443425-2530-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                |  1 +
 package/cantarell/Config.in      |  7 +++++++
 package/cantarell/cantarell.hash |  2 ++
 package/cantarell/cantarell.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/cantarell/Config.in
 create mode 100644 package/cantarell/cantarell.hash
 create mode 100644 package/cantarell/cantarell.mk

diff --git a/package/Config.in b/package/Config.in
index be2a7a8..dde5c4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -188,6 +188,7 @@ comment "Cursors"
 
 comment "Fonts"
 	source "package/bitstream-vera/Config.in"
+	source "package/cantarell/Config.in"
 	source "package/dejavu/Config.in"
 	source "package/ghostscript-fonts/Config.in"
 	source "package/inconsolata/Config.in"
diff --git a/package/cantarell/Config.in b/package/cantarell/Config.in
new file mode 100644
index 0000000..78af96d
--- /dev/null
+++ b/package/cantarell/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CANTARELL
+	bool "cantarell"
+	help
+	  The Cantarell font family is a contemporary Humanist
+	  sans serif designed for on-screen reading.
+
+	  https://wiki.gnome.org/Projects/CantarellFonts
diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
new file mode 100644
index 0000000..d3946c6
--- /dev/null
+++ b/package/cantarell/cantarell.hash
@@ -0,0 +1,2 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.18.1.sha256sum
+sha256	9c5b1a2edee1d3acf30eaae3d559b2b2e1d835249cf2770f6f8bfc6af861e8f0	cantarell-fonts-0.0.18.1.tar.xz
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
new file mode 100644
index 0000000..d9ca655
--- /dev/null
+++ b/package/cantarell/cantarell.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cantarell
+#
+################################################################################
+
+CANTARELL_VERSION_MAJOR = 0.0
+CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).18.1
+CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/0.0
+CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
+CANTARELL_DEPENDENCIES = host-pkgconf
+CANTARELL_LICENSE = SILv1.1
+CANTARELL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.4.10
