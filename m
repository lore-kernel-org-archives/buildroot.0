From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Jun 2013 10:04:59 -0300
Subject: [Buildroot] [PATCH] aespipe: needs mmu
Message-ID: <1370264699-16193-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9f3/9f3f85a024791cdc6b10e3e40cf41707eb074447/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/aespipe/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aespipe/Config.in b/package/aespipe/Config.in
index ccc94c2..df99523 100644
--- a/package/aespipe/Config.in
+++ b/package/aespipe/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AESPIPE
 	bool "aespipe"
+	depends on BR2_USE_MMU # fork()
 	help
 	  aespipe program is AES encrypting or decrypting pipe. It reads from
 	  standard input and writes to standard output. It can be used to
-- 
1.8.1.5
