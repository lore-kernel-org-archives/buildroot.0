From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jan 2014 19:12:21 -0300
Subject: [Buildroot] [PATCH] libfcgi: needs mmu
Message-ID: <1389823941-5563-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/93a/93a7f816b5c70a247491063ca733b537ee7aec65/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfcgi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
index a622ec3..47ff8a2 100644
--- a/package/libfcgi/Config.in
+++ b/package/libfcgi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFCGI
 	bool "libfcgi"
+	depends on BR2_USE_MMU # fork()
 	help
 	  FCGI, a fastcgi developer library for C/C++
 
-- 
1.8.3.2
