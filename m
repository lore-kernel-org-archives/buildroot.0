From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:13:30 +0200
Subject: [Buildroot] [PATCH 1/8] package/mender: update legal info
In-Reply-To: <20180814231337.19114-1-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
Message-ID: <20180814231337.19114-2-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And also added license checksums in mender.hash

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/mender.hash | 4 ++++
 package/mender/mender.mk   | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 30a04fad7a..6a8bb5795b 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,2 +1,6 @@
 # Locally computed:
 sha256 267fa73ad472b034248ee298593b5c52ea0b105fd73c91febb3587280c61bee2 mender-1.4.0.tar.gz
+
+# License, locally computed
+sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680 LICENSE
+sha256 54d6f54a2815cc2e3cef4f7dde5a3aae20f09b2cde394d8d3f1dce5d8a79d738 LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 695b5e7a91..0dad93be28 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -6,6 +6,8 @@
 
 MENDER_VERSION = 1.4.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
+MENDER_LICENSE = Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT & OLDAP-2.8
+MENDER_LICENSE_FILES = LICENSE LIC_FILES_CHKSUM.sha256
 
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0644 package/mender/mender.conf \
-- 
2.18.0
