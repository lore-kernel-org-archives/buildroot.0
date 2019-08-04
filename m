From: Romain Naour <romain.naour@smile.fr>
Date: Sun,  4 Aug 2019 09:45:45 +0200
Subject: [Buildroot] [WIP 2/2] testing/package/libfuzzer: remove -B option
In-Reply-To: <20190804074545.28841-1-romain.naour@smile.fr>
References: <20190804074545.28841-1-romain.naour@smile.fr>
Message-ID: <20190804074545.28841-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the previous patch, clang can be used without -B option.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../clang-compiler-rt/package/libfuzzer/libfuzzer.mk            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
index 7d6f83b4d3..3a9902b3e4 100644
--- a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
@@ -12,7 +12,7 @@ LIBFUZZER_DEPENDENCIES = compiler-rt
 
 define LIBFUZZER_BUILD_CMDS
 	$(HOST_DIR)/bin/clang++ -mcpu=cortex-a53 --sysroot=$(STAGING_DIR) \
-		-B $(HOST_DIR)/opt/ext-toolchain -fsanitize=address,fuzzer \
+		-fsanitize=address,fuzzer \
 		$(@D)/tutorial/fuzz_me.cc \
 		-o $(@D)/fuzz_me
 endef
-- 
2.20.1
