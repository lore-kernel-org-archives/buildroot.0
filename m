From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 10:35:32 +0200
Subject: [Buildroot] [PATCH 5/8] external toolchain: do not copy useless
	symbolic links
In-Reply-To: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3026e9930eaf9b287aa69c4ed7adfe34913afda3.1247819731.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not copy .so symbolic links to target when not needed. Only copy
.so.X symbolic links and the library itself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 0e1deb6..6df48f0 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -46,7 +46,7 @@ copy_toolchain_lib_root = \
 	STRIP="$(strip $4)"; \
  \
 	LIB_DIR="$${SYSROOT_DIR}/lib" ; \
-	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name "$${LIB}*"`; do \
+	for FILE in `find $${LIB_DIR} -maxdepth 1 -name "$${LIB}.*"`; do \
 		LIB=`basename $${FILE}`; \
 		while test \! -z "$${LIB}"; do \
 			rm -fr $(TARGET_DIR)$${DST}/$${LIB}; \
-- 
1.6.0.4
