From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:42 -0000
Subject: [Buildroot] [git commit branch/next] bsdiff: libraries should go
	after source files using them in linker invocation
Message-ID: <20120802195247.CDCF38E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68b2218cb5b3758e60b8cff399ca17c5153663cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/2a6e213997c06136e18b25a1b0e91d8782acbfc4/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bsdiff/bsdiff.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 66a7722..e8d9ec0 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -9,10 +9,10 @@ BSDIFF_SITE = http://www.daemonology.net/bsdiff
 BSDIFF_DEPENDENCIES = bzip2
 
 define BSDIFF_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -lbz2 \
-		$(@D)/bsdiff.c -o $(@D)/bsdiff
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -lbz2 \
-		$(@D)/bspatch.c -o $(@D)/bspatch
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		$(@D)/bsdiff.c -lbz2 -o $(@D)/bsdiff
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		$(@D)/bspatch.c -lbz2 -o $(@D)/bspatch
 endef
 
 define BSDIFF_INSTALL_TARGET_CMDS
