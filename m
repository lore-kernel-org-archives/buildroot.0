From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:39 -0500
Subject: [Buildroot] [PATCH 56/67] wireshark: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-57-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/wireshark/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index d4c8b43..bc15bd2 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -5,11 +5,12 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	help
 	  Network traffic sniffer and protocol decoder. Currently only tshark,
 	  the console interface, is enabled.
 
 	  http://www.wireshark.org
 
-comment "wireshark requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "wireshark requires a MMU and a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_MMU || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
