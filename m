From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  6 Dec 2016 17:36:18 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: disallow 4.9.x for ARM cortex-a72
In-Reply-To: <20161206163618.1758-1-peter@korsgaard.com>
References: <20161206163618.1758-1-peter@korsgaard.com>
Message-ID: <20161206163618.1758-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

a72 support was only added in the 5.1 cycle.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 62da5b5..0f6ced5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -41,7 +41,7 @@ choice
 		# Broken or unsupported architectures
 		depends on !BR2_arc && !BR2_bfin
 		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a17
+		depends on !BR2_cortex_a17 && !BR2_cortex_a72
 		# Unsupported MIPS cores
 		depends on !BR2_mips_interaptiv
 		# Unsupported for MIPS R5
-- 
2.10.2
