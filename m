From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:14 +0200
Subject: [Buildroot] [PATCH 04/20] gcc: fix gcc 4.8 build when thread
	support is disabled
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When thread support is disabled, the libitm and libatomic libraries
from gcc should be disabled, otherwise, the build of gcc fails.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 21679ef..5be26c4 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -203,7 +203,7 @@ GCC_TLS:=--disable-tls
 endif
 
 ifeq ($(BR2_PTHREADS_NONE),y)
-THREADS:=--disable-threads
+THREADS:=--disable-threads --disable-libitm --disable-libatomic
 else
 THREADS:=--enable-threads
 endif
-- 
1.7.9.5
