From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 21 Jun 2014 11:59:33 -0300
Subject: [Buildroot] [PATCH] torsmo: needs mmu
Message-ID: <1403362773-32343-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/28f/28ffabf47643dfdb646ec98a56978db75fc84c05/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/torsmo/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index 7d309da..a3943bd 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TORSMO
 	bool "torsmo"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
-- 
1.8.5.5
