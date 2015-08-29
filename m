From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 12:44:06 +0200
Subject: [Buildroot] [git commit branch/next] package/libg7221: new package
Message-ID: <20150829104525.354F08177A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2657024167e86b9694573e9518c5ef801c978e3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/libg7221/Config.in   |    7 +++++++
 package/libg7221/libg7221.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 61b181c..eb4215d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ menu "Audio/Sound"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
+	source "package/libg7221/Config.in"
 	source "package/libid3tag/Config.in"
 	source "package/liblo/Config.in"
 	source "package/libmad/Config.in"
diff --git a/package/libg7221/Config.in b/package/libg7221/Config.in
new file mode 100644
index 0000000..e057d28
--- /dev/null
+++ b/package/libg7221/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBG7221
+	bool "libg7221"
+	help
+	  libg722_1 is a library for the ITU G.722.1 and Annex C
+	  wideband speech codecs.
+
+	  http://www.soft-switch.org
diff --git a/package/libg7221/libg7221.mk b/package/libg7221/libg7221.mk
new file mode 100644
index 0000000..813af11
--- /dev/null
+++ b/package/libg7221/libg7221.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libg7221
+#
+################################################################################
+
+LIBG7221_VERSION = dbfc29d4806ecdace50379a2f4d68a992a6fec34
+# we use the FreeSwitch fork because it contains pkgconf support
+LIBG7221_SITE = https://freeswitch.org/stash/scm/sd/libg7221.git
+LIBG7221_SITE_METHOD = git
+LIBG7221_LICENSE = Polycom
+LIBG7221_LICENSE_FILES = COPYING
+LIBG7221_AUTORECONF = YES
+LIBG7221_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
