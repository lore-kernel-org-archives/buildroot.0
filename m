From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 00:09:13 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] qemu: sdl frontend needs
 x11
Message-ID: <20181113230808.AFF4C82DFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1d92ff1fd1ae552cc72d50889b1789d1f1635bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Since qemu 2.12.0 and
https://github.com/qemu/qemu/commit/2ec78706d188df7d3dab43d07b19b05ef7800a44,
x_keymap.h has been converted from "SDL display driver" to "X11 keymaps"

So add a select on BR2_PACKAGE_SDL_X11

Fixes:
 - http://autobuild.buildroot.org/results/1908d2d7de8d3aff11ed6fbb8fe4cf3eff54b5a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8153ce21e7d1a11c6ac9a722d81a2e14f5428dbd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 13b615bfba..cf25c35194 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -97,7 +97,9 @@ comment "Frontends"
 
 config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_SDL_X11
 	help
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
