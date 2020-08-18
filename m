From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:42:20 +0200
Subject: [Buildroot] [git commit] package/musl: bump to version 1.2.1
Message-ID: <20200902161635.7B29D85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=409528c996dc36614d3e71cbc72a598c8874c7f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file has seen a few changes, but the overall license
remains MIT. Details of the changes:

--- output/build/musl-1.2.0/COPYRIGHT	2020-02-21 01:37:02.000000000 +0100
+++ output/build/musl-1.2.1/COPYRIGHT	2020-08-04 06:21:09.000000000 +0200
@@ -127,10 +127,13 @@
 and labelled as such in comments in the individual source files. All
 have been licensed under extremely permissive terms.

-The ARM memcpy code (src/string/arm/memcpy_el.S) is Copyright ?? 2008
+The ARM memcpy code (src/string/arm/memcpy.S) is Copyright ?? 2008
 The Android Open Source Project and is licensed under a two-clause BSD
 license. It was taken from Bionic libc, used on Android.

+The AArch64 memcpy and memset code (src/string/aarch64/*) are
+Copyright ?? 1999-2019, Arm Limited.
+
 The implementation of DES for crypt (src/crypt/crypt_des.c) is
 Copyright ?? 1994 David Burren. It is licensed under a BSD license.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/musl.hash | 6 +++---
 package/musl/musl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 9d8b61e165..39f1057961 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://musl.libc.org/releases/musl-1.2.0.tar.gz.asc
-sha256  c6de7b191139142d3f9a7b5b702c9cae1b5ee6e7f57e582da9328629408fd4e8  musl-1.2.0.tar.gz
-sha256  afe1df384787fce3577f3356b8b0d417381483f7c704eacb63f8050349fac77a  COPYRIGHT
+# https://musl.libc.org/releases/musl-1.2.1.tar.gz.asc
+sha256  68af6e18539f646f9c41a3a2bb25be4a5cfa5a8f65f0bb647fd2bbfdf877e84b  musl-1.2.1.tar.gz
+sha256  f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 9482c0b246..bc4237968d 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.2.0
+MUSL_VERSION = 1.2.1
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
