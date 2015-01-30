From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Jan 2015 14:33:53 +0000
Subject: [Buildroot] [PATCH 2/2] strace: Enable for MIPS platforms with
	uClibc
In-Reply-To: <1422628433-39741-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1422628433-39741-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1422628433-39741-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable strace for MIPS platforms with uClibc again since this C library
is now fixed.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
1.7.1
