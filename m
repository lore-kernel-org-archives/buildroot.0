From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:58 +0200
Subject: [Buildroot] [PATCH 72/74] udpcast: actually use the hooks
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <704d222df1e77dcd01bd7939152bbfe09f8ebec3.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udpcast/udpcast.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index d290cc9..d55724c 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -15,7 +15,7 @@ define UDPCAST_REMOVE_UDP_SENDER
 endef
 
 ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
-UDPCAST_HOOK_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_SENDER
+UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_SENDER
 endif
 
 define UDPCAST_REMOVE_UDP_RECEIVER
@@ -24,7 +24,7 @@ define UDPCAST_REMOVE_UDP_RECEIVER
 endef
 
 ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
-UDPCAST_HOOK_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
+UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
 endif
 
 $(eval $(call AUTOTARGETS,package,udpcast))
-- 
1.7.0.4
