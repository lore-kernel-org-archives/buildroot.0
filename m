From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:32 -0500
Subject: [Buildroot] [PATCH 49/67] sshfs: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-50-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/sshfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index b6d5aa6..3e7ed15 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
-- 
1.8.1.2
