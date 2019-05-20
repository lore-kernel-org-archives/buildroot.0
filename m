From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:08:29 +0200
Subject: [Buildroot] [git commit] package/pcsc-lite: security bump to
 version 1.8.25
Message-ID: <20190520090454.D0C7A81302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=716c54829c410d6f557cf29da87b5eb6e4625481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contains the following security related fixes:
 - Race condition possibility; CWE-362: Concurrent Execution using
   Shared Resource with Improper Synchronization ('Race Condition'):
   https://github.com/LudovicRousseau/PCSC/commit/36c8eae890dc81f0e25ebf0be1c6a969ffd9543a
 - Fix realloc error handling:
   https://github.com/LudovicRousseau/PCSC/commit/430043842e05a300f1dda1b93fcfa8fceadd81e5

Update hash of COPYING and remove MIT from licenses because sd-daemon
files were removed:
https://github.com/LudovicRousseau/PCSC/commit/0984e0f4a03e5e29bb5725b6f149f56c9e9c73c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcsc-lite/pcsc-lite.hash | 4 ++--
 package/pcsc-lite/pcsc-lite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 3b8cde1617..7e209f8cd2 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 5a27262586eff39cfd5c19aadc8891dd71c0818d3d629539bd631b958be689c9  pcsc-lite-1.8.23.tar.bz2
-sha256 2ce8f52bc5afa74f223121955e4e6328c432b16044ea535acd550435dda2b5db  COPYING
+sha256 d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792  pcsc-lite-1.8.25.tar.bz2
+sha256 40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 5a18d46a71..e819a93910 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.23
+PCSC_LITE_VERSION = 1.8.25
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
-PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist), MIT (sd-daemon)
+PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
 PCSC_LITE_AUTORECONF = YES
 
