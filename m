From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 16:59:15 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.14.2
Message-ID: <1403035155-24320-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../btrfs-progs-0001-no-documentation.patch           | 19 +++++++++++++++++++
 package/btrfs-progs/btrfs-progs.mk                    |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 package/btrfs-progs/btrfs-progs-0001-no-documentation.patch

diff --git a/package/btrfs-progs/btrfs-progs-0001-no-documentation.patch b/package/btrfs-progs/btrfs-progs-0001-no-documentation.patch
new file mode 100644
index 0000000..cdda671
--- /dev/null
+++ b/package/btrfs-progs/btrfs-progs-0001-no-documentation.patch
@@ -0,0 +1,19 @@
+Disable documentation build/install, it needs asciidoc
+and we don't use it anyway.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura btrfs-progs-v3.14.2.orig/Makefile btrfs-progs-v3.14.2/Makefile
+--- btrfs-progs-v3.14.2.orig/Makefile	2014-05-29 21:56:59.000000000 -0300
++++ btrfs-progs-v3.14.2/Makefile	2014-06-17 16:53:29.404520306 -0300
+@@ -57,8 +57,8 @@
+ btrfs_fragment_libs = -lgd -lpng -ljpeg -lfreetype
+ 
+ SUBDIRS =
+-BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS)) build-Documentation
+-INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS)) install-Documentation
++BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS))
++INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS))
+ CLEANDIRS = $(patsubst %,clean-%,$(SUBDIRS))
+ 
+ .PHONY: $(SUBDIRS)
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 415ded2..9ee44ad 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.14.1
+BTRFS_PROGS_VERSION = 3.14.2
 BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/mason/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
-- 
1.8.5.5
