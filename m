From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 07 Jun 2021 15:17:57 -0000
Subject: [Buildroot] [git commit] package/gobject-introspection/Config.in:
 Allow RISCV_32 builds
Message-ID: <20210607144654.89C3981191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=330bbd68923269f0adacec3cfa39ae30a78ca705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu 6.0.0 no longer segfaults when running qemu-riscv32. As such, it's now
possible to allow riscv32 to compile gobject-introspection.

This partially reverts commit c94a212390e33c122cf9db4c772caf8bf3804565.
The symbol BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS is kept, even
though it is now equivalent to BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS,
because it's likely that architecture dependencies will pop up again in
the future.

The configuration of a previously failing autobuilder [1] now passes.

[1] http://autobuild.buildroot.org/results/668397b1df42297505e6fc8353c4752290a5628d

Signed-off-by: Adam Duskett <aduskett@rivian.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gobject-introspection/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 57c569704e..bacf44363c 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
-	depends on !BR2_RISCV_32 # qemu-riscv32 segfaults in qemu-5.0.0
 
 config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	bool "gobject-introspection"
