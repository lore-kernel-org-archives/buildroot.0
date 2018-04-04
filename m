From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Apr 2018 17:54:51 +0200
Subject: [Buildroot] [PATCH 2/2] uclibc: simplify UCLIBC_EXTRA_CFLAGS
In-Reply-To: <20180404155451.15258-1-thomas.petazzoni@bootlin.com>
References: <20180404155451.15258-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180404155451.15258-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.14.3
