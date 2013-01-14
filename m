From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jan 2013 00:55:37 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: requires IPv6
Message-ID: <1358207737-6188-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuild failure:
    http://autobuild.buildroot.org/results/40cc7428b25afe3cddae50ec2098ee43127a2f41/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index e6dee3a..67badce 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,9 +1,9 @@
-comment "tvheadend requires a toolchain with LARGEFILE support"
-    depends on !BR2_LARGEFILE
+comment "tvheadend requires a toolchain with LARGEFILE and IPv6 support"
+    depends on !BR2_LARGEFILE || !BR2_INET_IPV6
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
-	depends on BR2_LARGEFILE
+	depends on BR2_LARGEFILE && BR2_INET_IPV6
 	select BR2_PACKAGE_DVB_APPS
 	select BR2_PACKAGE_OPENSSL
 	help
-- 
1.7.2.5
