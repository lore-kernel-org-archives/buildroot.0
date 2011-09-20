From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:18:32 +0200
Subject: [Buildroot] [git commit] rtai: fix path to apply-patches
Message-ID: <20110920202238.544058D723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a615f5c7ca3b4019470a470424ced0dfc394ad2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux-ext-rtai.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 150f9e8..78488af 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -25,7 +25,7 @@ ifeq ($(RTAI_PATCH),)
 define RTAI_PREPARE_KERNEL
 	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
 	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		support/script/apply-patches.sh $(LINUX_DIR) 		\
+		support/scripts/apply-patches.sh $(LINUX_DIR) 		\
 			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
 			hal-linux-$${kver}-*patch ; \
 	else \
@@ -35,7 +35,7 @@ define RTAI_PREPARE_KERNEL
 endef
 else
 define RTAI_PREPARE_KERNEL
-	support/script/apply-patches.sh 	\
+	support/scripts/apply-patches.sh 	\
 		$(LINUX_DIR)			\
 		$(dir $(RTAI_PATCH))		\
 		$(notdir $(RTAI_PATCH))
