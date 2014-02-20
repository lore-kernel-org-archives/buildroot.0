From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 Feb 2014 14:34:11 +0100
Subject: [Buildroot] [PATCH 2/3] libplayer: add missing indirect dependency
	from gstreamer
In-Reply-To: <1392903252-10253-1-git-send-email-arnout@mind.be>
References: <1392903252-10253-1-git-send-email-arnout@mind.be>
Message-ID: <1392903252-10253-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libplayer/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index c8271a1..be7e0f0 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -27,9 +27,11 @@ config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 	bool "gstreamer backend"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_GSTREAMER
 
 comment "gstreamer backend needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBPLAYER_PYTHON
-- 
1.9.rc1
