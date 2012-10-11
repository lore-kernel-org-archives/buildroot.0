From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 22:25:54 +0200
Subject: [Buildroot] [git commit] toolchain/kernel-headers: drop unused cris
	architecture kludge
Message-ID: <20121011202903.9F99299836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9d2bcd142e7162cabfa2153578eccc84e677d54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
