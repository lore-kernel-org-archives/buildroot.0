From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 25 Nov 2013 09:47:46 +0000
Subject: [Buildroot] [PATCH] tinymembench: not supported on MIPS n32/64 ABIs
Message-ID: <1385372866-50017-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a fix for 9883cbd3678be65bdca10a124ba6cb7fd1f008d3. After deeper
testing we have found that package is supported on MIPS64, but only for
o32 ABI.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tinymembench/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
index 0555b19..7e8aaf5 100644
--- a/package/tinymembench/Config.in
+++ b/package/tinymembench/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench"
-	depends on !BR2_mips64 && !BR2_mips64el
+	depends on !BR2_MIPS_NABI32 && !BR_MIPS_NABI64
 	help
 	  Tinymembench is a simple memory benchmark program, which
 	  tries to measure the peak bandwidth of sequential memory
-- 
1.7.1
