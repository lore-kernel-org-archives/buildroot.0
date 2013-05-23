From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 22 May 2013 17:24:04 -0700
Subject: [Buildroot] [PATCH 2/5] tvheadend: needs threads
In-Reply-To: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1369268647-13128-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/tvheadend/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 19ab276..7083b01 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,9 +1,10 @@
-comment "tvheadend requires a toolchain with LARGEFILE and IPv6 support"
-    depends on !BR2_LARGEFILE || !BR2_INET_IPV6
+comment "tvheadend needs a toolchain with LARGEFILE, IPv6 and THREADS support"
+    depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on BR2_LARGEFILE && BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# tvheadend requires an atomic_add operation. Either you have
 	# a gcc >= 4.3 toolchain and it uses the gcc intrinsics, or it
 	# has special code for x86, x86-64, PPC and ARM. So in the
-- 
1.7.4.1
