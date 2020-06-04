From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Jun 2020 23:35:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/libhttpserver: disable examples
Message-ID: <20200604213522.12291-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

examples are enabled by default since version 0.17.5 and
https://github.com/etr/libhttpserver/commit/012d014a7c52ef91a35c521d5d4f83ee11de5068

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhttpserver/libhttpserver.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 1fd76519f4..2c536cf012 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -9,7 +9,9 @@ LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
 LIBHTTPSERVER_INSTALL_STAGING = YES
-LIBHTTPSERVER_CONF_OPTS = --enable-same-directory-build
+LIBHTTPSERVER_CONF_OPTS = \
+	--disable-examples \
+	--enable-same-directory-build
 LIBHTTPSERVER_AUTORECONF = YES
 LIBHTTPSERVER_DEPENDENCIES = libmicrohttpd
 
-- 
2.26.2
