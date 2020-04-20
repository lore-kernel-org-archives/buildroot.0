From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:46:55 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: manage BUILD_STATIC_LIBS
Message-ID: <20200420053724.EE9128F385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2004cf740a2e0a81bc700274daa257c9b702e444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use BUILD_STATIC_LIBS which has been added in version 3.1.4 with
https://github.com/zhaojh329/libuhttpd/commit/4d0f435e0b96140f7b74239bbe2f76d5f7d782b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/libuhttpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index d3499373a6..59a8b45c07 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -36,4 +36,11 @@ else
 LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
 endif
 
+# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+endif
+
 $(eval $(cmake-package))
