From: Michael Rommel <rommel@layer-7.net>
Date: Wed, 18 Sep 2013 13:19:43 +0200
Subject: [Buildroot] [PATCH] knock: needs mmu
Message-ID: <1379503183-15582-1-git-send-email-rommel@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Rommel <rommel@layer-7.net>
---
 package/knock/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/knock/Config.in b/package/knock/Config.in
index a50860b..8778a7e 100644
--- a/package/knock/Config.in
+++ b/package/knock/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KNOCK
 	bool "knock"
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_USE_MMU # fork()
 	help
 	  A port knocking implementation.
 	  Provides a daemon and a user application. Port knocking can be
-- 
1.7.9.5
