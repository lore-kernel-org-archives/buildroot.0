From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 9 Mar 2012 13:18:03 +0000
Subject: [Buildroot] New package minicom
Message-ID: <CAHt8ZCNu6JL+dO4YzucYVtFAoH7rEFu8YRJ08PQ5yTH2HDUU7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson<spdawson@gmail.com>
---
 package/Config.in          |    1 +
 package/minicom/Config.in  |    9 +++++++++
 package/minicom/minicom.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/minicom/Config.in
 create mode 100644 package/minicom/minicom.mk

diff --git a/package/Config.in b/package/Config.in
index 41cbb8c..c582f8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ source "package/lvm2/Config.in"
 source "package/makedevs/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
+source "package/minicom/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
diff --git a/package/minicom/Config.in b/package/minicom/Config.in
new file mode 100644
index 0000000..9a69eb1
--- /dev/null
+++ b/package/minicom/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MINICOM
+       bool "minicom"
+       select BR2_PACKAGE_LIBICONV
+       help
+         Minicom is a menu driven communications program.
+         It emulates ANSI and VT102 terminals. It has a
+         dialing directory and auto zmodem download.
+
+         http://alioth.debian.org/projects/minicom
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
new file mode 100644
index 0000000..f6bcd6c
--- /dev/null
+++ b/package/minicom/minicom.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# minicom
+#
+#############################################################
+MINICOM_VERSION = 2.6
+MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/3689/
+
+MINICOM_DEPENDENCIES = libiconv
+
+$(eval $(call AUTOTARGETS))
