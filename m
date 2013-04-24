From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 24 Apr 2013 12:13:20 +0200
Subject: [Buildroot] [PATCH v2 09/12] kernel-headers: Use ../testing URL for
	kernel release candidates
In-Reply-To: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366798403-6984-10-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 toolchain/kernel-headers/kernel-headers.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index adf7bc4..5462d5b 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -31,6 +31,9 @@ LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v2.6/
 else
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v3.x/
 endif
+ifeq ($(findstring rc,$(DEFAULT_KERNEL_HEADERS)),rc)
+LINUX_HEADERS_SITE:=$(LINUX_HEADERS_SITE)testing/
+endif
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
-- 
1.7.0.4
