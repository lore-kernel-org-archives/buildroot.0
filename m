From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:30:36 -0300
Subject: [Buildroot] [PATCH] m2tools: fix MIA comment dependencies
Message-ID: <1407159036-27387-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/e2tools/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index 13e2118..2baf580 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -14,4 +14,6 @@ config BR2_PACKAGE_E2TOOLS
 	  https://github.com/ndim/e2tools
 
 comment "e2tools needs a toolchain w/ threads, largefile and wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
+		!BR2_USE_WCHAR
+	depends on BR2_USE_MMU
-- 
1.8.5.5
