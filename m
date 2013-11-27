From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 27 Nov 2013 10:18:05 +0000
Subject: [Buildroot] [PATCH] tinymembench: Fix typo error on dependence
Message-ID: <1385547485-36090-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It should be BR2_MIPS_NABI64 instead of BR_MIPS_NABI64

Fixes:

   http://autobuild.buildroot.net/results/c5d/c5da2d99c09b1a2f7da23f1636f1ccc8978cc4a3/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tinymembench/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
index 7e8aaf5..8f6e1a2 100644
--- a/package/tinymembench/Config.in
+++ b/package/tinymembench/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench"
-	depends on !BR2_MIPS_NABI32 && !BR_MIPS_NABI64
+	depends on !BR2_MIPS_NABI32 && !BR2_MIPS_NABI64
 	help
 	  Tinymembench is a simple memory benchmark program, which
 	  tries to measure the peak bandwidth of sequential memory
-- 
1.7.1
