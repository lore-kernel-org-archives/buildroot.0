From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Dec 2010 09:14:15 +0100
Subject: [Buildroot] [git commit master 1/1] uclibc: move tools to host dir
Message-ID: <20101229081558.8BE058EE81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=514c019aa0f6847d0766a439da178ac4648db554
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move uclibc host tools (ldd/ldconfig) to host dir.
They were previously installed in the staging dir.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index e05e16c..ec92824 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -450,17 +450,17 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 	fi
 	# Build the host utils. Need to add an install target...
 	$(MAKE1) -C $(UCLIBC_DIR)/utils \
-		PREFIX=$(STAGING_DIR) \
+		PREFIX=$(HOST_DIR) \
 		HOSTCC="$(HOSTCC)" \
 		hostutils
 	if [ -f $(UCLIBC_DIR)/utils/ldd.host ]; then \
-		install -c $(UCLIBC_DIR)/utils/ldd.host $(STAGING_DIR)/usr/bin/ldd; \
-		ln -sf ldd $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldd; \
+		install -D $(UCLIBC_DIR)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd; \
+		ln -sf ldd $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldd; \
 	fi
 	if [ -f $(UCLIBC_DIR)/utils/ldconfig.host ]; then \
-		install -c $(UCLIBC_DIR)/utils/ldconfig.host $(STAGING_DIR)/usr/bin/ldconfig; \
-		ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldconfig; \
-		ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
+		install -D $(UCLIBC_DIR)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig; \
+		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldconfig; \
+		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
 	fi
 	touch -c $@
 
-- 
1.7.2.2
