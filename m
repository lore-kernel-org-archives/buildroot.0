From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 11:36:18 +0100
Subject: [Buildroot] [git commit master 1/1] libdnet: remove dnet-config
	script from TARGET_DIR
Message-ID: <20110310111400.B4A338FE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=99175e43be4a7ad19c04364d3fe91db26853af33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.3.4
