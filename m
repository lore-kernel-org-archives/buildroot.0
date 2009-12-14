From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2009 23:46:00 +0100
Subject: [Buildroot] [git commit master] gcc: remove hurd specific details
Message-ID: <20091214231105.C8C3877812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=48fbdaaea6800b8fc5a4bc9bfeba105f3c46ae22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index d5a889f..d25a9b6 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -150,10 +150,6 @@ else
 GCC_TLS:=--disable-tls
 endif
 
-ifeq ($(BR2_KERNEL_HURD),y)
-EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
-endif
-
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 GCC_DECIMAL_FLOAT:=--disable-decimal-float
 endif
-- 
1.6.3.3
