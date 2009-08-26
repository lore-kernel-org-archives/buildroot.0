From: Will Newton <will.newton@gmail.com>
Date: Wed, 26 Aug 2009 23:21:30 +0200
Subject: [Buildroot] [git commit master] Makefile: Ensure CVS directories
	are removed from target fs.
Message-ID: <20090826212215.159E7761C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fc3eb18b70fe4a866790f958b958d4f18daf1f63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The find command syntax is incorrect when deleting CVS and .svn directories
from the target filesystem, which prevent CVS directories from being
deleted.

It's useful to delete these dirs because users of buildroot often import
buildroot into CVS or Subversion.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 182853c..5683484 100644
--- a/Makefile
+++ b/Makefile
@@ -337,7 +337,7 @@ $(PROJECT_BUILD_DIR)/.root:
 		fi; \
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
-	-find $(TARGET_DIR) -type d -name CVS -o -name .svn -print0 | xargs -0 rm -rf
+	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
 	-find $(TARGET_DIR) -type f -name .empty -print0 | xargs -0 rm -rf
 	touch $@
 
-- 
1.6.3.3
