From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:01:39 +0100
Subject: [Buildroot] [git commit] qemu: sdl frontend needs x11
Message-ID: <20181030201013.0F6AD812B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8153ce21e7d1a11c6ac9a722d81a2e14f5428dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since qemu 2.12.0 and
https://github.com/qemu/qemu/commit/2ec78706d188df7d3dab43d07b19b05ef7800a44,
x_keymap.h has been converted from "SDL display driver" to "X11 keymaps"

So add a select on BR2_PACKAGE_SDL_X11

Fixes:
 - http://autobuild.buildroot.org/results/1908d2d7de8d3aff11ed6fbb8fe4cf3eff54b5a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 61a2a1072e..d7390141f9 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -118,7 +118,9 @@ comment "Frontends"
 
 config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_SDL_X11
 	help
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
