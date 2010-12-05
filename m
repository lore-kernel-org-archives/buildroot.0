From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 10:25:37 +0100
Subject: [Buildroot] [PATCH 10/15] gcc: disable libgomp when thread support
	is disabled
In-Reply-To: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e1f96917ebf065d96afc384cd3b7b596489ceb28.1291541115.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgomp needs thread support on the target to build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 5f69906..cd63992 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -139,7 +139,7 @@ GCC_TLS:=--disable-tls
 endif
 
 ifeq ($(BR2_PTHREADS_NONE),y)
-THREADS:=--disable-threads
+THREADS:=--disable-threads --disable-libgomp
 else
 THREADS:=--enable-threads
 endif
-- 
1.7.0.4
