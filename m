From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:46 -0500
Subject: [Buildroot] [PATCH 03/67] bustle: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/bustle/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index 2a2a2c1..704165d 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_BUSTLE
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_DBUS # runtime
 	help
 	  Bustle is a better dbus-monitor! It records and draws
@@ -18,5 +19,5 @@ config BR2_PACKAGE_BUSTLE
 
 	  http://www.willthompson.co.uk/bustle/
 
-comment "bustle requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "bustle requires a toolchain with WCHAR support and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
