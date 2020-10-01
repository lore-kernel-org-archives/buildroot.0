From: Touhtarian, Eric <etouhtarian@distech-controls.com>
Date: Thu, 1 Oct 2020 14:47:54 +0000
Subject: [Buildroot] [PATCH 1/1] Get git version and transfer it to build
 target
In-Reply-To: <20200917153353.8824-1-etouhtarian@distech-controls.com>
References: <20200917153353.8824-1-etouhtarian@distech-controls.com>
Message-ID: <DM6PR01MB4137A236093298F048094EAC8A300@DM6PR01MB4137.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Touhtarian <etouhtarian@distech-controls.com>
---
 linux/linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk index b9f2052ee7..36f98dd704 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -538,6 +538,13 @@ $(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL sett  endif  endif
 
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
+define LINUX_GIT_VERSION
+	$(TOPDIR)/support/scripts/setlocalversion $(LINUX_DL_DIR)/git > 
+$(@D)/.scmversion endef LINUX_PRE_BUILD_HOOKS += LINUX_GIT_VERSION 
+endif
+
 ifeq ($(BR_BUILDING),y)
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
--
2.17.1
