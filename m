From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jun 2012 16:40:00 +0200
Subject: [Buildroot] [git commit] input-tools: use provided linker flags as
	well
Message-ID: <20120629144806.1A7E98EE2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02c0e82dd682f70562afee2b6c9b504b199b5db1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
