From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 18:25:22 +0100
Subject: [Buildroot] [PATCH 3/7] neon: remove neon-config script from
	TARGET_DIR
In-Reply-To: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
Message-ID: <01842baab1e3559eef5172206cf3993e6ee8c9f0.1293038710.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/neon.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index c570fc1..41d8fa1 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -45,4 +45,10 @@ else
 NEON_CONF_OPT+=--without-ssl
 endif
 
+define NEON_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/neon-config
+endef
+
+NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
+
 $(eval $(call AUTOTARGETS,package,neon))
-- 
1.7.0.4
