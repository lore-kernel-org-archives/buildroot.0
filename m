From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 17:25:45 -0300
Subject: [Buildroot] [PATCH 4/7] lighttpd: needs mmu
In-Reply-To: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381350348-25751-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lighttpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index cb759ff..b84e6ea 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  lighttpd a secure, fast, compliant and very flexible web-server
 	  which has been optimized for high-performance environments. It
-- 
1.8.1.5
