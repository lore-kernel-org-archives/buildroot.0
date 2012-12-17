From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 17 Dec 2012 14:12:01 +0100
Subject: [Buildroot] [PATCH] inadyn: Needs MMU
Message-ID: <1355749921-27134-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/11d681a7f2c1d55a3d70573e9145aa231f6d4298/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/inadyn/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 623da41..a2dfa74 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_INADYN
 	bool "inadyn"
+	depends on BR2_USE_MMU # Uses fork()
 	help
 	  INADYN is a free DynDNS client. It gives the possibility
 	  to have your own fixed hostname registered on the internet,
-- 
1.7.9.5
