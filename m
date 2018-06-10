From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 15:58:29 +0200
Subject: [Buildroot] [git commit] rustc: drop BR2_PACKAGE_HAS_HOST_RUSTC
Message-ID: <20180610135723.4A30A8447E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9962368a90516fa90625be58319b486f960afa1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit drops the option BR2_PACKAGE_HAS_HOST_RUSTC, which is no
longer used following commit bd425f716f0a92ef627f7287869d88ca408fe55e
("host-cargo: select host-rustc").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/Config.in.host | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 84a8e0f90b..2ae8f89d3f 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -46,7 +46,6 @@ config BR2_PACKAGE_HOST_RUST
 	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
 	# triggers ICE on trunc_int_for_mode, at explow.c:56
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
-	select BR2_PACKAGE_HAS_HOST_RUSTC
 	help
 	  This package will build the compiler for the host as well as
 	  two flavors of the standard library: one for the host, another
@@ -61,16 +60,12 @@ comment "host-rust needs host gcc >= 4.7"
 
 config BR2_PACKAGE_HOST_RUST_BIN
 	bool "host rust (pre-built)"
-	select BR2_PACKAGE_HAS_HOST_RUSTC
 	help
 	  This package will install pre-built versions of the compiler
 	  for the host and the Rust standard library for the target.
 
 endchoice
 
-config BR2_PACKAGE_HAS_HOST_RUSTC
-	bool
-
 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	string
 	default "host-rust" if BR2_PACKAGE_HOST_RUST
