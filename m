From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 22:12:13 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: really adjust kernel
	modules strip invocation
Message-ID: <20101124211242.09EC08D25D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7dccbc44a84f371694ab7b38833908125df315d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index cfaa316..a53ef89 100644
--- a/Makefile
+++ b/Makefile
@@ -419,7 +419,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-		xargs -r $(STRIPCMD) -R .comment -R .note -g --strip-unneeded
+		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 
 	mkdir -p $(TARGET_DIR)/etc
 	# Mandatory configuration file and auxilliary cache directory
-- 
1.7.2.2
