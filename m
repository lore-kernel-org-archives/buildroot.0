From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:02 -0500
Subject: [Buildroot] [PATCH 19/67] gob2: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-20-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gob2/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 4a09c41..d795335 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GOB2
 	bool "gob2"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	# m4 uses fork(), so does bison then
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
@@ -13,4 +14,4 @@ config BR2_PACKAGE_GOB2
 	  http://www.jirka.org/gob.html
 
 comment "gob2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
