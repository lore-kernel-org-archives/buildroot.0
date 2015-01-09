From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Jan 2015 07:40:55 -0300
Subject: [Buildroot] [PATCH] xz-utils: needs threads
Message-ID: <1420800055-6710-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's one of the major features of the 5.2.0 release. Fixes:
http://autobuild.buildroot.net/results/e86/e86e97ff7887f1bdc6bf913498392ff50f56ea88/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xz/Config.in b/package/xz/Config.in
index 50116f2..55beb42 100644
--- a/package/xz/Config.in
+++ b/package/xz/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XZ
 	bool "xz-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  XZ is the successor to the Lempel-Ziv/Markov-chain Algorithm
 	  compression format, which provides memory-hungry but powerful
@@ -12,3 +13,6 @@ config BR2_PACKAGE_XZ
 	  package.
 
 	  http://tukaani.org/xz/
+
+comment "xz-utils needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.0.5
