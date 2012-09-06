From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Sep 2012 22:55:08 +0200
Subject: [Buildroot] [git commit] cjson: bug fix - use -fPIC instead of -fpic
Message-ID: <20120906210347.34B019959E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6743630d25e3e8f483ead766224444ff24965b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change is to fix the autobuild failure at:
http://autobuild.buildroot.net/results/45e2c08d5e3c868b2d7fdf26a7c5f88de5ff8f61/build-end.log
I can't actually reproduce this bug, because my machine cannot
run the 64-bit microblaze toolchain.  However, the log makes
it clear that -fPIC is needed, and grepping for fPIC and fpic
under packages makes it clear that cjson should have used -fPIC
anyway.  So even if the bug isn't fixed, it must surely be improved.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cjson/cjson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 79b4c31..dd64010 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -14,7 +14,7 @@ define CJSON_EXTRACT_CMDS
 endef
 
 define CJSON_BUILD_CMDS
-	cd $(@D)/cJSON && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fpic cJSON.c -o libcJSON.so
+	cd $(@D)/cJSON && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC cJSON.c -o libcJSON.so
 endef
 
 define CJSON_INSTALL_STAGING_CMDS
