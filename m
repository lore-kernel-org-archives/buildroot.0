From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 10:48:21 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: conditionally
	build support for libXi
Message-ID: <20150222103030.A317F80125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48bf1a45f5fd28aac0d92852270a2c913d41b28c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 32b4714..084b9b8 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -49,6 +49,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+FREERDP_CONF_OPTS += -DWITH_XI=ON
+FREERDP_DEPENDENCIES += xlib_libXi
+else
+FREERDP_CONF_OPTS += -DWITH_XI=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 FREERDP_CONF_OPTS += -DWITH_XINERAMA=ON
 FREERDP_DEPENDENCIES += xlib_libXinerama
