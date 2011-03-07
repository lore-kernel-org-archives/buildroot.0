From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:22:47 +0100
Subject: [Buildroot] [PATCH 3/6] libdnet: remove dnet-config script from
	TARGET_DIR
In-Reply-To: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
Message-ID: <99175e43be4a7ad19c04364d3fe91db26853af33.1299532965.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdnet/libdnet.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index eb67b05..6dfecf9 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -31,4 +31,12 @@ endef
 
 LIBDNET_POST_EXTRACT_HOOKS += LIBDNET_FIXUP_ACINCLUDE_M4
 
+define LIBDNET_REMOVE_CONFIG_SCRIPT
+	$(RM) -f $(TARGET_DIR)/usr/bin/dnet-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBDNET_POST_INSTALL_TARGET_HOOKS += LIBDNET_REMOVE_CONFIG_SCRIPT
+endif
+
 $(eval $(call AUTOTARGETS,package,libdnet))
-- 
1.7.0.4
