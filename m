From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:22:46 +0100
Subject: [Buildroot] [PATCH 2/6] neon: remove neon-config script from
	TARGET_DIR
In-Reply-To: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7ec08dab2879be9745ea0750cfb5fca7c13e48df.1299532965.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
