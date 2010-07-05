From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Jul 2010 18:58:57 +0200
Subject: [Buildroot] [PATCH 04/10] external-toolchain: support 64 bits glibc
	toolchains
In-Reply-To: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <41ba3c02c9a077d732289378e0a346b94298b479.1278349072.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 64 bits glibc toolchains, the dynamic loader is named
ld-linux-x86-64.so and not simply ld-linux.so. So, adjust the
detection of the C library accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 9c1ec8f..a181f25 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -157,7 +157,7 @@ check_glibc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \
+	if ! test -f $${SYSROOT_DIR}/lib/ld-linux*.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
-- 
1.7.0.4
