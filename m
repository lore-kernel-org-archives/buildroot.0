From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 Aug 2012 21:44:17 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: fix check_glibc
	sysroot typo
Message-ID: <20120831194637.1BA04994C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=666eb02be3cd4115a1ef8b78a63d64d12b24469e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduced by 68973cca2 (adjust logic to support Linaro 2012.05)

Reported-by: R Zhong <rzhong@hotmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 49a9044..d5ab91b 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -196,7 +196,7 @@ check_glibc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if test `find $${SYSDROOT_DIR}/lib/ -maxdepth 1 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
+	if test `find $${SYSROOT_DIR}/lib/ -maxdepth 1 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
