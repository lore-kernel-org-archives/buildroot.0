From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Oct 2019 22:56:04 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix
 mesa3d glx support
Message-ID: <20191013205559.F00928DB0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2856aa2857d616788684a053f1c886da00d977f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5cb821d5635 added a new option to enable GLX support in mesa3d.
Before that, GLX was implicitly enabled whenever a DRI driver was built.
Adjust xserver_xorg-server to use the new GLX option instead of just
DRI.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a33cb25076..c15047cbe4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -120,7 +120,7 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
 else
