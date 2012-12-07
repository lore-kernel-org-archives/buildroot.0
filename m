From: Stephan Hoffmann <sho@relinux.de>
Date: Fri,  7 Dec 2012 14:20:13 +0100
Subject: [Buildroot] [PATCH] Clean kernel when "make linux-clean" is called
In-Reply-To: <20120827210633.608e9bfe@skate>
References: <20120827210633.608e9bfe@skate>
Message-ID: <1354886413-28939-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When "make linux-clean" is typed one expects that the kernel tree
gets cleaned. Before this patch, only the stamp files had been
removed.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 linux/linux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..e517d1d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -221,6 +221,9 @@ define LINUX_BUILD_CMDS
 	$(LINUX_APPEND_DTB)
 endef
 
+define LINUX_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) clean
+endef
 
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
 define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
-- 
1.7.0.4
