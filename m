From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Jun 2009 11:26:23 +0100
Subject: [Buildroot] [git commit] enchant: New package for enchant
	spell-checking library.
Message-ID: <20090705195450.62D3F777D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c3a3af86e072b021a4e4924297a6fbab42d321b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Enchant is a spell checking library that provides a consistent API across
a number of spell-checking system backends.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/enchant/Config.in  |    7 +++++++
 package/enchant/enchant.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/enchant/Config.in
 create mode 100644 package/enchant/enchant.mk

diff --git a/package/Config.in b/package/Config.in
index 1dfdb20..cb83563 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -61,6 +61,7 @@ source "package/customize/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dash/Config.in"
 endif
+source "package/enchant/Config.in"
 source "package/file/Config.in"
 source "package/gamin/Config.in"
 source "package/icu/Config.in"
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
new file mode 100644
index 0000000..0771a47
--- /dev/null
+++ b/package/enchant/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ENCHANT
+	bool "enchant"
+	help
+	  Enchant is a spell-checking library that provides a consistent
+	  API across a number of spell-checking system backends.
+
+	  http://www.abisource.com/projects/enchant/
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
new file mode 100644
index 0000000..d972465
--- /dev/null
+++ b/package/enchant/enchant.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# enchant
+#
+#############################################################
+ENCHANT_VERSION = 1.5.0
+ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
+ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
+
+ENCHANT_INSTALL_STAGING = YES
+ENCHANT_INSTALL_TARGET = YES
+ENCHANT_LIBTOOL_PATCH = NO
+
+$(eval $(call AUTOTARGETS,package,enchant))
-- 
1.6.3.3
