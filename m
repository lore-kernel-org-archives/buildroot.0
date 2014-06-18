From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:56:58 +0200
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 3.14.2
Message-ID: <20140618123419.AC7379D043@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed84ec6d6e9684a7ec9af9846bcf1ba20c19751d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../btrfs-progs-0001-no-documentation.patch        |   19 +++++++++++++++++++
 package/btrfs-progs/btrfs-progs.mk                 |    2 +-
 2 files changed, 20 insertions(+), 1 deletions(-)

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
