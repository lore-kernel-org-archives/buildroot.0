From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 28 Mar 2020 15:26:10 -0700
Subject: [Buildroot] [PATCH 1/2] package/mender: bump version to 2.2.0
Message-ID: <20200328222612.3717621-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Update license file hashes due to copyright year change.
  - Remove vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE
    as it no longer exists.
  - Add new vendor/github.com/urfave/cli/LICENSE hash.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender/mender.hash | 10 ++++------
 package/mender/mender.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 6d0a64da95..6a258cf206 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,13 +1,11 @@
 # Locally computed:
-sha256 eb288eaee8be4d58edeef7c8d1c3caa8fea94740a2002520ed43bc717c01dca6 2.1.2.tar.gz
-
-# Apache-2.0 license, locally computed
-sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE
+sha256 fe3567107d1dc9b3f3961f3a19d426bd7728fbc1525b72b8204765670234f4b6 2.2.0.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
+sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  LICENSE
 sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mendertesting/LICENSE
 sha256  ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/log/LICENSE
 sha256  ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/scopestack/LICENSE
@@ -34,10 +32,10 @@ sha256  dad2b0b2cc2dbdbf95ad5d800ef7588956e74dc2479014829d42be295125c25d  vendor
 sha256  402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENCE.txt
 sha256  fde7d610b9b95fc5a6304055c4dae951025b630aaa42a24e95ebf76675ae832c  vendor/github.com/stretchr/objx/LICENSE.md
 sha256  ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
-sha256  95b8ef9c4137a8f75ddd3101ffdc4cfd594fa875b261697b68baddc16b0e537c  vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE
+sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/LICENSE
 #
 # OpenLDAP Public License
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256 af7578d06eb10566dd12e9fb57113d035abd69b274eb2b8c70e83f9da3b7c9d7 LIC_FILES_CHKSUM.sha256
+sha256 8edc8cda9cc06270f44d2d75f7810a6ccc3d71c251cadb5e1a3065eb057a3132 LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 87fdc45268..6543402f07 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.1.2
+MENDER_VERSION = 2.2.0
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
@@ -32,7 +32,7 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/stretchr/testify/LICENCE.txt \
 	vendor/github.com/stretchr/objx/LICENSE.md \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
-	vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE \
+	vendor/github.com/urfave/cli/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 MENDER_DEPENDENCIES = xz
-- 
2.25.1
