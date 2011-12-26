From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 19:33:43 +0100
Subject: [Buildroot] [git commit] ti-utils: unbreak build after libnl
	version bump
Message-ID: <20111226183410.693548FDD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68902f743729b3482bb6bc2ae9d0306aa9c00f65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ti-utils/ti-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 15e620c..71a610d 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -10,8 +10,8 @@ TI_UTILS_DEPENDENCIES = libnl
 
 define TI_UTILS_BUILD_CMDS
 	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		-C $(@D) all
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
+		LIBS="-lnl-3 -lnl-genl-3 -lm" -C $(@D) all
 endef
 
 define TI_UTILS_INSTALL_TARGET_CMDS
