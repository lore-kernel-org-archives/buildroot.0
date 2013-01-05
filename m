From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 22:46:28 +0100
Subject: [Buildroot] [git commit] new package: libfribidi
Message-ID: <20130105215230.94CB99A5BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf6ec44578a06907b9d86dc57b20ddf226ea0c74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: moved under 'Text and terminal handling']
Signed-off-by: Mikhail Boiko <mikhailboiko85@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/libfribidi/Config.in     |    7 +++++++
 package/libfribidi/libfribidi.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 11ff82d..047af8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -545,6 +545,7 @@ endmenu
 
 menu "Text and terminal handling"
 source "package/enchant/Config.in"
+source "package/libfribidi/Config.in"
 source "package/icu/Config.in"
 source "package/libiconv/Config.in"
 source "package/linenoise/Config.in"
diff --git a/package/libfribidi/Config.in b/package/libfribidi/Config.in
new file mode 100644
index 0000000..74d9c5b
--- /dev/null
+++ b/package/libfribidi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBFRIBIDI
+	bool "libfribidi"
+	help
+	  GNU FriBidi is an implementation of the Unicode
+	  Bidirectional Algorithm (bidi).
+
+	  http://www.fribidi.org/
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
new file mode 100644
index 0000000..538997c
--- /dev/null
+++ b/package/libfribidi/libfribidi.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libfribidi
+#
+#############################################################
+
+LIBFRIBIDI_VERSION = 0.19.5
+LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
+LIBFRIBIDI_SITE = http://www.fribidi.org/download/
+LIBFRIBIDI_LICENSE = LGPLv2.1+
+LIBFRIBIDI_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
