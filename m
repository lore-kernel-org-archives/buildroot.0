From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Dec 2009 11:54:25 +0100
Subject: [Buildroot] [git commit master] Remove backup-files from the
	TARGET_DIR.
Message-ID: <20091223105452.C83B47780E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b9656e81a460ddbfc8668b9902a4a6f8b2bc2521
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #823.

~ is commonly used as a suffix to editor backup files.
Remove these files, just as we remove CVS-directories and
.empty-files.

[Peter: tweaked to remove in same find invocation as .empty]
Signed-off-by: Anders Darander <ad@datarespons.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    1 +
 Makefile |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 20089ed..6b6a6e8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,6 +24,7 @@
 	#767: Bump iw package to 0.9.18
 	#773: [SECURITY] Update bind to 9.5.2-P1
 	#795: Minor edits to fix typos, grammar, spelling, usage in documen...
+	#823: Editor backup files (~) is copied from the target_skeleton
 
 2009.11, Released December 1st, 2009:
 
diff --git a/Makefile b/Makefile
index 051b661..5f71148 100644
--- a/Makefile
+++ b/Makefile
@@ -386,7 +386,7 @@ $(BUILD_DIR)/.root:
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
 	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
-	-find $(TARGET_DIR) -type f -name .empty -print0 | xargs -0 rm -rf
+	-find $(TARGET_DIR) -type f \( -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
 	touch $@
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
-- 
1.6.3.3
