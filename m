From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Jun 2019 18:38:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: add optional systemd
 dependency
Message-ID: <20190622163855.19659-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvncserver/libvncserver.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 3805b2faaa..b024c3161d 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -60,6 +60,13 @@ else
 LIBVNCSERVER_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+LIBVNCSERVER_CONF_OPTS += -DWITH_SYSTEMD=ON
+LIBVNCSERVER_DEPENDENCIES += systemd
+else
+LIBVNCSERVER_CONF_OPTS += -DWITH_SYSTEMD=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBVNCSERVER_CONF_OPTS += -DWITH_ZLIB=ON
 LIBVNCSERVER_DEPENDENCIES += zlib
-- 
2.20.1
