From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Apr 2014 11:31:32 +0300
Subject: [Buildroot] [PATCH] picocom: needs MMU
Message-ID: <43a48e8cd77b44d2e36f1b9f5909ddcb81062490.1398673892.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/570/57053f429f59cc7c064bb37a1d6d5a635324cd41/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/picocom/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/picocom/Config.in b/package/picocom/Config.in
index bd584e20e08a..5a7d5833a490 100644
--- a/package/picocom/Config.in
+++ b/package/picocom/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PICOCOM
 	bool "picocom"
+	depends on BR2_USE_MMU # fork()
 	help
 	  picocom is a minimal dumb-terminal emulation program. It
 	  is, in principle, very much like minicom, only it's pico
-- 
1.9.2
