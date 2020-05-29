From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 22:48:51 +0200
Subject: [Buildroot] [git commit] package/hiawatha: enable optional xslt
 support
Message-ID: <20200602200122.46BD7812A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4cda668d8a1cf1085581e16b1a6c2622ebb5578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hiawatha/hiawatha.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index eefd0f6f89..28fd286ea8 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -17,9 +17,15 @@ else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+HIAWATHA_CONF_OPTS += -DENABLE_XSLT=ON
+HIAWATHA_DEPENDENCIES += libxslt
+else
+HIAWATHA_CONF_OPTS += -DENABLE_XSLT=OFF
+endif
+
 HIAWATHA_CONF_OPTS += \
 	-DENABLE_TOOLKIT=OFF \
-	-DENABLE_XSLT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
 	-DLOG_DIR=/var/log \
 	-DPID_DIR=/var/run \
