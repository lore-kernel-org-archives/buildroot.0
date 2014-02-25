From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Feb 2014 11:56:46 -0300
Subject: [Buildroot] [PATCH] strongswan: needs threads
Message-ID: <1393340206-8878-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e23/e2394705545dad8e33ffc558df518014c15f5271/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 63316cb..d53da64 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -1,6 +1,10 @@
+comment "strongswan needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 menuconfig BR2_PACKAGE_STRONGSWAN
 	bool "strongswan"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  strongSwan is an OpenSource IPsec implementation for the
 	  Linux operating system. It is based on the discontinued
-- 
1.8.3.2
