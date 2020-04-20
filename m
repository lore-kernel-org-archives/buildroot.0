From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:46:14 +0200
Subject: [Buildroot] [git commit] package/libuwsc: manage BUILD_STATIC_LIBS
Message-ID: <20200420053724.E44F68F3B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfd8d7be71310e340acf955c053fe7070591bf6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use BUILD_STATIC_LIBS added in version 3.3.5 with
https://github.com/zhaojh329/libuwsc/commit/1759dfd7d9f65775dc0a27e85b8c8c482efbfd00

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuwsc/libuwsc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
index 08ea72c1f3..cad351529d 100644
--- a/package/libuwsc/libuwsc.mk
+++ b/package/libuwsc/libuwsc.mk
@@ -43,4 +43,11 @@ else
 LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=OFF
 endif
 
+# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBUWSC_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBUWSC_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+endif
+
 $(eval $(cmake-package))
