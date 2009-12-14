From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2009 23:54:27 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: remove hurd specific details
In-Reply-To: <cover.1260831265.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831265.git.thomas.petazzoni@free-electrons.com>
Message-ID: <48fbdaaea6800b8fc5a4bc9bfeba105f3c46ae22.1260831265.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
