From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2014 19:20:49 +0100
Subject: [Buildroot] [git commit] libplayer: add missing indirect dependency
	from gstreamer
Message-ID: <20140220194901.2EF669CAC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5010bdcd1156e800d1f296a8a7d083c0b708269b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplayer/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
