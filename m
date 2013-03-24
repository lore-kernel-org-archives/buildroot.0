From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:32 +0100
Subject: [Buildroot] [PATCH 08/22] kernel-headers: add missing $(Q)
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a missing $(Q) in front of a MESSAGE call, which leads to the
message being displayed but also the command that shows the message.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/kernel-headers/kernel-headers.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 073d609..7ce6264 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -70,7 +70,7 @@ $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
 	$(error No local $@ found, cannot continue. Are you sure you wanted to enable BR2_KERNEL_HEADERS_SNAP?)
 endif
-	$(call MESSAGE,"Downloading kernel headers")
+	$(Q)$(call MESSAGE,"Downloading kernel headers")
 	$(call DOWNLOAD,$(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE))
 
 kernel-headers: $(LINUX_HEADERS_DIR)/.configured
-- 
1.7.9.5
