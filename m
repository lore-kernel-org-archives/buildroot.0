From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:20:35 +0100
Subject: [Buildroot] [git commit] strace: Enable for MIPS platforms with
	uClibc
Message-ID: <20150201222055.0C27880455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b5ff1ab8ae6c9de6e8f6c0355d80255ae344efe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable strace for MIPS platforms with uClibc again since this C library
is now fixed.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strace/Config.in |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 07667ed..ad8d308 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
 	depends on !BR2_nios2
-	depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) \
-		&& BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_LARGEFILE
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -13,7 +11,3 @@ config BR2_PACKAGE_STRACE
 
 comment "strace needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
-
-comment "strace is not supported on MIPS using a uClibc toolchain"
-	depends on (BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && \
-		BR2_TOOLCHAIN_USES_UCLIBC
