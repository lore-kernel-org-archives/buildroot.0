From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 18:25:23 +0100
Subject: [Buildroot] [PATCH 4/7] libdnet: remove dnet-config script from
	TARGET_DIR
In-Reply-To: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7122ce5c138c556304b772d83581316c3942f034.1293038710.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdnet/libdnet.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index eb67b05..d3d58e5 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -31,4 +31,10 @@ endef
 
 LIBDNET_POST_EXTRACT_HOOKS += LIBDNET_FIXUP_ACINCLUDE_M4
 
+define LIBDNET_REMOVE_CONFIG_SCRIPT
+	$(RM) -f $(TARGET_DIR)/usr/bin/dnet-config
+endef
+
+LIBDNET_POST_INSTALL_TARGET_HOOKS += LIBDNET_REMOVE_CONFIG_SCRIPT
+
 $(eval $(call AUTOTARGETS,package,libdnet))
-- 
1.7.0.4
