From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 23:20:32 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Makefile: release: really
 drop build/docs from release tarball
Message-ID: <20190329224926.20B7189111@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d2bdda23f4128ab31172249cd31e963c53c55ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit 15cb98769e4 (release: remove manual build files from release
tarballs) tried to remove the temporary files from the manual build from the
release tarball, but manual-clean only removes build/docs/manual and leaves
build/docs in the tarball.

Instead use 'make clean' to completely remove the build directory from the
tarball.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c24faa81e859a773c72a84dca1eadffd1ddeffcf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2b91d40919..5098acee0e 100644
--- a/Makefile
+++ b/Makefile
@@ -1170,7 +1170,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
-	$(MAKE) O=$(OUT) manual-clean
+	$(MAKE) O=$(OUT) clean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
 	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
