From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:10:53 +0200
Subject: [Buildroot] [git commit branch/next] wget: add optional dependency
 for libidn2
Message-ID: <20180520141552.77F848131C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d71ef3cf658b2bb3400938bb1e6b0ddd4f28dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 23e4c8acca..c3c792f1e8 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -26,6 +26,13 @@ else
 WGET_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+WGET_CONF_OPTS += --with-libidn
+WGET_DEPENDENCIES += libidn2
+else
+WGET_CONF_OPTS += --without-libidn
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 WGET_DEPENDENCIES += util-linux
 endif
