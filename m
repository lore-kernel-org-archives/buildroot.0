From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 31 Jan 2017 17:03:38 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain-external: remove stale references
	to (ARCH_)LIBC_A_LOCATION
In-Reply-To: <20170131160343.27144-1-patrickdepinguin@gmail.com>
References: <20170131160343.27144-1-patrickdepinguin@gmail.com>
Message-ID: <20170131160343.27144-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The variables LIBC_A_LOCATION and ARCH_LIBC_A_LOCATION were killed in commit
646bd86908f7f995cdc2b95e0be381d97600f905 but the corresponding descriptions
were never removed.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../toolchain-external/pkg-toolchain-external.mk   | 30 ++++++++--------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index e0a8b41..6658875 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -347,35 +347,27 @@ endef
 #
 # Variables are defined as follows:
 #
-#  LIBC_A_LOCATION:     location of the libc.a file in the default
-#                       multilib variant (allows to find the main
-#                       sysroot directory)
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/usr/lib/libc.a
-#
-#  SYSROOT_DIR:         the main sysroot directory, deduced from
-#                       LIBC_A_LOCATION by removing the
-#                       usr/lib[32|64]/libc.a part of the path.
+# SYSROOT_DIR:          the main sysroot directory, deduced from the location of
+#                       the libc.a file in the default multilib variant, by
+#                       removing the usr/lib[32|64]/libc.a part of the path.
 #                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/
 #
-# ARCH_LIBC_A_LOCATION: location of the libc.a file in the selected
-#                       multilib variant (taking into account the
-#                       CFLAGS). Allows to find the sysroot of the
-#                       selected multilib variant.
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/usr/lib/libc.a
-#
 # ARCH_SYSROOT_DIR:     the sysroot of the selected multilib variant,
-#                       deduced from ARCH_LIBC_A_LOCATION by removing
-#                       usr/lib[32|64]/libc.a at the end of the path.
+#                       deduced from the location of the libc.a file in the
+#                       selected multilib variant (taking into account the
+#                       CFLAGS), by removing usr/lib[32|64]/libc.a at the end
+#                       of the path.
 #                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/
 #
 # ARCH_LIB_DIR:         'lib', 'lib32' or 'lib64' depending on where libraries
-#                       are stored. Deduced from ARCH_LIBC_A_LOCATION by
-#                       looking at usr/lib??/libc.a.
+#                       are stored. Deduced from the location of the libc.a file
+#                       in the selected multilib variant, by looking at
+#                       usr/lib??/libc.a.
 #                       Ex: lib
 #
 # ARCH_SUBDIR:          the relative location of the sysroot of the selected
 #                       multilib variant compared to the main sysroot.
-#			Ex: mips16/soft-float/el
+#                       Ex: mips16/soft-float/el
 #
 # SUPPORT_LIB_DIR:      some toolchains, such as recent Linaro toolchains,
 #                       store GCC support libraries (libstdc++,
-- 
2.10.2
