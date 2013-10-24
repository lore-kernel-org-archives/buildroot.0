From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Oct 2013 14:14:36 -0300
Subject: [Buildroot] [PATCH] libedit: needs mmu
Message-ID: <1382634876-7742-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/211/2116ffb8e74073fd415bfdea748731b5b8a876d7/
(Not just the examples, also vi.c)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libedit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 5158744..683eb6b 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  The editline library (from BSD) provides generic line editing
-- 
1.8.1.5
