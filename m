From: Ed Blake <ed.blake@sondrel.com>
Date: Fri, 22 Mar 2019 16:59:48 +0000
Subject: [Buildroot] [PATCH 1/2] toolchain-external: add option for OpenMP
 support
In-Reply-To: <20190322165929.14306-1-ed.blake@sondrel.com>
References: <20190322165929.14306-1-ed.blake@sondrel.com>
Message-ID: <20190322165929.14306-2-ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new BR2_TOOLCHAIN_HAS_OPENMP option for toolchains with OpenMP
support.

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
---
 toolchain/Config.in                                    | 3 +++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bcbc3cf984..bf42e92e00 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -168,6 +168,9 @@ config BR2_TOOLCHAIN_HAS_SSP
 config BR2_TOOLCHAIN_HAS_UCONTEXT
 	bool
 
+config BR2_TOOLCHAIN_HAS_OPENMP
+	bool
+
 config BR2_TOOLCHAIN_SUPPORTS_PIE
 	bool
 
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index db3570d96f..747837fdc6 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -144,6 +144,10 @@ TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
 endif
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
+TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
+endif
+
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 
-- 
2.17.1
