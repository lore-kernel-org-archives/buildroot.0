From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 31 May 2016 12:11:15 +0100
Subject: [Buildroot] [PATCH v2 next 4/7] binutils: select the appropriate
	BR2_TOOLCHAIN_BINUTILS_AT_LEAST_X_Y
In-Reply-To: <1464693078-15767-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464693078-15767-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1464693078-15767-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Split the patch in two (Yann):
   - change the way we handle the ARC stuff (patch 3/7, previous one)
   - add the binutils-at-least options (patch 4/7 , this one)

 package/binutils/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c7cf094..09d1602 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -16,20 +16,24 @@ choice
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# Unsupported ARM cores
 		depends on !BR2_cortex_a17
+		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 
 	config BR2_BINUTILS_VERSION_2_25_X
 		bool "binutils 2.25.1"
 		# ARC support is not upstream yet
 		depends on !BR2_arc
+		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 
 	config BR2_BINUTILS_VERSION_2_26_X
 		bool "binutils 2.26"
 		# ARC support is not upstream yet
 		depends on !BR2_arc
+		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_26
 
 	config BR2_BINUTILS_VERSION_ARC
 		bool "arc-2016.03"
 		depends on BR2_arc
+		select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_26
 
 endchoice
 
-- 
2.7.3
