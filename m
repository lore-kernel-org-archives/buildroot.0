From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:28:56 +0200
Subject: [Buildroot] [PATCH 06/23] toolchain/gcc: get rid of stale variable
	reference
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 0dc8200..b1484eb 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -519,8 +519,7 @@ endif
 cross_compiler:=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
 cross_compiler gcc: gcc_intermediate \
 	uclibc $(GCC_BUILD_DIR3)/.installed \
-	$(STAMP_DIR)/gcc_libs_target_installed \
-	$(GCC_TARGETS)
+	$(STAMP_DIR)/gcc_libs_target_installed
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
-- 
1.8.1.2
