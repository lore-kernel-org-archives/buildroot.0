From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:57 -0500
Subject: [Buildroot] [PATCH 14/67] gamin: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-15-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gamin/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index 3ede2e4..369c10e 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  the File Alteration Monitor
 
 	  http://www.gnome.org/~veillard/gamin/sources
 
-comment "gamin requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gamin requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
