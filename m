From: Martin Bark <martin@barkynet.com>
Date: Thu, 14 Mar 2019 13:38:13 +0000
Subject: [Buildroot] [PATCH 3/3] package/nodejs: use shared nghttp2 library
In-Reply-To: <20190314133813.727-1-martin@barkynet.com>
References: <20190314133813.727-1-martin@barkynet.com>
Message-ID: <20190314133813.727-4-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
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
index 833b1989e6..42b92d66a2 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,7 @@ NODEJS_VERSION = 10.15.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-	libhttpparser libuv zlib \
+	libhttpparser libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib host-patchelf
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -20,6 +20,7 @@ NODEJS_CONF_OPTS = \
 	--shared-cares \
 	--shared-http-parser \
 	--shared-libuv \
+	--shared-nghttp2 \
 	--without-dtrace \
 	--without-etw \
 	--dest-os=linux
-- 
2.21.0
