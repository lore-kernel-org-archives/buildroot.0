From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:26:44 +0200
Subject: [Buildroot] [git commit] uclibc: simplify UCLIBC_EXTRA_CFLAGS
Message-ID: <20180409092647.6B96483C36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0908b8ecada61454bf8b223777ef4970d74a1370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit f66952197b41452b77dfa065adc7172137e4c243 ("package/gcc:
remove gcc 4.8"), UCLIBC_EXTRA_CFLAGS no longer exists, and is
therefore always empty.

Passing the Buildroot make variable UCLIBC_EXTRA_CFLAGS into the
UCLIBC_EXTRA_CFLAGS fed into uClibc's make environment therefore no
longer makes sense. Therefore, just pass $(TARGET_ABI).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 8d198f669a..25e86534fd 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -382,7 +382,7 @@ endif
 UCLIBC_MAKE_FLAGS = \
 	ARCH="$(UCLIBC_TARGET_ARCH)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
+	UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_KCONFIG_FIXUP_CMDS
