From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Oct 2012 18:44:45 -0300
Subject: [Buildroot] [PATCH] toolchain/kernel-headers: drop unused cris
	architecture kludge
Message-ID: <1349905485-28527-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/kernel-headers.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index c464c37..568c192 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -70,11 +70,6 @@ $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
 		HOSTCXX="$(HOSTCXX)" \
 		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
 	)
-ifeq ($(BR2_ARCH),"cris")
-	ln -s $(LINUX_HEADERS_DIR)/include/arch-v10/arch $(LINUX_HEADERS_DIR)/include/arch
-	cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
-	$(SED) "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
-endif
 	touch $@
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
-- 
1.7.8.6
