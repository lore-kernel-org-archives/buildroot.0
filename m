From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Feb 2014 09:57:18 +0100
Subject: [Buildroot] [PATCH] gpm: disable on !MMU, requires fork()
Message-ID: <1392973038-21880-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/b2b/b2beb4876fba22f139df9c336ff0fae77354721b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpm/Config.in b/package/gpm/Config.in
index 2121e71..0a60f6a 100644
--- a/package/gpm/Config.in
+++ b/package/gpm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GPM
 	bool "gpm"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU # fork()
 	help
 	  "gpm" means general purpose mouse (server) and provides mouse support
 	  for Linux virtual consoles.
-- 
1.8.3.2
