From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 10:48:25 +0100
Subject: [Buildroot] [git commit] package/freerdp: conditionally build
	support for libXrender
Message-ID: <20150302222722.000E78177C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=777a252805b0317f0dd3e796d4a2b4429d936f01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 084b9b8..e873d33 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -70,6 +70,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_XKBFILE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+FREERDP_CONF_OPTS += -DWITH_XRENDER=ON
+FREERDP_DEPENDENCIES += xlib_libXrender
+else
+FREERDP_CONF_OPTS += -DWITH_XRENDER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 FREERDP_CONF_OPTS += -DWITH_XV=ON
 FREERDP_DEPENDENCIES += xlib_libXv
