From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Aug 2013 10:32:15 -0300
Subject: [Buildroot] [PATCH] netatalk: requires threads
Message-ID: <1376487135-15772-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e19/e191a9e0768b632b84c3a8a8201538bd5fbe3708/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netatalk/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 26f14c3..e3deaef 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBGCRYPT
@@ -9,3 +10,6 @@ config BR2_PACKAGE_NETATALK
 	  high-performance and reliable file server for Macintosh computers.
 
 	  http://netatalk.sourceforge.net/
+
+comment "netatalk requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5
