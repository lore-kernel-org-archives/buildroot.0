From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 01 Oct 2013 10:53:13 +0800
Subject: [Buildroot] [PATCH v2 1/2] logrotate: needs mmu
Message-ID: <1380595993.4979.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2: Fix trivial typo in the subject line

Fix below build error:

logrotate.o: In function `switch_user_permanently':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:129: undefined reference to `fork'
logrotate.o: In function `removeLogFile':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:431: undefined reference to `fork'
logrotate.o: In function `mailLog':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:597: undefined reference to `fork'
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:615: undefined reference to `fork'
logrotate.o: In function `compressLogFile':
/opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:533: undefined reference to `fork'
collect2: ld returned 1 exit status
make[1]: *** [logrotate] Error 1

 package/logrotate/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 0d0ec61..bc7b295 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LOGROTATE
 	bool "logrotate"
 	select BR2_PACKAGE_POPT
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  A simple program to rotate logs.
 
-- 
1.8.1.2
