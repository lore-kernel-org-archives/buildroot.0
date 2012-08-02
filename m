From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:32 -0000
Subject: [Buildroot] [git commit branch/next] input-tools: use provided
	linker flags as well
Message-ID: <20120802195246.8180A8E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02c0e82dd682f70562afee2b6c9b504b199b5db1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/input-tools/input-tools.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 38db2ea..4236c74 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -24,10 +24,12 @@ INPUT_TOOLS_POST_PATCH_HOOKS = INPUT_TOOLS_DEBIAN_PATCHES
 # jscal needs -lm
 define INPUT_TOOLS_BUILD_CMDS
 	for i in $(filter-out jscal,$(INPUT_TOOLS_TARGETS_y)); do \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c \
+			$(TARGET_LDFLAGS); \
 	done
 	for i in $(filter jscal,$(INPUT_TOOLS_TARGETS_y)); do \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c -lm; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c \
+			$(TARGET_LDFLAGS) -lm; \
 	done
 endef
 
