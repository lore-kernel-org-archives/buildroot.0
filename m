From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 21 Oct 2018 04:09:24 -0500
Subject: [Buildroot] [PATCH] package/clang: default linker to GNU
Message-ID: <1540112964-50052-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default clang is assuming the system linker /usr/bin/ld.  This
patchset updates the default to point at the cross toolchain ld.

Previously clang had been used on target only, this update is
required for host clang/clang++ to be used as a frontend for
cross-compiling.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/clang/clang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 52e0b98..e2d4a08 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -42,7 +42,8 @@ CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
 HOST_CLANG_CONF_OPTS += \
 	-DCLANG_BUILD_EXAMPLES=OFF \
 	-DCLANG_INCLUDE_DOCS=OFF \
-	-DCLANG_INCLUDE_TESTS=OFF
+	-DCLANG_INCLUDE_TESTS=OFF \
+	-DCLANG_DEFAULT_LINKER=$(TARGET_LD)
 
 CLANG_CONF_OPTS += \
 	-DCLANG_BUILD_EXAMPLES=OFF \
-- 
1.9.1
