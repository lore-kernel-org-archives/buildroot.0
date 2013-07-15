From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:06 -0500
Subject: [Buildroot] [PATCH 23/67] libgail: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-24-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libgail/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index ba74795..3e1af62 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBGAIL
 	bool "libgail"
+	depends on BR2_USE_WCHAR # pango -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_PANGO
 	help
@@ -16,3 +18,7 @@ config BR2_PACKAGE_LIBGAIL
 	  program.
 
 	  http://developer.gnome.org/projects/gap
+
+comment "libgail requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_LIBGTK2 && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
