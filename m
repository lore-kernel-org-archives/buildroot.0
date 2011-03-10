From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 11:36:18 +0100
Subject: [Buildroot] [git commit master 1/1] neon: remove neon-config script
	from TARGET_DIR
Message-ID: <20110310111400.835918FE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ec08dab2879be9745ea0750cfb5fca7c13e48df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/neon.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index c570fc1..0c237dc 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -45,4 +45,12 @@ else
 NEON_CONF_OPT+=--without-ssl
 endif
 
+define NEON_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/neon-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
+endif
+
 $(eval $(call AUTOTARGETS,package,neon))
-- 
1.7.3.4
