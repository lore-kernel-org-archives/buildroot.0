From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 10:49:33 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qemu: remove support for
 some PowerPC processors in host qemu
Message-ID: <20181021092409.0B9EE863D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d6f105c40d30563f0226171e967d1887a575325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The 620, 630, and 970 are not supported at this time by qemu.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit efc67deef38c9c69279c35b8e2665d81e8344e96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 78fe54a85c..bbc2aa27c5 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -6,6 +6,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
+		depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
