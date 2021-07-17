From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 23:48:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/libuci: ignore CVE-2019-15513
In-Reply-To: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
References: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717214854.1150900-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 19e29ffc15dbd958e8e6a648ee0982c68353516f is older than LIBUCI_VERSION

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuci/libuci.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index ae70b6f2af..5288b08406 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -13,6 +13,9 @@ LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
+# Commit 19e29ffc15dbd958e8e6a648ee0982c68353516f is older than LIBUCI_VERSION
+LIBUCI_IGNORE_CVES += CVE-2019-15513
+
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
-- 
2.30.2
