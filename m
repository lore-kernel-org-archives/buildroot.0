From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 13:42:07 +0200
Subject: [Buildroot] [git commit branch/2013.08.x] Makefile: release: create
	tarball from current branch, not master
Message-ID: <20130917114502.341E69B7B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ab57bf9338f3a47683294aed6425f39828cbf80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2013.08.x

To support stable bugfix releases.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 70749ef..45444c8 100644
--- a/Makefile
+++ b/Makefile
@@ -841,7 +841,7 @@ release: OUT=buildroot-$(BR2_VERSION)
 # Create release tarballs. We need to fiddle a bit to add the generated
 # documentation to the git output
 release:
-	git archive --format=tar --prefix=$(OUT)/ master > $(OUT).tar
+	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-txt manual-pdf
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
