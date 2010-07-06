From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] external-toolchain: support 64
	bits glibc toolchains
Message-ID: <20100706060217.D15F8825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=914f19ca1ea648d451bfa2ab232dbf1cc1fed351
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On 64 bits glibc toolchains, the dynamic loader is named
ld-linux-x86-64.so and not simply ld-linux.so. So, adjust the
detection of the C library accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.1
