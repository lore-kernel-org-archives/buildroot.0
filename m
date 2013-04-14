From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 23:21:57 +0200
Subject: [Buildroot] [git commit] sysvinit: fix linking of sulogin with
	-lcrypt
Message-ID: <20130414212252.0EEB69B6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5e3178197ff17b9f4a4c2ecb6d32b72a38a1246
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LCRYPT variable is no longer used; use SULOGINLIBS instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sysvinit/sysvinit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 10feb96..606c33e 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -24,7 +24,7 @@ SYSVINIT_POST_PATCH_HOOKS = SYSVINIT_DEBIAN_PATCHES
 define SYSVINIT_BUILD_CMDS
 	# Force sysvinit to link against libcrypt as it otherwise
 	# use an incorrect test to see if it's available
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LCRYPT="-lcrypt" -C $(@D)/src
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) SULOGINLIBS="-lcrypt" -C $(@D)/src
 endef
 
 define SYSVINIT_INSTALL_TARGET_CMDS
