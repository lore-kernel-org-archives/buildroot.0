From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:52 -0500
Subject: [Buildroot] [PATCH 09/67] docker: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-10-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/docker/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/docker/Config.in b/package/docker/Config.in
index f07739a..866ffcf 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOCKER
 	bool "docker"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
@@ -9,5 +10,6 @@ config BR2_PACKAGE_DOCKER
 
 	  http://icculus.org/openbox/2/docker
 
-comment "docker requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
+comment "docker requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_XORG7 && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
