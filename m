From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:12 -0500
Subject: [Buildroot] [PATCH 29/67] libqmi: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-30-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libqmi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index c5e8a5c..8484250 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -2,8 +2,12 @@ config BR2_PACKAGE_LIBQMI
 	bool "libqmi"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	help
 	  libqmi is a glib-based library for talking to WWAN modems and devices
 	  which speak the Qualcomm MSM Interface (QMI) protocol.
 
 	  http://www.freedesktop.org/wiki/Software/libqmi/
+
+comment "libqmi requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
