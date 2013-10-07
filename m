From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  6 Oct 2013 21:09:26 -0300
Subject: [Buildroot] [PATCH] openssh: needs mmu
Message-ID: <1381104566-29479-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 0c3d993..78cc615 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
-- 
1.8.1.5
