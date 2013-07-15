From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:34 -0500
Subject: [Buildroot] [PATCH 51/67] udev: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-52-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/udev/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index d3244d1..ed32c89 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -25,10 +25,15 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_ACL
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	help
 	  Enable all extras with external dependencies like
 	  libacl, hwdata and libglib2
 
+comment "enabling all extras requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_USE_THREADS
+
 endif
 
 comment "udev requires /dev mgmnt set to udev under System configuration"
-- 
1.8.1.2
