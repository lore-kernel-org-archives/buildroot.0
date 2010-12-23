From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 Dec 2010 11:47:39 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: fix again stamp file
	touch
Message-ID: <20101223104759.DBABD8E263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c8530262260fee4b475ccca1ae04eb28433fc4eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In e6633fd2e37d25f32958f30e852baa216ce1384a I did crap, and added a
quietization inside a shell command, which was already quietized. This
was stupid, and is fixed by this patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.2.2
