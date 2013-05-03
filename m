From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 May 2013 12:47:45 +0200
Subject: [Buildroot] [git commit] libplayer: needs threads support in
	toolchain
Message-ID: <20130503104821.F116E99A4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2c69fdfae21e60c007e303405733173afc588be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libplayer/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 5391b8b..df32901 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPLAYER
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	bool "libplayer"
 	help
 	  libplayer provides a generic A/V API that relies on various multimedia
@@ -31,5 +32,5 @@ config BR2_PACKAGE_LIBPLAYER_PYTHON
 	bool "Libplayer python bindings"
 endif
 
-comment "libplayer requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "libplayer requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
