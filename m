From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  5 Apr 2013 07:47:32 -0300
Subject: [Buildroot] [PATCH 2/2] libev: also fails for blackfin
In-Reply-To: <1365158852-3979-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365158852-3979-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365158852-3979-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fails for blackfin because of a lack of memory fences so disable
it. Fixes:
http://autobuild.buildroot.net/results/d895f0b0a5f4b6c173c2843a76277e6fe611627b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libev/Config.in b/package/libev/Config.in
index fd74f55..3d10cd7 100644
--- a/package/libev/Config.in
+++ b/package/libev/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBEV
 	bool "libev"
 	# needs memory fences
-	depends on !BR2_avr32
+	depends on !(BR2_avr32 || BR2_bfin)
 	help
 	  Userspace library for handling asynchronous notifications
 
-- 
1.8.1.5
