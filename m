From: Murat Demirten <mdemirten@yh.com.tr>
Date: Mon, 13 Jun 2011 12:40:54 +0300
Subject: [Buildroot] [PATCH] Add package fribidi
Message-ID: <BANLkTinpAtwa0MsVbvyR7cTrbewGt5Jc6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm sending the patch for the new package fribidi.

Fribidi is a free implementation of the Unicode BiDi algorithm for Hebrew
and/or Arabic languages.
It is required mostly by the applications which have I18n support.



[master 7d6b6b6] GNU fribidi package added
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/fribidi/Config.in
 create mode 100644 package/fribidi/fribidi.mk
---

 package/Config.in          |    1 +
 package/fribidi/Config.in  |    6 ++++++
 package/fribidi/fribidi.mk |   17 +++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/fribidi/Config.in
 create mode 100644 package/fribidi/fribidi.mk

diff --git a/package/Config.in b/package/Config.in
index 10d435c..81701d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,6 +344,7 @@ endmenu

 menu "Text and terminal handling"
 source "package/enchant/Config.in"
+source "package/fribidi/Config.in"
 source "package/icu/Config.in"
 source "package/libiconv/Config.in"
 source "package/ncurses/Config.in"
diff --git a/package/fribidi/Config.in b/package/fribidi/Config.in
new file mode 100644
index 0000000..f8f4bc1
--- /dev/null
+++ b/package/fribidi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FRIBIDI
+       bool "fribidi"
+       help
+         Free Implementation of the Unicode BiDi algorithm for Hebrew
and/or Arabic languages.
+
+         http://fribidi.org/download
diff --git a/package/fribidi/fribidi.mk b/package/fribidi/fribidi.mk
new file mode 100644
index 0000000..532d648
--- /dev/null
+++ b/package/fribidi/fribidi.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# fribidi
+#
+#############################################################
+FRIBIDI_VERSION = 0.10.9
+FRIBIDI_SOURCE = fribidi-$(FRIBIDI_VERSION).tar.gz
+FRIBIDI_SITE = http://fribidi.org/download
+FRIBIDI_INSTALL_STAGING = YES
+FRIBIDI_INSTALL_TARGET = YES
+
+define FRIBIDI_INSTALL_TARGET_CMDS
+       mkdir -p $(TARGET_DIR)/usr/lib
+       cp -dpf $(@D)/.libs/libfribidi.so* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(call AUTOTARGETS,package,fribidi))
-- 
1.7.5.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110613/5ce79455/attachment.html>
