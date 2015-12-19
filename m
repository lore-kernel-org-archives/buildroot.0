From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:05:03 +0100
Subject: [Buildroot] [git commit] cantarell: new package
Message-ID: <20151219140533.F01FE81E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0493a42815a9a25e034c33160ea0e1b39f06e3e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: change <pkg>_LICENSE to match the license identifier used for
other packages, such as 'liberation'.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/cantarell/Config.in      |  7 +++++++
 package/cantarell/cantarell.hash |  2 ++
 package/cantarell/cantarell.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0d4d025..ca05881 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -190,6 +190,7 @@ menu "Fonts, icons, sounds and themes"
 
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
index 0000000..ebad1b9
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
+CANTARELL_LICENSE = OFLv1.1
+CANTARELL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
