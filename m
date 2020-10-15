From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Oct 2020 18:04:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build with aarch64_be
Message-ID: <20201015160435.846256-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aarch64_be support was added by commit 3e3b524883cebf190099c72d41c817baa8192589

Fixes:
 - http://autobuild.buildroot.org/results/69ebf03c59b2af4140a39bc26f17d0396b6ec15d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-data-arch-arm64.txt-add-aarch64_be.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch

diff --git a/package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch b/package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch
new file mode 100644
index 0000000000..fd6a2ffddd
--- /dev/null
+++ b/package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch
@@ -0,0 +1,31 @@
+From a93bc8503649028852402c61bdda531af2872d0e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 15 Oct 2020 09:15:06 +0200
+Subject: [PATCH] src/build-data/arch/arm64.txt: add aarch64_be
+
+Allow the user to set cpu value to aarch64_be.
+Endianness will be correctly guessed by choose_endian function because
+this alias ends with "be"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/69ebf03c59b2af4140a39bc26f17d0396b6ec15d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/randombit/botan/commit/a93bc8503649028852402c61bdda531af2872d0e]
+---
+ src/build-data/arch/arm64.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/build-data/arch/arm64.txt b/src/build-data/arch/arm64.txt
+index 056c5318ff..5205295125 100644
+--- a/src/build-data/arch/arm64.txt
++++ b/src/build-data/arch/arm64.txt
+@@ -5,6 +5,7 @@ family arm
+ 
+ <aliases>
+ aarch64
++aarch64_be
+ armv8
+ armv8-a
+ </aliases>
-- 
2.28.0
