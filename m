From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Sep 2012 09:18:13 +0200
Subject: [Buildroot] [git commit] genext2fs: needs largefile after version
	bump
Message-ID: <20120926072004.60CBA97193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c39cf6108ba5a8e8f4f3e6c6fb09b043db7cfd79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/8c7c10c0175a7ddf8e2d37a4718469d4ead3835a

And fixup space/tab mixup in Config.in while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/genext2fs/Config.in |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/genext2fs/Config.in b/package/genext2fs/Config.in
index 82992f8..d869d7e 100644
--- a/package/genext2fs/Config.in
+++ b/package/genext2fs/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_GENEXT2FS
-       bool "genext2fs"
-       help
-         genext2fs generates an ext2 filesystem as a normal (non-root)
-	 user.  It does not require you to mount the image file to
-	 copy files on it, nor does it require that you become the
-	 superuser to make device nodes.
+	bool "genext2fs"
+	depends on BR2_LARGEFILE
+	help
+	  genext2fs generates an ext2 filesystem as a normal (non-root)
+	  user.  It does not require you to mount the image file to
+	  copy files on it, nor does it require that you become the
+	  superuser to make device nodes.
 
-	 http://genext2fs.sourceforge.net/
+	  http://genext2fs.sourceforge.net/
+
+comment "genext2fs requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
