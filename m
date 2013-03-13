From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 13 Mar 2013 01:05:38 +0100
Subject: [Buildroot] [PATCH] sysvinit: fix linking of sulogin with -lcrypt
In-Reply-To: <513FC280.5040008@mind.be>
References: <513FC280.5040008@mind.be>
Message-ID: <1363133138-32481-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The LCRYPT variable is no longer used; use SULOGINLIBS instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sysvinit/sysvinit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.10.4
