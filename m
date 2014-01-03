From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  4 Jan 2014 00:32:21 +0100
Subject: [Buildroot] [PATCH] wmctrl: fix comment (typo and visibility)
Message-ID: <1388791941-21659-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/wmctrl/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
index 334f47d..e0342b7 100644
--- a/package/wmctrl/Config.in
+++ b/package/wmctrl/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_WMCTRL
 
 	  http://tomas.styblo.name/wmctrl/
 
-comment "libglib2 needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_MMU
+comment "wmctrl needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.5.2
