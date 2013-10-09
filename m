From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 17:25:43 -0300
Subject: [Buildroot] [PATCH 2/7] civetweb: needs mmu
In-Reply-To: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381350348-25751-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/civetweb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index f7a31f5..55c138a 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CIVETWEB
 	bool "civetweb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Full featured embedded web server with Lua support.
 
-- 
1.8.1.5
