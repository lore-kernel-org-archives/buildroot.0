From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:10 +0200
Subject: [Buildroot] [[PATCH v2 10/14] package/mender: update legal info
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-11-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added license checksums in mender.hash

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---

Changes in V2:

- Added all vendor licenses to mender.hash and MENDER_LICENSE_FILES

 package/mender/mender.hash | 39 +++++++++++++++++++++++++++++++++++++++
 package/mender/mender.mk   | 25 +++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 30a04fad7a..8faa740e3b 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,2 +1,41 @@
 # Locally computed:
 sha256 267fa73ad472b034248ee298593b5c52ea0b105fd73c91febb3587280c61bee2 mender-1.4.0.tar.gz
+
+# Apache-2.0 license, locally computed
+sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680 LICENSE
+
+# Vendor licenses
+# Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
+
+# Apache-2.0 license.
+sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/log/LICENSE
+sha256 bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/log/COPYING
+sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/scopestack/LICENSE
+sha256 bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/scopestack/COPYING
+sha256 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+
+# BSD 2 Clause license.
+sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
+
+# BSD 3 Clause license.
+sha256 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
+sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
+sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
+sha256 0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/github.com/bmatsuo/lmdb-go/LICENSE.md
+
+# ISC license.
+sha256  3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25  vendor/github.com/davecgh/go-spew/LICENSE
+
+# MIT license.
+sha256 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/Sirupsen/logrus/LICENSE
+sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENSE
+sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENCE.txt
+sha256 fde7d610b9b95fc5a6304055c4dae951025b630aaa42a24e95ebf76675ae832c  vendor/github.com/stretchr/objx/LICENSE.md
+sha256 ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
+
+# OpenLDAP Public License
+sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
+
+# sha256 of all the vendor licenses combined
+sha256 54d6f54a2815cc2e3cef4f7dde5a3aae20f09b2cde394d8d3f1dce5d8a79d738 LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 1f54862077..fafb0d923a 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -6,6 +6,31 @@

 MENDER_VERSION = 1.4.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
+MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
+
+# Vendor license paths generated with:
+#    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
+MENDER_LICENSE_FILES = \
+	LICENSE \
+	LIC_FILES_CHKSUM.sha256 \
+	vendor/github.com/mendersoftware/mendertesting/LICENSE \
+	vendor/github.com/mendersoftware/log/LICENSE \
+	vendor/github.com/mendersoftware/log/COPYING \
+	vendor/github.com/mendersoftware/scopestack/LICENSE \
+	vendor/github.com/mendersoftware/scopestack/COPYING \
+	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
+	vendor/github.com/pkg/errors/LICENSE \
+	vendor/github.com/pmezard/go-difflib/LICENSE \
+	vendor/golang.org/x/sys/LICENSE \
+	vendor/golang.org/x/net/LICENSE \
+	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
+	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/Sirupsen/logrus/LICENSE \
+	vendor/github.com/stretchr/testify/LICENSE \
+	vendor/github.com/stretchr/testify/LICENCE.txt \
+	vendor/github.com/stretchr/objx/LICENSE.md \
+	vendor/github.com/ungerik/go-sysfs/LICENSE \
+	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md

 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
--
2.11.0
