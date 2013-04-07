From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Apr 2013 08:50:51 -0300
Subject: [Buildroot] [PATCH 1/2] tinyhttpd: needs mmu
Message-ID: <1365335452-29872-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2a3b5ab3ef58443c1bf86df5498df2f145cd840c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tinyhttpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyhttpd/Config.in b/package/tinyhttpd/Config.in
index 5a6ee88..f7365af 100644
--- a/package/tinyhttpd/Config.in
+++ b/package/tinyhttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TINYHTTPD
 	bool "tinyhttpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A relatively simple webserver written as a school project. It is
 	  exceedingly simple, threaded and handles basic CGI scripts.
-- 
1.8.1.5
