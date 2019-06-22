From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 19:29:03 +0200
Subject: [Buildroot] [git commit] package/libvncserver: add optional systemd
 dependency
Message-ID: <20190622172835.4C064825FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa3687ea898cbe1e31b3d95c09a13fab71447963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
