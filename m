From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 14:00:04 +0200
Subject: [Buildroot] [git commit] Makefile: release: create tarball from
	current branch, not master
Message-ID: <20130917120200.4A73D9B7BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6715b69e467182ee5242d7484caace2088340c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To support stable bugfix releases.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 2163e95..6ef0edc 100644
--- a/Makefile
+++ b/Makefile
@@ -838,7 +838,7 @@ release: OUT=buildroot-$(BR2_VERSION)
 # Create release tarballs. We need to fiddle a bit to add the generated
 # documentation to the git output
 release:
-	git archive --format=tar --prefix=$(OUT)/ master > $(OUT).tar
+	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-txt manual-pdf
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
