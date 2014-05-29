From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 May 2014 05:53:30 +0300
Subject: [Buildroot] [PATCH] sysklogd: needs MMU
Message-ID: <94f65fcdbcd16c241cdb9e7534375b2ac2337ee7.1401332010.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/bf1/bf1a6e1d4798c5abea4ff5114279329d6d90548f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sysklogd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 1216bccf8c89..6339d762e5a2 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSKLOGD
 	bool "syslogd & klogd"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  System log daemons syslogd and klogd.
 
@@ -8,3 +9,4 @@ config BR2_PACKAGE_SYSKLOGD
 
 comment "syslogd needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+	depends on BR2_USE_MMU
-- 
2.0.0.rc2
