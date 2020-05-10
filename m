From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:21:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/qemu: disable
 SDL2 for the host variant
Message-ID: <20200510191329.2A44D91344@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ca889a2c117a77d542e7f76060accfcd02f40b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

There is no host variant for SDL2 library in Buildroot.
So the qemu build system will try to detect automatically the
external SDL2 libraries installed on the host.

$ ldd output/host/bin/qemu-system-aarch64
	[...]
	libSDL2-2.0.so.0 => /lib64/libSDL2-2.0.so.0

Disable explicitely sdl2 options (named sdl) to improve the
build reproducibility.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 44e5da60b712a8472da8d1fd976f6505cf8d24f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 06841a56d0..712491a208 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -305,6 +305,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--python=$(HOST_DIR)/bin/python3 \
 		--disable-bzip2 \
 		--disable-libssh \
+		--disable-sdl \
 		--disable-vnc-jpeg \
 		--disable-vnc-png \
 		--disable-vnc-sasl \
