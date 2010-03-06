From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Mar 2010 00:13:53 +0100
Subject: [Buildroot] [git commit master] dosfstools: unbreak build
Message-ID: <20100306231924.8142577715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9b592eb06e91306de1ee14861680326ca24c81dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unbreak build after e8352988 (make sure install targets aren't run everytime)

Reported-by: Darcy Watkins <DWatkins@tranzeo.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    2 +-
 package/dosfstools/dosfstools.mk |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 76d9aee..bd999db 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.05, Not yet released
 
-	 Updated/fixed packages: squashfs
+	 Updated/fixed packages: dosfstools, squashfs
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index b826ab1..a7f59f0 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -32,8 +32,7 @@ $(DOSFSTOOLS_DIR)/.built : $(DOSFSTOOLS_DIR)/.unpacked
 	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY)
 	touch $@
 
-$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): # $(DOSFSTOOLS_DIR)/.built
-	echo foo
+$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
 	cp -a $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY) $@
 	touch -c $@
 
-- 
1.6.3.3
