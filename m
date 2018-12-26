From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:33:27 +0100
Subject: [Buildroot] [git commit] package/mender: bump version to 1.7.0
Message-ID: <20181226213043.ECF7D83A69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa9ca504c90bd030263531ef51b076a64a77c1b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
- Remove upstreamed patch.
- Update license files sha256sum's due to year changes.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-FIX-Enabling-compiling-ppc64le.patch      | 37 ----------------------
 package/mender/mender.hash                         |  8 ++---
 package/mender/mender.mk                           |  2 +-
 3 files changed, 5 insertions(+), 42 deletions(-)

diff --git a/package/mender/0001-FIX-Enabling-compiling-ppc64le.patch b/package/mender/0001-FIX-Enabling-compiling-ppc64le.patch
deleted file mode 100644
index 3197a0ec01..0000000000
--- a/package/mender/0001-FIX-Enabling-compiling-ppc64le.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2b13f9a50793fdc15199925000107cb0cc4e7bad Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo@amarulasolutions.com>
-Date: Thu, 9 Aug 2018 09:28:06 +0200
-Subject: [PATCH] FIX: Enabling compiling ppc64le
-
-This patch enables Mender compilation on ppc64le
-
-Changelog: FIX: Enabling compiling ppc64le
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- ioctl_64_bit.go | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ioctl_64_bit.go b/ioctl_64_bit.go
-index 6f61a6c..f1e2dd8 100644
---- a/ioctl_64_bit.go
-+++ b/ioctl_64_bit.go
-@@ -1,4 +1,4 @@
--// Copyright 2017 Northern.tech AS
-+// Copyright 2018 Northern.tech AS
- //
- //    Licensed under the Apache License, Version 2.0 (the "License");
- //    you may not use this file except in compliance with the License.
-@@ -12,7 +12,7 @@
- //    See the License for the specific language governing permissions and
- //    limitations under the License.
- 
--// +build amd64 arm64
-+// +build amd64 arm64 ppc64le
- 
- package main
- 
--- 
-2.17.1
-
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 8faa740e3b..d1531d5d7d 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,14 +1,14 @@
 # Locally computed:
-sha256 267fa73ad472b034248ee298593b5c52ea0b105fd73c91febb3587280c61bee2 mender-1.4.0.tar.gz
+sha256 caee18d1b8446df0cbb9a9c5a1c040d7eb1924332da94c3489494443a8077eb8 mender-1.7.0.tar.gz
 
 # Apache-2.0 license, locally computed
-sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680 LICENSE
+sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7  vendor/github.com/mendersoftware/mendertesting/LICENSE
 sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/log/LICENSE
 sha256 bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/log/COPYING
 sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/scopestack/LICENSE
@@ -38,4 +38,4 @@ sha256 ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/
 sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256 54d6f54a2815cc2e3cef4f7dde5a3aae20f09b2cde394d8d3f1dce5d8a79d738 LIC_FILES_CHKSUM.sha256
+sha256 b84b543cab0505452982422783c0e68b7bfa0a1de4a625753d325e0a8b2dacb1 LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 37a99c1f18..a5cece7044 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 1.4.0
+MENDER_VERSION = 1.7.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 
