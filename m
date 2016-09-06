From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 22:26:49 +0200
Subject: [Buildroot] [git commit] package/freerdp: fix typo in x11 libs check
Message-ID: <20160906202652.9D1318225C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae56ad666f2af2382d532d1db4ad7e1961cfe2a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e8e5be4..c3a3e55 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -111,7 +111,7 @@ endif
 # Xorg is enabled but neither the server nor the X client are, then
 # there's nothing that guarantees those two libs are enabled. So we
 # really must check for them.
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBX11),yy)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXEXT),yy)
 FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXext
 FREERDP_CONF_OPTS += -DWITH_X11=ON
 else
