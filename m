From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Feb 2014 10:43:13 -0300
Subject: [Buildroot] [PATCH] mtr: not available for avr32
Message-ID: <1391521393-19781-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uclibc version condition is accurate but doesn't cover external
toolchains, so also exclude for avr32 too which only has 0.9.31 enabled.
Fixes:
http://autobuild.buildroot.net/results/4ee/4eec6e29d0f2a46bbbe3a748e85bd06c3601b7c1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtr/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtr/Config.in b/package/mtr/Config.in
index 842d6ca..7e5ad90 100644
--- a/package/mtr/Config.in
+++ b/package/mtr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MTR
 	bool "mtr"
 	# res_mkquery() only available in 0.9.33+
 	depends on !BR2_UCLIBC_VERSION_0_9_31 && !BR2_UCLIBC_VERSION_0_9_32
+	depends on !BR2_avr32
 	help
 	  mtr combines the functionality of the 'traceroute' and 'ping'
 	  programs in a single network diagnostic tool.
-- 
1.8.3.2
