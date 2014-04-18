From: Davide Viti <zinosat@tiscali.it>
Date: Sat, 19 Apr 2014 00:30:14 +0200
Subject: [Buildroot] [PATCH 1/1] apr: add missing comment about needed
	dynamic library support
Message-ID: <1397860214-30560-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Davide Viti <d.viti@infosolution.it>

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
 package/apr/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/apr/Config.in b/package/apr/Config.in
index e06d254..73a4482 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -9,3 +9,7 @@ config BR2_PACKAGE_APR
 	  consistent interface to underlying platform-specific implementations
 
 	  http://apr.apache.org/
+
+comment "apr needs a toolchain w/ dynamic library"
+	depends on !BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.9.1
