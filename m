From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:32:38 +0100
Subject: [Buildroot] [git commit] package/optee-benchmark: bump to version
 3.12.0
Message-ID: <20210308072140.59AEC81607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ecb88f1d37b670300b7e648c76baa613337e559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove main-fix-typo patch since merged in OP-TEE OS 3.12.0 and
bump OP-TEE Benchmark package version to OP-TEE release 3.12.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-benchmark/0001-main-fix-typo.patch | 55 ------------------------
 package/optee-benchmark/optee-benchmark.hash     |  4 +-
 package/optee-benchmark/optee-benchmark.mk       |  2 +-
 3 files changed, 3 insertions(+), 58 deletions(-)

diff --git a/package/optee-benchmark/0001-main-fix-typo.patch b/package/optee-benchmark/0001-main-fix-typo.patch
deleted file mode 100644
index 8ad5a26f13..0000000000
--- a/package/optee-benchmark/0001-main-fix-typo.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From ffa935dc881c394a824e063c8fde7dd102e06d8c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 8 May 2020 23:39:59 +0200
-Subject: [PATCH] main: fix typo
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The function yaml_mapping_start_event_initialize()
-take yaml_mapping_style_t style as last argument:
-
-int yaml_mapping_start_event_initialize(
-	yaml_event_t *event,
-	const yaml_char_t *anchor,
-	const yaml_char_t *tag,
-	int implicit,
-	yaml_mapping_style_t style)
-
-Use YAML_ANY_MAPPING_STYLE instead of YAML_ANY_SEQUENCE_STYLE
-
-Fixes:
-main.c:173:5: error: implicit conversion from ???enum yaml_sequence_style_e??? to ???yaml_mapping_style_t??? {aka ???enum yaml_mapping_style_e???} [-Werror=enum-conversion]
-  173 |     YAML_ANY_SEQUENCE_STYLE))
-      |     ^~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- main.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/main.c b/main.c
-index 29a7c42..1685d3e 100644
---- a/main.c
-+++ b/main.c
-@@ -170,7 +170,7 @@ static bool init_emitter(FILE *ts_file)
- 	/* Mapping start */
- 	if (!yaml_mapping_start_event_initialize(&event,
- 				NULL, NULL , YAML_IMPLICIT,
--				YAML_ANY_SEQUENCE_STYLE))
-+				YAML_ANY_MAPPING_STYLE))
- 		ERROR_GOTO(emitter_delete,
- 			"Failed to initialize YAML mapping start event");
- 	if (!yaml_emitter_emit(&emitter, &event))
-@@ -263,7 +263,7 @@ static bool fill_timestamp(uint32_t core, uint64_t count, uint64_t addr,
- 	/* Mapping start */
- 	if (!yaml_mapping_start_event_initialize(&event,
- 				NULL, NULL , YAML_IMPLICIT,
--				YAML_ANY_SEQUENCE_STYLE))
-+				YAML_ANY_MAPPING_STYLE))
- 		ERROR_RETURN_FALSE(
- 			"Failed to initialize YAML mapping start event");
- 	if (!yaml_emitter_emit(&emitter, &event))
--- 
-2.25.4
-
diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 12d1ddea88..144069b6f3 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.11.0.tar.gz
-sha256 34c314a5cda1e9e3b92f01759585722b44503d9eea19f6b936fc951f5acbac16 optee-benchmark-3.11.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.12.0/optee-benchmark-3.12.0.tar.gz
+sha256 468635656fa483911cf605a96711d848f8e0f6b4a6137208226de364dee25fe4 optee-benchmark-3.12.0.tar.gz
 # Locally computed
 sha256 0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index f9d7cae302..c17a7045d4 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.11.0
+OPTEE_BENCHMARK_VERSION = 3.12.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
