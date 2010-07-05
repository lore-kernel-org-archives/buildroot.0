From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Jul 2010 18:59:00 +0200
Subject: [Buildroot] [PATCH 07/10] external-toolchain: recognize uClibc 64
	bits toolchains
In-Reply-To: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e3bae80372d1327fc88436202825562178faf08d.1278349072.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With uClibc 64 bits toolchain, the dynamic loader is named
ld64-uClibc.so.0 and not ld-uClibc.so.0. So, this commit adjust the
uClibc detection code for external toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index d591781..3996184 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -216,7 +216,7 @@ check_uclibc_feature = \
 #
 check_uclibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld-uClibc.so.* ; then \
+	if ! test -f $${SYSROOT_DIR}/lib/ld*-uClibc.so.* ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
-- 
1.7.0.4
