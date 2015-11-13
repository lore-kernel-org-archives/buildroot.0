From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 11:54:34 -0300
Subject: [Buildroot] [PATCH] fastd: needs mmu
Message-ID: <1447426474-3282-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/87b/87bf97966cb802fc307ec9710725a3947ec33c39/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fastd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 15451f0..07118f3 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FASTD
 	bool "fastd"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBUECC
 	select BR2_PACKAGE_LIBSODIUM
@@ -21,4 +22,5 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 endif
 
 comment "fastd needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.4.10
