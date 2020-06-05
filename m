From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:11:54 +0200
Subject: [Buildroot] [git commit] package/libhttpserver: disable examples
Message-ID: <20200605221141.4AC9382ABB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e8fe3704a6a75c639d24dfbade469ad539e7ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

examples are enabled by default since version 0.17.5 and
https://github.com/etr/libhttpserver/commit/012d014a7c52ef91a35c521d5d4f83ee11de5068

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
