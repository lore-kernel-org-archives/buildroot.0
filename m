From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 19:28:05 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/nodejs: use
 shared nghttp2 library
Message-ID: <20190925175412.5F0428F3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4f4fe45b669932b909dcfe7e362ffc2f2de7e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9a52e173b55e0ee2d10f93ea80017174324ca7a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/Config.in | 1 +
 package/nodejs/nodejs.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index d2846f8d57..e995441304 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -30,6 +30,7 @@ config BR2_PACKAGE_NODEJS
 	select BR2_PACKAGE_LIBHTTPPARSER
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_NGHTTP2
 	help
 	  Event-driven I/O server-side JavaScript environment based on
 	  V8.
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 06d2eaad99..b4e9351c63 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,7 @@ NODEJS_VERSION = 8.15.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-	libhttpparser libuv zlib \
+	libhttpparser libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -20,6 +20,7 @@ NODEJS_CONF_OPTS = \
 	--shared-cares \
 	--shared-http-parser \
 	--shared-libuv \
+	--shared-nghttp2 \
 	--without-dtrace \
 	--without-etw \
 	--dest-os=linux
