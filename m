From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 13 Feb 2018 08:21:28 +0100
Subject: [Buildroot] [PATCH v2 2/2] rustc: fix check-package warnings
In-Reply-To: <20180213072128.4669-1-eric.le.bihan.dev@free.fr>
References: <20180213072128.4669-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180213072128.4669-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

utils/check-package complains as follows:

  package/rustc/Config.in.host:6: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
  package/rustc/Config.in.host:79: empty line at end of file

This patch fixes these warnings.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rustc/Config.in.host | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index d93ff05209..bdbe488f48 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	# The pre-built Rust standard library is only available for the
 	# following architectures/ABIs, and is built against glibc.
 	default y if BR2_i386
@@ -12,6 +11,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
 		&& BR2_MIPS_NABI64
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
@@ -76,4 +76,3 @@ config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
 
 endif
-
-- 
2.14.3
