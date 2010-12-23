From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 11:42:49 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: fix again stamp file touch
In-Reply-To: <cover.1293100963.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293100963.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1b94958acacfda721682103452ced93d539f9a9c.1293100963.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In e6633fd2e37d25f32958f30e852baa216ce1384a I did crap, and added a
quietization inside a shell command, which was already quietized. This
was stupid, and is fixed by this patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index ab8bc94..f6249ef 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -195,4 +195,4 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
-	$(Q)touch $@
+	touch $@
-- 
1.7.0.4
