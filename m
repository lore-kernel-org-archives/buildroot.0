From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Mar 2011 22:46:52 +0100
Subject: [Buildroot] [git commit master 1/1] fetch/git: clone the repository
	as bare
Message-ID: <20110316214804.C6DDE909B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f7abec2d1d1e52f49f7d95c48165cde8cf41edb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will reduce the space used and speed up the clone as it is only
used to generate an archive, which doesn't need the git working tree.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 84687d5..bf4e1b4 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -105,7 +105,7 @@ endif
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
-- 
1.7.3.4
