From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Tue, 23 Oct 2018 23:44:09 +0200
Subject: [Buildroot] [RFC PATCH 1/1] libffi: v3.2.1 doesn't support riscv
 targets yet
Message-ID: <20181023214409.6818-1-ferdinand@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/?reason=libffi-3.2.1&arch=riscv64
---

The upcoming version 3.3.0 will support riscv [1], so this patch would
be temporary. Do we wait for that release, or should we explicitly
disable libffi for riscv in the meantime?

[1] https://github.com/libffi/libffi/commit/3840d49aaa831d649b1597518a2903dfed0d57f3

---
 package/libffi/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 6edf570baf..26255bb4a4 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_riscv
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
@@ -11,3 +12,5 @@ config BR2_PACKAGE_LIBFFI
 
 comment "libffi needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libffi is not supported on RISCV."
+	depends on BR2_riscv
-- 
2.19.0
