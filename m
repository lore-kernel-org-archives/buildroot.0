From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Apr 2014 08:37:20 -0300
Subject: [Buildroot] [PATCH] smstools3: needs mmu
Message-ID: <1396525040-28924-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9fe/9fe7a34501a39d4a1eaaedb75ab58e7cbdbe15c5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/smstools3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/smstools3/Config.in b/package/smstools3/Config.in
index 72d0af6..1086869 100644
--- a/package/smstools3/Config.in
+++ b/package/smstools3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SMSTOOLS3
 	bool "smstools3"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-- 
1.8.3.2
