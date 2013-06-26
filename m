From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:25:56 +0200
Subject: [Buildroot] [RFCv2 01/19] uClibc: KERNEL_SOURCE no longer exists
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The KERNEL_SOURCE configuration option no longer exists in uClibc, so
there's no point in setting it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/uclibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index da1830f..5a84c5d 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -98,7 +98,6 @@ $(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched $(UCLIBC_CONFIG_FILE)
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
 		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
-		-e 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"$(LINUX_HEADERS_DIR)\",g' \
 		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"$(LINUX_HEADERS_DIR)/include\",g' \
 		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
 		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
-- 
1.8.1.2
