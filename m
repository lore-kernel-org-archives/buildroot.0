From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Apr 2020 16:21:59 +0200
Subject: [Buildroot] [PATCH 4/4] package/qemu: disable SDL2 for the host
 variant
In-Reply-To: <20200406142159.592563-1-romain.naour@gmail.com>
References: <20200406142159.592563-1-romain.naour@gmail.com>
Message-ID: <20200406142159.592563-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no host variant for SDL2 library in Buildroot.
So the qemu build system will try to detect automatically the
external SDL2 libraries installed on the host.

$ ldd output/host/bin/qemu-system-aarch64
	[...]
	libSDL2-2.0.so.0 => /lib64/libSDL2-2.0.so.0

Disable explicitely sdl2 options (named sdl) to improve the
build reproducibility.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.1
