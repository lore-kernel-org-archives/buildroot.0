From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:28 -0500
Subject: [Buildroot] [PATCH 45/67] polkit: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-46-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/polkit/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index b47022a..df6c767 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_POLKIT
 	bool "polkit"
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_POLKIT
 
 	  http://www.freedesktop.org/wiki/Software/polkit
 
-comment "polkit requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "polkit requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
