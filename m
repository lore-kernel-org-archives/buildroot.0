From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Apr 2010 13:48:10 +0200
Subject: [Buildroot] [git commit master] uclibc: don't install libs to
	target if BR2_PREFER_STATIC_LIB
Message-ID: <20100405131722.65A857FA2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c95174a8dfb6f72b80768b73b8f04448f846c122
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 52a8ae9..3e69770 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -512,7 +512,10 @@ ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
 endif
 	touch -c $@
 
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
+endif
+
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 UCLIBC_TARGETS+=uclibc-test
 endif
-- 
1.6.3.3
