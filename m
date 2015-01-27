From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:53 +0100
Subject: [Buildroot] [RFC 8/8] docs/manual: update manual about <pkg>-help
	tagret
In-Reply-To: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1422394913-13257-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the manual to:

 * Indicate the existence of the <pkg>-help target;

 * Remove the explanation about certain targets in "make help" not
   being always visible, since this is no longer true.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/make-tips.txt           | 11 -----------
 docs/manual/package-make-target.txt |  2 ++
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 027eddf..2ad4dbd 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -18,17 +18,6 @@ This is a collection of tips that help you make the most of Buildroot.
  $ make help
 --------------------
 
-Not all targets are always available,
-some settings in the +.config+ file may hide some targets:
-
-* +busybox-menuconfig+ only works when +busybox+ is enabled;
-* +linux-menuconfig+ and +linux-savedefconfig+ only work when
-  +linux+ is enabled;
-* +uclibc-menuconfig+ is only available when the uClibc C library is
-  selected in the internal toolchain backend;
-* +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
-  +barebox+ bootloader is enabled.
-
 .Cleaning:
 
 Explicit cleaning is required when any of the architecture or toolchain
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 25d3f44..4426e5f 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -59,6 +59,8 @@ Additionally, there are some other useful make targets:
 |===================================================
 | command/target    | Description
 
+| +help+            | Show the available targets for this package
+
 | +show-depends+    | Displays the dependencies required to build the
 package
 
-- 
2.1.0
