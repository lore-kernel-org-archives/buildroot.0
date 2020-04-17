From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 17 Apr 2020 22:16:26 +0200
Subject: [Buildroot] [PATCH] package/qemu: enable or1k support in host-qemu
In-Reply-To: <20200417201626.342738-1-romain.naour@gmail.com>
References: <20200417201626.342738-1-romain.naour@gmail.com>
Message-ID: <20200417201626.342738-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change enables host qemu support for or1k which among other
things allows to test this architecture in gitlab.

The or1k support was nammed or32 in qemu < 2.9.0 and
renamed or1k by [1]. But only the qemu 4.2.0 has been
tested with qemu_or1k_defconfig.
So we may consider the or1k support was added by [1].

Tested using qemu_or1k_defconfig.

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=4a09d0bb34ab030e09e87173b2e3ec0fd7616cff

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index ea9281c5fb..5ed160159a 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -11,6 +11,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_mips
 	default y if BR2_mipsel
 	default y if BR2_nios2
+	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 712491a208..e8b43d3b36 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -199,6 +199,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman host-p
 #       mips64          mips64
 #       mips64el        mips64el
 #       nios2           nios2
+#       or1k            or1k
 #       powerpc         ppc
 #       powerpc64       ppc64
 #       powerpc64le     ppc64 (system) / ppc64le (usermode)
-- 
2.25.2
