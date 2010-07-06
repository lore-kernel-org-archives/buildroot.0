From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] external-toolchain: recognize
	uClibc 64 bits toolchains
Message-ID: <20100706060218.75CAA825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4b17cef16b9b82e120ea9a03481e3978a2229ac1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With uClibc 64 bits toolchain, the dynamic loader is named
ld64-uClibc.so.0 and not ld-uClibc.so.0. So, this commit adjust the
uClibc detection code for external toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.1
