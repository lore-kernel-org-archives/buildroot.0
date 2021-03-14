From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:10:25 +0100
Subject: [Buildroot] [git commit] package/mender: bump version to 2.4.2
Message-ID: <20210314214853.6A5757FDFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5056518cd870f6245360312e86ab0a38f6c0061
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Openssl is now a dependency.
  - Set new license hashes due to new dependencies.
  - Set new license file hash due to a year change.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/Config.in   |  1 +
 package/mender/mender.hash | 16 +++++++++-------
 package/mender/mender.mk   | 12 +++++++-----
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 5cb3a3f2e0..6a80c410ce 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index f1eef656fe..43bb92d6ed 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,13 +1,14 @@
 # Locally computed:
-sha256  d7c885a34f7b7f9969970132411225895c136e22be0caaa6dd3e08ca4bb71ff9  2.3.0.tar.gz
+sha256  ff9dccef31b0c6c1710ee767f8f05bc8038034e50968b207ee1a09a10f801ab4  2.4.2.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  LICENSE
+sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
 sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mendertesting/LICENSE
 sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
 #
 # BSD 2 Clause license.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
@@ -26,14 +27,15 @@ sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor
 #
 # MIT license.
 sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
-sha256  dad2b0b2cc2dbdbf95ad5d800ef7588956e74dc2479014829d42be295125c25d  vendor/github.com/stretchr/testify/LICENSE
-sha256  402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENCE.txt
-sha256  fde7d610b9b95fc5a6304055c4dae951025b630aaa42a24e95ebf76675ae832c  vendor/github.com/stretchr/objx/LICENSE.md
+sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
 sha256  ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
-sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/LICENSE
+sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
+sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
+sha256  95b8ef9c4137a8f75ddd3101ffdc4cfd594fa875b261697b68baddc16b0e537c  vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE
+sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
 #
 # OpenLDAP Public License
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256  39f8e574fa6d082b650a5d6159045cdec7c4662da6ccbd67271079904353b8d5  LIC_FILES_CHKSUM.sha256
+sha256  d872f963cdd188b384eb673bf11002e4afb94830710f420a3f3d322695801847  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ca24b853b5..bb37f2d8ed 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.3.0
+MENDER_VERSION = 2.4.2
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
@@ -16,6 +16,7 @@ MENDER_LICENSE_FILES = \
 	LIC_FILES_CHKSUM.sha256 \
 	vendor/github.com/mendersoftware/mendertesting/LICENSE \
 	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
+	vendor/github.com/mendersoftware/openssl/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/crypto/LICENSE \
@@ -27,13 +28,14 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
-	vendor/github.com/stretchr/testify/LICENCE.txt \
-	vendor/github.com/stretchr/objx/LICENSE.md \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
-	vendor/github.com/urfave/cli/LICENSE \
+	vendor/github.com/urfave/cli/v2/LICENSE \
+	vendor/github.com/stretchr/objx/LICENSE \
+	vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE \
+	vendor/gopkg.in/yaml.v3/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
-MENDER_DEPENDENCIES = xz
+MENDER_DEPENDENCIES = openssl xz
 
 MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
 
