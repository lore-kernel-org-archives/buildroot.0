From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 15:43:26 +0100
Subject: [Buildroot] [git commit] package/libuhttpd: bump to version 3.8.0
Message-ID: <20210117142506.BCBEF80AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eec4724ffb7be11239de65c58454856b52c2325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BUILD_TEST_PLUGIN has been dropped since version 3.5.0 and
https://github.com/zhaojh329/libuhttpd/commit/0b2c2f4a3bdc192fffcec6fb6fd297068b6ff873

https://github.com/zhaojh329/libuhttpd/releases/tag/v3.7.0
https://github.com/zhaojh329/libuhttpd/releases/tag/v3.8.0

Fixes:
 - http://autobuild.buildroot.org/results/0d53b561ba02db018ca90dce29e9064b12c1276b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 6053df6593..98ae64bf70 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5cdbff570430530b46ed071363c52cc655bbb349943008b57f63061481586391  libuhttpd-3.6.0.tar.gz
+sha256  cdf97020be8ef73e74f12e0703e0f871ebd26c641ce2cb31f67c90a79483c372  libuhttpd-3.8.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index f665b27969..60f0455ddd 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.6.0
+LIBUHTTPD_VERSION = 3.8.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
 LIBUHTTPD_INSTALL_STAGING = YES
 LIBUHTTPD_DEPENDENCIES = libev
-LIBUHTTPD_CONF_OPTS = -DBUILD_TEST_PLUGIN=OFF
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUHTTPD_DEPENDENCIES += openssl
