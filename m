From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Apr 2017 13:50:58 +0300
Subject: [Buildroot] [PATCH] libnl: add upstream security fix
Message-ID: <b4aa22c38bf917ebab1e80069dacbe2c892e9bc1.1493290258.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2017-0553: An elevation of privilege vulnerability in libnl could enable a
local malicious application to execute arbitrary code within the context of
the Wi-Fi service

https://www.mail-archive.com/debian-bugs-dist at lists.debian.org/msg1511855.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnl/libnl.hash | 1 +
 package/libnl/libnl.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 9761a9580cc9..f357927ef773 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,3 @@
 # From https://github.com/thom311/libnl/releases/download/libnl3_2_29/libnl-3.2.29.tar.gz.sha256sum
 sha256	0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922	libnl-3.2.29.tar.gz
+sha256	b7bb929194eefc56c786a7e1ae5176b54713f9013ccec63760f232742ae80361	3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 6de6825ca3bf..8226f87487d1 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,6 +13,8 @@ LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 # Patching configure.ac
 LIBNL_AUTORECONF = YES
 
+LIBNL_PATCH = https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
+
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
 else
-- 
2.11.0
