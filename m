From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 00:13:44 +0100
Subject: [Buildroot] [git commit] directfb-examples: drop explicit stripping
	when installing into target
Message-ID: <20150226231816.13473817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1f83fefcb7fcc072e689d4f5c8a70a22e8410a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stripping is globally handled by target-finalize (if enabled), so drop it
from here.

Reported-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb-examples/directfb-examples.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 40afd81..3ba33b4 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -98,7 +98,6 @@ define DIRECTFB_EXAMPLES_INSTALL_TARGET_CMDS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/fonts/
 	$(Q)for file in $(DIRECTFB_EXAMPLES_TARGETS_y); do \
 	        cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$$file; \
 	done
 	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fonts/decker.ttf $(TARGET_DIR)/usr/share/directfb-examples/fonts/
 	$(Q)for file in $(DIRECTFB_EXAMPLES_FONT_y); do \
