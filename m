From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 20:17:21 +0100
Subject: [Buildroot] [git commit] toolchain-external: introduce
 BR2_TOOLCHAIN_HAS_OPENMP
Message-ID: <20190326191521.CC6DE87F45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c808710f6f0be9d7923d937768d7da8461666cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new BR2_TOOLCHAIN_HAS_OPENMP option for toolchains with OpenMP
support.

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in                                    | 3 +++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3f297f6b43..552220123f 100644
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
 
 
