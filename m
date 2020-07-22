From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:15:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libvncserver:
 disable gtk example
Message-ID: <20200722085617.02F65880B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=919a47e9377fb5e63aabfc72ff65da68749f374f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

gtkvncviewer has been added since version 0.9.13 and
https://github.com/LibVNC/libvncserver/commit/2650cfc17bb7718e42bfff8510c15f011eda1b1f,
disable it as it is only an example

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c89f62cec69a29b9f7441893b39d24e141fbe988)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 96dd51299c..23ab40b7eb 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -16,6 +16,7 @@ LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
+	-DWITH_GTK=OFF \
 	-DWITH_SDL=OFF
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
