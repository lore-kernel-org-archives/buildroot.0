From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  6 Oct 2019 12:58:22 -0700
Subject: [Buildroot] [PATCH 1/1] package/mender: bump to version 2.1.0
Message-ID: <20191006195822.36828-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also change License sha256sums.
Removed:
  - vendor/github.com/mendersoftware/log/COPYING
  - vendor/github.com/mendersoftware/scopestack/COPYING

Added:
  - vendor/golang.org/x/crypto/LICENSE
  - vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE

moved:
  - vendor/github.com/mendersoftware/go-liblzma/LICENSE to 
    vendor/github.com/remyoudompheng/go-liblzma/LICENSE

  - vendor/github.com/Sirupsen/logrus/LICENSE to 
    vendor/github.com/sirupsen/logrus/LICENSE

Updated:
  - vendor/github.com/mendersoftware/log/LICENSE: Changed from copyright mender
    software to Apache 2.0

  - vendor/github.com/mendersoftware/scopestack/LICENSE: Changed from copyright
    mender to Apache 2.0.


Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender/mender.hash | 54 +++++++++++++++++++-------------------
 package/mender/mender.mk   | 10 +++----
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index ba69229fcb..a542120144 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 0ece9e7b23ab43691112aac90d3b757c37ebd1c7c2b3d9c0668243d1503d1e55 2.0.1.tar.gz
+sha256 fb7949a2ab5c86f2490bde715634e374c1a9e85b5e541db2aece2587947a52fe 2.1.0.tar.gz
 
 # Apache-2.0 license, locally computed
 sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE
@@ -8,36 +8,36 @@ sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mendertesting/LICENSE
-sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/log/LICENSE
-sha256 bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/log/COPYING
-sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/scopestack/LICENSE
-sha256 bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/scopestack/COPYING
-sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mender-artifact/LICENSE
-
+sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256  ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/log/LICENSE
+sha256  ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/scopestack/LICENSE
+sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+#
 # BSD 2 Clause license.
-sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
-
+sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
+#
 # BSD 3 Clause license.
-sha256 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
-sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
-sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
-sha256 0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/github.com/bmatsuo/lmdb-go/LICENSE.md
-sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/text/LICENSE
-sha256 a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a  vendor/github.com/mendersoftware/go-liblzma/LICENSE
-
+sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
+sha256  0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/github.com/bmatsuo/lmdb-go/LICENSE.md
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/text/LICENSE
+sha256  87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
+#
 # ISC license.
-sha256 1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
-
+sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
+#
 # MIT license.
-sha256 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/Sirupsen/logrus/LICENSE
-sha256 dad2b0b2cc2dbdbf95ad5d800ef7588956e74dc2479014829d42be295125c25d  vendor/github.com/stretchr/testify/LICENSE
-sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENCE.txt
-sha256 fde7d610b9b95fc5a6304055c4dae951025b630aaa42a24e95ebf76675ae832c  vendor/github.com/stretchr/objx/LICENSE.md
-sha256 ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
-
+sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
+sha256  dad2b0b2cc2dbdbf95ad5d800ef7588956e74dc2479014829d42be295125c25d  vendor/github.com/stretchr/testify/LICENSE
+sha256  402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENCE.txt
+sha256  fde7d610b9b95fc5a6304055c4dae951025b630aaa42a24e95ebf76675ae832c  vendor/github.com/stretchr/objx/LICENSE.md
+sha256  ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
+sha256  95b8ef9c4137a8f75ddd3101ffdc4cfd594fa875b261697b68baddc16b0e537c  vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE
+#
 # OpenLDAP Public License
-sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256 b4b6f1b6f923ae052ac1393ebcd302844db5e9306df37ce07d7c912f15746e3c LIC_FILES_CHKSUM.sha256
+sha256 af7578d06eb10566dd12e9fb57113d035abd69b274eb2b8c70e83f9da3b7c9d7 LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 1179fdc688..aa102b1f4b 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.0.1
+MENDER_VERSION = 2.1.0
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
@@ -16,23 +16,23 @@ MENDER_LICENSE_FILES = \
 	LIC_FILES_CHKSUM.sha256 \
 	vendor/github.com/mendersoftware/mendertesting/LICENSE \
 	vendor/github.com/mendersoftware/log/LICENSE \
-	vendor/github.com/mendersoftware/log/COPYING \
 	vendor/github.com/mendersoftware/scopestack/LICENSE \
-	vendor/github.com/mendersoftware/scopestack/COPYING \
 	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
+	vendor/golang.org/x/crypto/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
 	vendor/golang.org/x/net/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
 	vendor/golang.org/x/text/LICENSE \
-	vendor/github.com/mendersoftware/go-liblzma/LICENSE \
+	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
-	vendor/github.com/Sirupsen/logrus/LICENSE \
+	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/stretchr/testify/LICENCE.txt \
 	vendor/github.com/stretchr/objx/LICENSE.md \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
+	vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 MENDER_DEPENDENCIES = xz
-- 
2.21.0
