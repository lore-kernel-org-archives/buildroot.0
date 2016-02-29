From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:41:59 +0100
Subject: [Buildroot] [git commit branch/next] package/libcec: bump version,
	add hash
Message-ID: <20160229224218.0A04880478@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dedf1fb57454bbcd1fa5b591cf36c8a8e335ade3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also remove patch committed upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-generate-an-invalid-env.h-when-not-built.patch | 31 ----------------------
 package/libcec/libcec.hash                         |  2 ++
 package/libcec/libcec.mk                           |  2 +-
 3 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch b/package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch
deleted file mode 100644
index d823a5b..0000000
--- a/package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 369ffb5be23eca520df99732541d0482da271fd3 Mon Sep 17 00:00:00 2001
-From: Lars Op den Kamp <lars@opdenkamp.eu>
-Date: Sat, 11 Jul 2015 00:53:17 +0200
-Subject: [PATCH] fixed: don't generate an invalid env.h when not built with
- the .git dir present. closes #112
-
-Backported from upstream commit 2f32a9debc1f148b5dfcfc463480f1432bb71725.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- support/git-rev.sh | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/support/git-rev.sh b/support/git-rev.sh
-index 5dce3d0..4aadae6 100755
---- a/support/git-rev.sh
-+++ b/support/git-rev.sh
-@@ -1,5 +1,8 @@
- #!/bin/sh
- 
- ## cmake doesn't read the variable when it doesn't end with a newline, and I haven't figured out how to have it add a newline directly...
--echo -n "`git --no-pager log --abbrev=7 -n 1 --pretty=format:"%h"`\n"
--
-+if [ -d .git ]; then
-+  echo "`git --no-pager log --abbrev=7 -n 1 --pretty=format:"%h"`"
-+else
-+  echo "<unknown>"
-+fi
--- 
-2.5.0
-
diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
new file mode 100644
index 0000000..377f343
--- /dev/null
+++ b/package/libcec/libcec.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  0f29d5a2d155b507807ba896bc3b3e50a0ab56bf8f543a2bf5c2798c790292b5  libcec-2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd.tar.gz
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index c5b008f..b762d88 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = libcec-3.0.1
+LIBCEC_VERSION = 2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
