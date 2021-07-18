From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 09:44:57 +0200
Subject: [Buildroot] [git commit] package/libuci: ignore CVE-2019-15513
Message-ID: <20210718071254.31948912BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=46273a8eb92171b3c70a6b2750549329a0d4ccba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2019-15513 was fixed upstream in 2015 with commit
19e29ffc15dbd958e8e6a648ee0982c68353516f, which is older than the commit
we currently use in LIBUCI_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: reword comment and commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libuci/libuci.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index a8922a96e1..0d0b78036e 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -12,6 +12,9 @@ LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
+# Fixed in commit 19e29ffc15dbd958e8e6a648ee0982c68353516f, older than LIBUCI_VERSION
+LIBUCI_IGNORE_CVES += CVE-2019-15513
+
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
