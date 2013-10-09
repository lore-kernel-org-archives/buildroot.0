From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 17:25:46 -0300
Subject: [Buildroot] [PATCH 5/7] mongoose: needs mmu
In-Reply-To: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381350348-25751-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mongoose/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index 7199712..1668476 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MONGOOSE
 	bool "mongoose"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Mongoose is a small and easy to use web server
 
-- 
1.8.1.5
