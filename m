From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:30 -0500
Subject: [Buildroot] [PATCH 47/67] shared-mime-info: libglib2 requires
	threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-48-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/shared-mime-info/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index b08c1fd..ee635ac 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 
 	  http://freedesktop.org/wiki/Software/shared-mime-info
 
-comment "shared-mime-info requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "shared-mime-info requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
