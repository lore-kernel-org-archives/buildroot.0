From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:23:38 +0100
Subject: [Buildroot] [git commit branch/next] package/botan: bump to version
 2.17.0
Message-ID: <20201107121029.60BF487586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5948cd6163251bb468d801b552d89964ce84007a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch (already in version)

https://botan.randombit.net/news.html#version-2-17-0-2020-11-05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-build-data-arch-arm64.txt-add-aarch64_be.patch | 31 ----------------------
 package/botan/botan.hash                           |  2 +-
 package/botan/botan.mk                             |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch b/package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch
deleted file mode 100644
index fd6a2ffddd..0000000000
--- a/package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a93bc8503649028852402c61bdda531af2872d0e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 15 Oct 2020 09:15:06 +0200
-Subject: [PATCH] src/build-data/arch/arm64.txt: add aarch64_be
-
-Allow the user to set cpu value to aarch64_be.
-Endianness will be correctly guessed by choose_endian function because
-this alias ends with "be"
-
-Fixes:
- - http://autobuild.buildroot.org/results/69ebf03c59b2af4140a39bc26f17d0396b6ec15d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/randombit/botan/commit/a93bc8503649028852402c61bdda531af2872d0e]
----
- src/build-data/arch/arm64.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/build-data/arch/arm64.txt b/src/build-data/arch/arm64.txt
-index 056c5318ff..5205295125 100644
---- a/src/build-data/arch/arm64.txt
-+++ b/src/build-data/arch/arm64.txt
-@@ -5,6 +5,7 @@ family arm
- 
- <aliases>
- aarch64
-+aarch64_be
- armv8
- armv8-a
- </aliases>
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 003dd13e9c..612aa1e85a 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  92ed6ebc918d86bd1b04221ca518af4cf29cc326c4760740bd2d22e61cea2628  Botan-2.16.0.tar.xz
+sha256  b97044b312aa718349af7851331b064bc7bd5352400d5f80793bace427d01343  Botan-2.17.0.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index d36324c7f7..79c45ffb5f 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.16.0
+BOTAN_VERSION = 2.17.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
