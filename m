From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:06:43 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libvncserver: add
 optional systemd dependency
Message-ID: <20200315095840.3942084079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc1261fa4c50e99a951d6b8ad66d925dc1b49575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aa3687ea898cbe1e31b3d95c09a13fab71447963)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
