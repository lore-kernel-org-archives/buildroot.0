From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 May 2016 09:44:47 -0300
Subject: [Buildroot] [PATCH] x264: needs mmu
Message-ID: <1462193087-19193-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses madvise() which is not available in NOMMU. Fixes:
http://autobuild.buildroot.net/results/837/837fd5a63d59b5c65818ec005a565cb7741a1cdd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x264/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x264/Config.in b/package/x264/Config.in
index be3ab3f..d042ddc 100644
--- a/package/x264/Config.in
+++ b/package/x264/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_X264
 	bool "x264"
+	depends on BR2_USE_MMU # madvise()
 	help
 	  x264 is a free software library and application for
 	  encoding video streams into the H.264/MPEG-4 AVC
-- 
2.7.3
