From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  2 May 2018 11:05:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/llvm: delete LLVMHello.so from
 /usr/lib
In-Reply-To: <20180502090535.29498-1-valentin.korenblit@smile.fr>
References: <20180502090535.29498-1-valentin.korenblit@smile.fr>
Message-ID: <20180502090535.29498-2-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LLVMHello.so contains the Hello World example of an
LLVM pass. It is not needed on the target.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/llvm/llvm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index a25495fbd7..978f176f28 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -267,9 +267,9 @@ endef
 HOST_LLVM_POST_INSTALL_HOOKS = HOST_LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
 
 # By default llvm-tblgen is built and installed on the target but it is
-# not necessary.
+# not necessary. Also erase LLVMHello.so from /usr/lib
 define LLVM_DELETE_LLVM_TBLGEN_TARGET
-	rm -f $(TARGET_DIR)/usr/bin/llvm-tblgen
+	rm -f $(TARGET_DIR)/usr/bin/llvm-tblgen $(TARGET_DIR)/usr/lib/LLVMHello.so
 endef
 LLVM_POST_INSTALL_TARGET_HOOKS = LLVM_DELETE_LLVM_TBLGEN_TARGET
 
-- 
2.14.3
