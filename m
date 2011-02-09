From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Feb 2011 23:01:44 +0100
Subject: [Buildroot] [git commit master 1/1] directfb: fixup directfb-config
	for correctness
Message-ID: <20110209220225.6EF048F47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b5b60cf5c1a2d822e1d22bf514c9c392d55d0799
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 36b1c0a..98590cc 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -137,6 +137,14 @@ HOST_DIRECTFB_BUILD_CMDS = \
 HOST_DIRECTFB_INSTALL_CMDS = \
 	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
 
+define DIRECTFB_STAGING_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/directfb-config
+endef
+
+DIRECTFB_POST_INSTALL_STAGING_HOOKS += DIRECTFB_STAGING_CONFIG_FIXUP
+
 $(eval $(call AUTOTARGETS,package,directfb))
 $(eval $(call AUTOTARGETS,package,directfb,host))
 
-- 
1.7.3.4
