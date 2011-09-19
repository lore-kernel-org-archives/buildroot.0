From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:10:54 +0200
Subject: [Buildroot] [PATCH 3/5] rtai: fix path to apply-patches
In-Reply-To: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <df4ea3f388dc7aacc16eb1866fbd0be62c4e6705.1316463052.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
