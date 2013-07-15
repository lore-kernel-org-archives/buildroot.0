From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:44 -0500
Subject: [Buildroot] [PATCH 01/67] atk: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/atk/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/atk/Config.in b/package/atk/Config.in
index 928fae7..7dec8b8 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_ATK
 	bool "atk"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
-comment "atk requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "atk requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
