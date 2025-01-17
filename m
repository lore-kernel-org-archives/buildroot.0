Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE723C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589B14F13B;
	Fri, 28 Feb 2025 16:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LShKC0klkVus; Fri, 28 Feb 2025 16:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1D024F13D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D024F13D;
	Fri, 28 Feb 2025 16:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2A6068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FFA081DF6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QXwwU1wynJ5 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59B6081987
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59B6081987
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 498CA83B5A; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Jan 2025 19:44:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 22235c1375cd9aed46a5f70edc3a1e19a51dc3f5
X-Git-Newrev: c6d54bc4e611eae28b6de5f1e7b9dcb5bd685c55
X-Patchwork-Hint: ignore
Message-Id: <20250228163013.498CA83B5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/git: security bump to
 version 2.48.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6778361975013769957=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6778361975013769957==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c6d54bc4e611eae28b6de5f1e7b9dcb5bd685c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump the package version to v2.48.1. While at it, also drop clar build
fix patchset applied to v2.47.0.

Release notes for v2.48.1 (security bump):
https://lore.kernel.org/git/xmqq5xmh46oc.fsf@gitster.g/

Release notes for v2.48.0 (feature release):
https://lore.kernel.org/git/xmqqplku7cvm.fsf@gitster.g/

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2024-50349
https://nvd.nist.gov/vuln/detail/CVE-2024-52006

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
[Julien:
  - add "security" in the commit log title
  - add links to CVEs
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-t-unit-tests-update-clar-to-206accb.patch | 661 ---------------------
 ...just-sed-command-for-generating-clar-decl.patch |  37 --
 ...tract-script-to-generate-clar-declaration.patch |  58 --
 ...-fix-compilation-of-clar-based-unit-tests.patch |  39 --
 ...p-proper-dependencies-for-generated-clar-.patch |  84 ---
 package/git/git.hash                               |   2 +-
 package/git/git.mk                                 |   2 +-
 7 files changed, 2 insertions(+), 881 deletions(-)

diff --git a/package/git/0001-t-unit-tests-update-clar-to-206accb.patch b/package/git/0001-t-unit-tests-update-clar-to-206accb.patch
deleted file mode 100644
index 7c90527453..0000000000
--- a/package/git/0001-t-unit-tests-update-clar-to-206accb.patch
+++ /dev/null
@@ -1,661 +0,0 @@
-From ec8bd87077355207d9466b0ecef5246295ee0672 Mon Sep 17 00:00:00 2001
-From: Patrick Steinhardt <ps@pks.im>
-Date: Mon, 21 Oct 2024 12:56:33 +0200
-Subject: [PATCH] t/unit-tests: update clar to 206accb
-
-Update clar from:
-
-    - 1516124 (Merge pull request #97 from pks-t/pks-whitespace-fixes, 2024-08-15).
-
-To:
-
-    - 206accb (Merge pull request #108 from pks-t/pks-uclibc-without-wchar, 2024-10-21)
-
-This update includes a bunch of fixes and improvements that we have
-discussed in Git when initial support for clar was merged:
-
-  - There is a ".editorconfig" file now.
-
-  - Compatibility with Windows has been improved so that the clar
-    compiles on this platform without an issue. This has been tested
-    with Cygwin, MinGW and Microsoft Visual Studio.
-
-  - clar now uses CMake. This does not impact us at all as we wire up
-    the clar into our own build infrastructure anyway. This conversion
-    was done such that we can easily run CI jobs against Windows.
-
-  - Allocation failures are now checked for consistently.
-
-  - We now define feature test macros in "clar.c", which fixes
-    compilation on some platforms that didn't previously pull in
-    non-standard functions like lstat(3p) or strdup(3p). This was
-    reported by a user of OpenSUSE Leap.
-
-  - We stop using `struct timezone`, which is undefined behaviour
-    nowadays and results in a compilation error on some platforms.
-
-  - We now use the combination of mktemp(3) and mkdir(3) on SunOS, same
-    as we do on NonStop.
-
-  - We now support uClibc without support for <wchar.h>.
-
-The most important bits here are the improved platform compatibility
-with Windows, OpenSUSE, SunOS and uClibc.
-
-Signed-off-by: Patrick Steinhardt <ps@pks.im>
-Upstream: https://lore.kernel.org/r/06145a141dd3485f183bcf8248de0db61a7203db.1729506329.git.ps@pks.im
-Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
----
- t/unit-tests/clar/.editorconfig            |  13 +++
- t/unit-tests/clar/.github/workflows/ci.yml |  20 +++-
- t/unit-tests/clar/.gitignore               |   1 +
- t/unit-tests/clar/CMakeLists.txt           |  28 +++++
- t/unit-tests/clar/clar.c                   | 127 ++++++++++++---------
- t/unit-tests/clar/clar/print.h             |  11 +-
- t/unit-tests/clar/clar/sandbox.h           |  17 ++-
- t/unit-tests/clar/clar/summary.h           |  14 +--
- t/unit-tests/clar/test/.gitignore          |   4 -
- t/unit-tests/clar/test/CMakeLists.txt      |  39 +++++++
- t/unit-tests/clar/test/Makefile            |  39 -------
- 11 files changed, 189 insertions(+), 124 deletions(-)
- create mode 100644 t/unit-tests/clar/.editorconfig
- create mode 100644 t/unit-tests/clar/.gitignore
- create mode 100644 t/unit-tests/clar/CMakeLists.txt
- delete mode 100644 t/unit-tests/clar/test/.gitignore
- create mode 100644 t/unit-tests/clar/test/CMakeLists.txt
- delete mode 100644 t/unit-tests/clar/test/Makefile
-
-diff --git a/t/unit-tests/clar/.editorconfig b/t/unit-tests/clar/.editorconfig
-new file mode 100644
-index 0000000000..aa343a4288
---- /dev/null
-+++ b/t/unit-tests/clar/.editorconfig
-@@ -0,0 +1,13 @@
-+root = true
-+
-+[*]
-+charset = utf-8
-+insert_final_newline = true
-+
-+[*.{c,h}]
-+indent_style = tab
-+tab_width = 8
-+
-+[CMakeLists.txt]
-+indent_style = tab
-+tab_width = 8
-diff --git a/t/unit-tests/clar/.github/workflows/ci.yml b/t/unit-tests/clar/.github/workflows/ci.yml
-index b1ac2de460..0065843d17 100644
---- a/t/unit-tests/clar/.github/workflows/ci.yml
-+++ b/t/unit-tests/clar/.github/workflows/ci.yml
-@@ -10,14 +10,26 @@ jobs:
-   build:
-     strategy:
-       matrix:
--        os: [ ubuntu-latest, macos-latest ]
-+        platform:
-+          - os: ubuntu-latest
-+            generator: Unix Makefiles
-+          - os: macos-latest
-+            generator: Unix Makefiles
-+          - os: windows-latest
-+            generator: Visual Studio 17 2022
-+          - os: windows-latest
-+            generator: MSYS Makefiles
-+          - os: windows-latest
-+            generator: MinGW Makefiles
- 
--    runs-on: ${{ matrix.os }}
-+    runs-on: ${{ matrix.platform.os }}
- 
-     steps:
-     - name: Check out
-       uses: actions/checkout@v2
-     - name: Build
-       run: |
--        cd test
--        make
-+        mkdir build
-+        cd build
-+        cmake .. -G "${{matrix.platform.generator}}"
-+        cmake --build .
-diff --git a/t/unit-tests/clar/.gitignore b/t/unit-tests/clar/.gitignore
-new file mode 100644
-index 0000000000..84c048a73c
---- /dev/null
-+++ b/t/unit-tests/clar/.gitignore
-@@ -0,0 +1 @@
-+/build/
-diff --git a/t/unit-tests/clar/CMakeLists.txt b/t/unit-tests/clar/CMakeLists.txt
-new file mode 100644
-index 0000000000..12d4af114f
---- /dev/null
-+++ b/t/unit-tests/clar/CMakeLists.txt
-@@ -0,0 +1,28 @@
-+cmake_minimum_required(VERSION 3.16..3.29)
-+
-+project(clar LANGUAGES C)
-+
-+option(BUILD_TESTS "Build test executable" ON)
-+
-+add_library(clar INTERFACE)
-+target_sources(clar INTERFACE
-+	clar.c
-+	clar.h
-+	clar/fixtures.h
-+	clar/fs.h
-+	clar/print.h
-+	clar/sandbox.h
-+	clar/summary.h
-+)
-+set_target_properties(clar PROPERTIES
-+	C_STANDARD 90
-+	C_STANDARD_REQUIRED ON
-+	C_EXTENSIONS OFF
-+)
-+
-+if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
-+	include(CTest)
-+	if(BUILD_TESTING)
-+		add_subdirectory(test)
-+	endif()
-+endif()
-diff --git a/t/unit-tests/clar/clar.c b/t/unit-tests/clar/clar.c
-index cef0f023c2..d54e455367 100644
---- a/t/unit-tests/clar/clar.c
-+++ b/t/unit-tests/clar/clar.c
-@@ -4,7 +4,12 @@
-  * This file is part of clar, distributed under the ISC license.
-  * For full terms see the included COPYING file.
-  */
--#include <assert.h>
-+
-+#define _BSD_SOURCE
-+#define _DARWIN_C_SOURCE
-+#define _DEFAULT_SOURCE
-+
-+#include <errno.h>
- #include <setjmp.h>
- #include <stdlib.h>
- #include <stdio.h>
-@@ -13,11 +18,22 @@
- #include <stdarg.h>
- #include <wchar.h>
- #include <time.h>
-+#include <inttypes.h>
- 
- /* required for sandboxing */
- #include <sys/types.h>
- #include <sys/stat.h>
- 
-+#if defined(__UCLIBC__) && ! defined(__UCLIBC_HAS_WCHAR__)
-+	/*
-+	 * uClibc can optionally be built without wchar support, in which case
-+	 * the installed <wchar.h> is a stub that only defines the `whar_t`
-+	 * type but none of the functions typically declared by it.
-+	 */
-+#else
-+#	define CLAR_HAVE_WCHAR
-+#endif
-+
- #ifdef _WIN32
- #	define WIN32_LEAN_AND_MEAN
- #	include <windows.h>
-@@ -28,6 +44,9 @@
- 
- #	ifndef stat
- #		define stat(path, st) _stat(path, st)
-+		typedef struct _stat STAT_T;
-+#	else
-+		typedef struct stat STAT_T;
- #	endif
- #	ifndef mkdir
- #		define mkdir(path, mode) _mkdir(path)
-@@ -60,30 +79,11 @@
- #	else
- #		define p_snprintf snprintf
- #	endif
--
--#	ifndef PRIuZ
--#		define PRIuZ "Iu"
--#	endif
--#	ifndef PRIxZ
--#		define PRIxZ "Ix"
--#	endif
--
--#	if defined(_MSC_VER) || (defined(__MINGW32__) && !defined(__MINGW64_VERSION_MAJOR))
--	typedef struct stat STAT_T;
--#	else
--	typedef struct _stat STAT_T;
--#	endif
- #else
- #	include <sys/wait.h> /* waitpid(2) */
- #	include <unistd.h>
- #	define _MAIN_CC
- #	define p_snprintf snprintf
--#	ifndef PRIuZ
--#		define PRIuZ "zu"
--#	endif
--#	ifndef PRIxZ
--#		define PRIxZ "zx"
--#	endif
- 	typedef struct stat STAT_T;
- #endif
- 
-@@ -102,7 +102,7 @@ fixture_path(const char *base, const char *fixture_name);
- struct clar_error {
- 	const char *file;
- 	const char *function;
--	size_t line_number;
-+	uintmax_t line_number;
- 	const char *error_msg;
- 	char *description;
- 
-@@ -195,11 +195,12 @@ static void clar_print_shutdown(int test_count, int suite_count, int error_count
- static void clar_print_error(int num, const struct clar_report *report, const struct clar_error *error);
- static void clar_print_ontest(const char *suite_name, const char *test_name, int test_number, enum cl_test_status failed);
- static void clar_print_onsuite(const char *suite_name, int suite_index);
-+static void clar_print_onabortv(const char *msg, va_list argp);
- static void clar_print_onabort(const char *msg, ...);
- 
- /* From clar_sandbox.c */
- static void clar_unsandbox(void);
--static int clar_sandbox(void);
-+static void clar_sandbox(void);
- 
- /* From summary.h */
- static struct clar_summary *clar_summary_init(const char *filename);
-@@ -218,6 +219,15 @@ static int clar_summary_shutdown(struct clar_summary *fp);
- 							   _clar.trace_payload);					\
- 	} while (0)
- 
-+static void clar_abort(const char *msg, ...)
-+{
-+	va_list argp;
-+	va_start(argp, msg);
-+	clar_print_onabortv(msg, argp);
-+	va_end(argp);
-+	exit(-1);
-+}
-+
- void cl_trace_register(cl_trace_cb *cb, void *payload)
- {
- 	_clar.pfn_trace_cb = cb;
-@@ -271,9 +281,7 @@ static double clar_time_diff(clar_time *start, clar_time *end)
- 
- static void clar_time_now(clar_time *out)
- {
--	struct timezone tz;
--
--	gettimeofday(out, &tz);
-+	gettimeofday(out, NULL);
- }
- 
- static double clar_time_diff(clar_time *start, clar_time *end)
-@@ -386,7 +394,8 @@ clar_run_suite(const struct clar_suite *suite, const char *filter)
- 
- 		_clar.active_test = test[i].name;
- 
--		report = calloc(1, sizeof(struct clar_report));
-+		if ((report = calloc(1, sizeof(*report))) == NULL)
-+			clar_abort("Failed to allocate report.\n");
- 		report->suite = _clar.active_suite;
- 		report->test = _clar.active_test;
- 		report->test_number = _clar.tests_ran;
-@@ -479,9 +488,10 @@ clar_parse_args(int argc, char **argv)
- 
- 					switch (action) {
- 					case 's': {
--						struct clar_explicit *explicit =
--							calloc(1, sizeof(struct clar_explicit));
--						assert(explicit);
-+						struct clar_explicit *explicit;
-+
-+						if ((explicit = calloc(1, sizeof(*explicit))) == NULL)
-+							clar_abort("Failed to allocate explicit test.\n");
- 
- 						explicit->suite_idx = j;
- 						explicit->filter = argument;
-@@ -505,10 +515,8 @@ clar_parse_args(int argc, char **argv)
- 				}
- 			}
- 
--			if (!found) {
--				clar_print_onabort("No suite matching '%s' found.\n", argument);
--				exit(-1);
--			}
-+			if (!found)
-+				clar_abort("No suite matching '%s' found.\n", argument);
- 			break;
- 		}
- 
-@@ -540,11 +548,17 @@ clar_parse_args(int argc, char **argv)
- 		case 'r':
- 			_clar.write_summary = 1;
- 			free(_clar.summary_filename);
--			_clar.summary_filename = *(argument + 2) ? strdup(argument + 2) : NULL;
-+			if (*(argument + 2)) {
-+				if ((_clar.summary_filename = strdup(argument + 2)) == NULL)
-+					clar_abort("Failed to allocate summary filename.\n");
-+			} else {
-+				_clar.summary_filename = NULL;
-+			}
- 			break;
- 
- 		default:
--			assert(!"Unexpected commandline argument!");
-+			clar_abort("Unexpected commandline argument '%s'.\n",
-+				   argument[1]);
- 		}
- 	}
- }
-@@ -566,22 +580,18 @@ clar_test_init(int argc, char **argv)
- 	if (!_clar.summary_filename &&
- 	    (summary_env = getenv("CLAR_SUMMARY")) != NULL) {
- 		_clar.write_summary = 1;
--		_clar.summary_filename = strdup(summary_env);
-+		if ((_clar.summary_filename = strdup(summary_env)) == NULL)
-+			clar_abort("Failed to allocate summary filename.\n");
- 	}
- 
- 	if (_clar.write_summary && !_clar.summary_filename)
--		_clar.summary_filename = strdup("summary.xml");
-+		if ((_clar.summary_filename = strdup("summary.xml")) == NULL)
-+			clar_abort("Failed to allocate summary filename.\n");
- 
--	if (_clar.write_summary &&
--	    !(_clar.summary = clar_summary_init(_clar.summary_filename))) {
--		clar_print_onabort("Failed to open the summary file\n");
--		exit(-1);
--	}
-+	if (_clar.write_summary)
-+	    _clar.summary = clar_summary_init(_clar.summary_filename);
- 
--	if (clar_sandbox() < 0) {
--		clar_print_onabort("Failed to sandbox the test runner.\n");
--		exit(-1);
--	}
-+	clar_sandbox();
- }
- 
- int
-@@ -615,10 +625,9 @@ clar_test_shutdown(void)
- 
- 	clar_unsandbox();
- 
--	if (_clar.write_summary && clar_summary_shutdown(_clar.summary) < 0) {
--		clar_print_onabort("Failed to write the summary file\n");
--		exit(-1);
--	}
-+	if (_clar.write_summary && clar_summary_shutdown(_clar.summary) < 0)
-+		clar_abort("Failed to write the summary file '%s: %s.\n",
-+			   _clar.summary_filename, strerror(errno));
- 
- 	for (explicit = _clar.explicit; explicit; explicit = explicit_next) {
- 		explicit_next = explicit->next;
-@@ -649,7 +658,7 @@ static void abort_test(void)
- {
- 	if (!_clar.trampoline_enabled) {
- 		clar_print_onabort(
--				"Fatal error: a cleanup method raised an exception.");
-+				"Fatal error: a cleanup method raised an exception.\n");
- 		clar_report_errors(_clar.last_report);
- 		exit(-1);
- 	}
-@@ -673,7 +682,10 @@ void clar__fail(
- 	const char *description,
- 	int should_abort)
- {
--	struct clar_error *error = calloc(1, sizeof(struct clar_error));
-+	struct clar_error *error;
-+
-+	if ((error = calloc(1, sizeof(*error))) == NULL)
-+		clar_abort("Failed to allocate error.\n");
- 
- 	if (_clar.last_report->errors == NULL)
- 		_clar.last_report->errors = error;
-@@ -688,8 +700,9 @@ void clar__fail(
- 	error->line_number = line;
- 	error->error_msg = error_msg;
- 
--	if (description != NULL)
--		error->description = strdup(description);
-+	if (description != NULL &&
-+	    (error->description = strdup(description)) == NULL)
-+		clar_abort("Failed to allocate description.\n");
- 
- 	_clar.total_errors++;
- 	_clar.last_report->status = CL_TEST_FAILURE;
-@@ -763,6 +776,7 @@ void clar__assert_equal(
- 			}
- 		}
- 	}
-+#ifdef CLAR_HAVE_WCHAR
- 	else if (!strcmp("%ls", fmt)) {
- 		const wchar_t *wcs1 = va_arg(args, const wchar_t *);
- 		const wchar_t *wcs2 = va_arg(args, const wchar_t *);
-@@ -798,8 +812,9 @@ void clar__assert_equal(
- 			}
- 		}
- 	}
--	else if (!strcmp("%"PRIuZ, fmt) || !strcmp("%"PRIxZ, fmt)) {
--		size_t sz1 = va_arg(args, size_t), sz2 = va_arg(args, size_t);
-+#endif /* CLAR_HAVE_WCHAR */
-+	else if (!strcmp("%"PRIuMAX, fmt) || !strcmp("%"PRIxMAX, fmt)) {
-+		uintmax_t sz1 = va_arg(args, uintmax_t), sz2 = va_arg(args, uintmax_t);
- 		is_equal = (sz1 == sz2);
- 		if (!is_equal) {
- 			int offset = p_snprintf(buf, sizeof(buf), fmt, sz1);
-diff --git a/t/unit-tests/clar/clar/print.h b/t/unit-tests/clar/clar/print.h
-index c17e2f693b..69d0ee967e 100644
---- a/t/unit-tests/clar/clar/print.h
-+++ b/t/unit-tests/clar/clar/print.h
-@@ -21,7 +21,7 @@ static void clar_print_clap_error(int num, const struct clar_report *report, con
- {
- 	printf("  %d) Failure:\n", num);
- 
--	printf("%s::%s [%s:%"PRIuZ"]\n",
-+	printf("%s::%s [%s:%"PRIuMAX"]\n",
- 		report->suite,
- 		report->test,
- 		error->file,
-@@ -136,7 +136,7 @@ static void clar_print_tap_ontest(const char *suite_name, const char *test_name,
- 
- 		printf("    at:\n");
- 		printf("      file: '"); print_escaped(error->file); printf("'\n");
--		printf("      line: %" PRIuZ "\n", error->line_number);
-+		printf("      line: %" PRIuMAX "\n", error->line_number);
- 		printf("      function: '%s'\n", error->function);
- 		printf("    ---\n");
- 
-@@ -202,10 +202,15 @@ static void clar_print_onsuite(const char *suite_name, int suite_index)
- 	PRINT(onsuite, suite_name, suite_index);
- }
- 
-+static void clar_print_onabortv(const char *msg, va_list argp)
-+{
-+	PRINT(onabort, msg, argp);
-+}
-+
- static void clar_print_onabort(const char *msg, ...)
- {
- 	va_list argp;
- 	va_start(argp, msg);
--	PRINT(onabort, msg, argp);
-+	clar_print_onabortv(msg, argp);
- 	va_end(argp);
- }
-diff --git a/t/unit-tests/clar/clar/sandbox.h b/t/unit-tests/clar/clar/sandbox.h
-index e25057b7c4..bc960f50e0 100644
---- a/t/unit-tests/clar/clar/sandbox.h
-+++ b/t/unit-tests/clar/clar/sandbox.h
-@@ -122,14 +122,14 @@ static int build_sandbox_path(void)
- 
- 	if (mkdir(_clar_path, 0700) != 0)
- 		return -1;
--#elif defined(__TANDEM)
--	if (mktemp(_clar_path) == NULL)
-+#elif defined(_WIN32)
-+	if (_mktemp_s(_clar_path, sizeof(_clar_path)) != 0)
- 		return -1;
- 
- 	if (mkdir(_clar_path, 0700) != 0)
- 		return -1;
--#elif defined(_WIN32)
--	if (_mktemp_s(_clar_path, sizeof(_clar_path)) != 0)
-+#elif defined(__sun) || defined(__TANDEM)
-+	if (mktemp(_clar_path) == NULL)
- 		return -1;
- 
- 	if (mkdir(_clar_path, 0700) != 0)
-@@ -142,15 +142,14 @@ static int build_sandbox_path(void)
- 	return 0;
- }
- 
--static int clar_sandbox(void)
-+static void clar_sandbox(void)
- {
- 	if (_clar_path[0] == '\0' && build_sandbox_path() < 0)
--		return -1;
-+		clar_abort("Failed to build sandbox path.\n");
- 
- 	if (chdir(_clar_path) != 0)
--		return -1;
--
--	return 0;
-+		clar_abort("Failed to change into sandbox directory '%s': %s.\n",
-+			   _clar_path, strerror(errno));
- }
- 
- const char *clar_sandbox_path(void)
-diff --git a/t/unit-tests/clar/clar/summary.h b/t/unit-tests/clar/clar/summary.h
-index 4dd352e28b..0d0b646fe7 100644
---- a/t/unit-tests/clar/clar/summary.h
-+++ b/t/unit-tests/clar/clar/summary.h
-@@ -66,16 +66,12 @@ struct clar_summary *clar_summary_init(const char *filename)
- 	struct clar_summary *summary;
- 	FILE *fp;
- 
--	if ((fp = fopen(filename, "w")) == NULL) {
--		perror("fopen");
--		return NULL;
--	}
-+	if ((fp = fopen(filename, "w")) == NULL)
-+		clar_abort("Failed to open the summary file '%s': %s.\n",
-+			   filename, strerror(errno));
- 
--	if ((summary = malloc(sizeof(struct clar_summary))) == NULL) {
--		perror("malloc");
--		fclose(fp);
--		return NULL;
--	}
-+	if ((summary = malloc(sizeof(struct clar_summary))) == NULL)
-+		clar_abort("Failed to allocate summary.\n");
- 
- 	summary->filename = filename;
- 	summary->fp = fp;
-diff --git a/t/unit-tests/clar/test/.gitignore b/t/unit-tests/clar/test/.gitignore
-deleted file mode 100644
-index a477d0c40c..0000000000
---- a/t/unit-tests/clar/test/.gitignore
-+++ /dev/null
-@@ -1,4 +0,0 @@
--clar.suite
--.clarcache
--clar_test
--*.o
-diff --git a/t/unit-tests/clar/test/CMakeLists.txt b/t/unit-tests/clar/test/CMakeLists.txt
-new file mode 100644
-index 0000000000..7f2c1dc17a
---- /dev/null
-+++ b/t/unit-tests/clar/test/CMakeLists.txt
-@@ -0,0 +1,39 @@
-+find_package(Python COMPONENTS Interpreter REQUIRED)
-+
-+add_custom_command(OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/clar.suite"
-+	COMMAND "${Python_EXECUTABLE}" "${CMAKE_SOURCE_DIR}/generate.py" --output "${CMAKE_CURRENT_BINARY_DIR}"
-+	DEPENDS main.c sample.c clar_test.h
-+	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
-+)
-+
-+add_executable(clar_test)
-+set_target_properties(clar_test PROPERTIES
-+	C_STANDARD 90
-+	C_STANDARD_REQUIRED ON
-+	C_EXTENSIONS OFF
-+)
-+
-+# MSVC generates all kinds of warnings. We may want to fix these in the future
-+# and then unconditionally treat warnings as errors.
-+if(NOT MSVC)
-+	set_target_properties(clar_test PROPERTIES
-+		COMPILE_WARNING_AS_ERROR ON
-+	)
-+endif()
-+
-+target_sources(clar_test PRIVATE
-+	main.c
-+	sample.c
-+	"${CMAKE_CURRENT_BINARY_DIR}/clar.suite"
-+)
-+target_compile_definitions(clar_test PRIVATE
-+	CLAR_FIXTURE_PATH="${CMAKE_CURRENT_SOURCE_DIR}/resources/"
-+)
-+target_compile_options(clar_test PRIVATE
-+	$<IF:$<CXX_COMPILER_ID:MSVC>,/W4,-Wall>
-+)
-+target_include_directories(clar_test PRIVATE
-+	"${CMAKE_SOURCE_DIR}"
-+	"${CMAKE_CURRENT_BINARY_DIR}"
-+)
-+target_link_libraries(clar_test clar)
-diff --git a/t/unit-tests/clar/test/Makefile b/t/unit-tests/clar/test/Makefile
-deleted file mode 100644
-index 93c6b2ad32..0000000000
---- a/t/unit-tests/clar/test/Makefile
-+++ /dev/null
-@@ -1,39 +0,0 @@
--#
--# Copyright (c) Vicent Marti. All rights reserved.
--#
--# This file is part of clar, distributed under the ISC license.
--# For full terms see the included COPYING file.
--#
--
--#
--# Set up the path to the clar sources and to the fixtures directory
--#
--# The fixture path needs to be an absolute path so it can be used
--# even after we have chdir'ed into the test directory while testing.
--#
--CURRENT_MAKEFILE  := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
--TEST_DIRECTORY    := $(abspath $(dir $(CURRENT_MAKEFILE)))
--CLAR_PATH         := $(dir $(TEST_DIRECTORY))
--CLAR_FIXTURE_PATH := $(TEST_DIRECTORY)/resources/
--
--CFLAGS=-g -I.. -I. -Wall -DCLAR_FIXTURE_PATH=\"$(CLAR_FIXTURE_PATH)\"
--
--.PHONY: clean
--
--# list the objects that go into our test
--objects = main.o sample.o
--
--# build the test executable itself
--clar_test: $(objects) clar_test.h clar.suite $(CLAR_PATH)clar.c
--	$(CC) $(CFLAGS) -o $@ "$(CLAR_PATH)clar.c" $(objects)
--
--# test object files depend on clar macros
--$(objects) : $(CLAR_PATH)clar.h
--
--# build the clar.suite file of test metadata
--clar.suite:
--	python "$(CLAR_PATH)generate.py" .
--
--# remove all generated files
--clean:
--	$(RM) -rf *.o clar.suite .clarcache clar_test clar_test.dSYM
-
-base-commit: 777489f9e09c8d0dd6b12f9d90de6376330577a2
--- 
-An old man doll... just what I always wanted! - Clara
-
diff --git a/package/git/0002-Makefile-adjust-sed-command-for-generating-clar-decl.patch b/package/git/0002-Makefile-adjust-sed-command-for-generating-clar-decl.patch
deleted file mode 100644
index 05a541a3e5..0000000000
--- a/package/git/0002-Makefile-adjust-sed-command-for-generating-clar-decl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From bcc172473a7f24c0598853c8ae555b6efaeb2fd2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Alejandro=20R=2E=20Sede=C3=B1o?= <asedeno@mit.edu>
-Date: Mon, 21 Oct 2024 12:56:35 +0200
-Subject: [PATCH] Makefile: adjust sed command for generating
- "clar-decls.h"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This moves the end-of-line marker out of the captured group, matching
-the start-of-line marker and for some reason fixing generation of
-"clar-decls.h" on some older, more esoteric platforms.
-
-Signed-off-by: Alejandro R. Sedeño <asedeno@mit.edu>
-Signed-off-by: Patrick Steinhardt <ps@pks.im>
-Upstream: https://lore.kernel.org/r/17d77f36d41fb2928565a4922eab3a67426d2da6.1729506329.git.ps@pks.im
-Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 2dde1fd2b8..87c1f9e220 100644
---- a/Makefile
-+++ b/Makefile
-@@ -3906,7 +3906,7 @@ GIT-TEST-SUITES: FORCE
- 
- $(UNIT_TEST_DIR)/clar-decls.h: $(patsubst %,$(UNIT_TEST_DIR)/%.c,$(CLAR_TEST_SUITES)) GIT-TEST-SUITES
- 	$(QUIET_GEN)for suite in $(CLAR_TEST_SUITES); do \
--		sed -ne "s/^\(void test_$${suite}__[a-zA-Z_0-9][a-zA-Z_0-9]*(void)$$\)/extern \1;/p" $(UNIT_TEST_DIR)/$$suite.c; \
-+		sed -ne "s/^\(void test_$${suite}__[a-zA-Z_0-9][a-zA-Z_0-9]*(void)\)$$/extern \1;/p" $(UNIT_TEST_DIR)/$$suite.c; \
- 	done >$@
- $(UNIT_TEST_DIR)/clar.suite: $(UNIT_TEST_DIR)/clar-decls.h
- 	$(QUIET_GEN)awk -f $(UNIT_TEST_DIR)/clar-generate.awk $< >$(UNIT_TEST_DIR)/clar.suite
--- 
-An old man doll... just what I always wanted! - Clara
-
diff --git a/package/git/0003-Makefile-extract-script-to-generate-clar-declaration.patch b/package/git/0003-Makefile-extract-script-to-generate-clar-declaration.patch
deleted file mode 100644
index 58f41f7189..0000000000
--- a/package/git/0003-Makefile-extract-script-to-generate-clar-declaration.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4e5e8a0822db050c31b3cdd5ae00c37f4a8a063e Mon Sep 17 00:00:00 2001
-From: Patrick Steinhardt <ps@pks.im>
-Date: Mon, 21 Oct 2024 12:56:38 +0200
-Subject: [PATCH] Makefile: extract script to generate clar declarations
-
-Extract the script to generate function declarations for the clar unit
-testing framework into a standalone script. This is done such that we
-can reuse it in other build systems.
-
-Signed-off-by: Patrick Steinhardt <ps@pks.im>
-Upstream: https://lore.kernel.org/r/c2e3fbcd8532038158a0ead6f0a2f752f557ab7f.1729506329.git.ps@pks.im
-Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
----
- Makefile                            |  4 +---
- t/unit-tests/generate-clar-decls.sh | 16 ++++++++++++++++
- 2 files changed, 17 insertions(+), 3 deletions(-)
- create mode 100755 t/unit-tests/generate-clar-decls.sh
-
-diff --git a/Makefile b/Makefile
-index 87c1f9e220..a58dcab954 100644
---- a/Makefile
-+++ b/Makefile
-@@ -3905,9 +3905,7 @@ GIT-TEST-SUITES: FORCE
-             fi
- 
- $(UNIT_TEST_DIR)/clar-decls.h: $(patsubst %,$(UNIT_TEST_DIR)/%.c,$(CLAR_TEST_SUITES)) GIT-TEST-SUITES
--	$(QUIET_GEN)for suite in $(CLAR_TEST_SUITES); do \
--		sed -ne "s/^\(void test_$${suite}__[a-zA-Z_0-9][a-zA-Z_0-9]*(void)\)$$/extern \1;/p" $(UNIT_TEST_DIR)/$$suite.c; \
--	done >$@
-+	$(QUIET_GEN)$(SHELL_PATH) $(UNIT_TEST_DIR)/generate-clar-decls.sh "$@" $(filter %.c,$^)
- $(UNIT_TEST_DIR)/clar.suite: $(UNIT_TEST_DIR)/clar-decls.h
- 	$(QUIET_GEN)awk -f $(UNIT_TEST_DIR)/clar-generate.awk $< >$(UNIT_TEST_DIR)/clar.suite
- $(CLAR_TEST_OBJS): $(UNIT_TEST_DIR)/clar-decls.h
-diff --git a/t/unit-tests/generate-clar-decls.sh b/t/unit-tests/generate-clar-decls.sh
-new file mode 100755
-index 0000000000..688e0885f4
---- /dev/null
-+++ b/t/unit-tests/generate-clar-decls.sh
-@@ -0,0 +1,16 @@
-+#!/bin/sh
-+
-+if test $# -lt 2
-+then
-+	echo "USAGE: $0 <OUTPUT> <SUITE>..." 2>&1
-+	exit 1
-+fi
-+
-+OUTPUT="$1"
-+shift
-+
-+for suite in "$@"
-+do
-+	sed -ne "s/^\(void test_$(basename "${suite%.c}")__[a-zA-Z_0-9][a-zA-Z_0-9]*(void)\)$/extern \1;/p" "$suite" ||
-+	exit 1
-+done >"$OUTPUT"
--- 
-An old man doll... just what I always wanted! - Clara
-
diff --git a/package/git/0004-cmake-fix-compilation-of-clar-based-unit-tests.patch b/package/git/0004-cmake-fix-compilation-of-clar-based-unit-tests.patch
deleted file mode 100644
index 552eb0c813..0000000000
--- a/package/git/0004-cmake-fix-compilation-of-clar-based-unit-tests.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From beb7761f4fbc6b71ec6357d56575f57fd2b4c8a9 Mon Sep 17 00:00:00 2001
-From: Patrick Steinhardt <ps@pks.im>
-Date: Mon, 21 Oct 2024 12:56:41 +0200
-Subject: [PATCH] cmake: fix compilation of clar-based unit tests
-
-The compilation of clar-based unit tests is broken because we do not
-add the binary directory into which we generate the "clar-decls.h" and
-"clar.suite" files as include directories. Instead, we accidentally set
-up the source directory as include directory.
-
-Fix this by including the binary directory instead of the source
-directory. Furthermore, set up the include directories as PUBLIC instead
-of PRIVATE such that they propagate from "unit-tests.lib" to the
-"unit-tests" executable, which needs to include the same directory.
-
-Reported-by: Ed Reel <edreel@gmail.com>
-Signed-off-by: Patrick Steinhardt <ps@pks.im>
-Upstream: https://lore.kernel.org/r/a30017a4d8998e85915d959c16f181a8d4e813f2.1729506329.git.ps@pks.im
-Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
----
- contrib/buildsystems/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/contrib/buildsystems/CMakeLists.txt b/contrib/buildsystems/CMakeLists.txt
-index 62af7b33d2..093852ad9d 100644
---- a/contrib/buildsystems/CMakeLists.txt
-+++ b/contrib/buildsystems/CMakeLists.txt
-@@ -1042,7 +1042,7 @@ file(WRITE "${CMAKE_BINARY_DIR}/t/unit-tests/clar.suite" "${clar_decls}" "${clar
- list(TRANSFORM clar_test_SUITES PREPEND "${CMAKE_SOURCE_DIR}/t/unit-tests/")
- list(TRANSFORM clar_test_SUITES APPEND ".c")
- add_library(unit-tests-lib ${clar_test_SUITES} "${CMAKE_SOURCE_DIR}/t/unit-tests/clar/clar.c")
--target_include_directories(unit-tests-lib PRIVATE "${CMAKE_SOURCE_DIR}/t/unit-tests")
-+target_include_directories(unit-tests-lib PUBLIC "${CMAKE_BINARY_DIR}/t/unit-tests")
- add_executable(unit-tests "${CMAKE_SOURCE_DIR}/t/unit-tests/unit-test.c")
- target_link_libraries(unit-tests unit-tests-lib common-main)
- set_target_properties(unit-tests
--- 
-An old man doll... just what I always wanted! - Clara
-
diff --git a/package/git/0005-cmake-set-up-proper-dependencies-for-generated-clar-.patch b/package/git/0005-cmake-set-up-proper-dependencies-for-generated-clar-.patch
deleted file mode 100644
index c9310a9394..0000000000
--- a/package/git/0005-cmake-set-up-proper-dependencies-for-generated-clar-.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 65d840b397f23ccbc578c15ee7a2dae1a7d1bfc8 Mon Sep 17 00:00:00 2001
-From: Patrick Steinhardt <ps@pks.im>
-Date: Mon, 21 Oct 2024 12:56:44 +0200
-Subject: [PATCH] cmake: set up proper dependencies for generated clar
- headers
-
-The auto-generated headers used by clar are written at configure time
-and thus do not get regenerated automatically. Refactor the build
-recipes such that we use custom commands instead, which also has the
-benefit that we can reuse the same infrastructure as our Makefile.
-
-Signed-off-by: Patrick Steinhardt <ps@pks.im>
-Upstream: https://lore.kernel.org/r/bb005979e7eb335b0178094251b5c37682d7d47b.1729506329.git.ps@pks.im
-Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
----
- contrib/buildsystems/CMakeLists.txt | 50 +++++++----------------------
- 1 file changed, 12 insertions(+), 38 deletions(-)
-
-diff --git a/contrib/buildsystems/CMakeLists.txt b/contrib/buildsystems/CMakeLists.txt
-index 093852ad9d..9f80ab9265 100644
---- a/contrib/buildsystems/CMakeLists.txt
-+++ b/contrib/buildsystems/CMakeLists.txt
-@@ -1002,46 +1002,20 @@ foreach(unit_test ${unit_test_PROGRAMS})
- endforeach()
- 
- parse_makefile_for_scripts(clar_test_SUITES "CLAR_TEST_SUITES" "")
--
--set(clar_decls "")
--set(clar_cbs "")
--set(clar_cbs_count 0)
--set(clar_suites "static struct clar_suite _clar_suites[] = {\n")
--list(LENGTH clar_test_SUITES clar_suites_count)
--foreach(suite ${clar_test_SUITES})
--	file(STRINGS "${CMAKE_SOURCE_DIR}/t/unit-tests/${suite}.c" decls
--		REGEX "^void test_${suite}__[a-zA-Z_0-9][a-zA-Z_0-9]*\\(void\\)$")
--
--	list(LENGTH decls decls_count)
--	string(REGEX REPLACE "void (test_${suite}__([a-zA-Z_0-9]*))\\(void\\)" "    { \"\\2\", &\\1 },\n" cbs ${decls})
--	string(JOIN "" cbs ${cbs})
--	list(TRANSFORM decls PREPEND "extern ")
--	string(JOIN ";\n" decls ${decls})
--
--	string(APPEND clar_decls "${decls};\n")
--	string(APPEND clar_cbs
--		"static const struct clar_func _clar_cb_${suite}[] = {\n"
--		${cbs}
--		"};\n")
--	string(APPEND clar_suites
--		"    {\n"
--		"        \"${suite}\",\n"
--		"        { NULL, NULL },\n"
--		"        { NULL, NULL },\n"
--		"        _clar_cb_${suite}, ${decls_count}, 1\n"
--		"    },\n")
--	math(EXPR clar_cbs_count "${clar_cbs_count}+${decls_count}")
--endforeach()
--string(APPEND clar_suites
--	"};\n"
--	"static const size_t _clar_suite_count = ${clar_suites_count};\n"
--	"static const size_t _clar_callback_count = ${clar_cbs_count};\n")
--file(WRITE "${CMAKE_BINARY_DIR}/t/unit-tests/clar-decls.h" "${clar_decls}")
--file(WRITE "${CMAKE_BINARY_DIR}/t/unit-tests/clar.suite" "${clar_decls}" "${clar_cbs}" "${clar_suites}")
--
- list(TRANSFORM clar_test_SUITES PREPEND "${CMAKE_SOURCE_DIR}/t/unit-tests/")
- list(TRANSFORM clar_test_SUITES APPEND ".c")
--add_library(unit-tests-lib ${clar_test_SUITES} "${CMAKE_SOURCE_DIR}/t/unit-tests/clar/clar.c")
-+add_custom_command(OUTPUT "${CMAKE_BINARY_DIR}/t/unit-tests/clar-decls.h"
-+	COMMAND ${CMAKE_SOURCE_DIR}/t/unit-tests/generate-clar-decls.sh "${CMAKE_BINARY_DIR}/t/unit-tests/clar-decls.h" ${clar_test_SUITES}
-+	DEPENDS ${CMAKE_SOURCE_DIR}/t/unit-tests/generate-clar-decls.sh ${clar_test_SUITES})
-+add_custom_command(OUTPUT "${CMAKE_BINARY_DIR}/t/unit-tests/clar.suite"
-+	COMMAND awk -f "${CMAKE_SOURCE_DIR}/t/unit-tests/clar-generate.awk" "${CMAKE_BINARY_DIR}/t/unit-tests/clar-decls.h" > "${CMAKE_BINARY_DIR}/t/unit-tests/clar.suite"
-+	DEPENDS "${CMAKE_SOURCE_DIR}/t/unit-tests/clar-generate.awk" "${CMAKE_BINARY_DIR}/t/unit-tests/clar-decls.h")
-+
-+add_library(unit-tests-lib ${clar_test_SUITES}
-+	"${CMAKE_SOURCE_DIR}/t/unit-tests/clar/clar.c"
-+	"${CMAKE_BINARY_DIR}/t/unit-tests/clar-decls.h"
-+	"${CMAKE_BINARY_DIR}/t/unit-tests/clar.suite"
-+)
- target_include_directories(unit-tests-lib PUBLIC "${CMAKE_BINARY_DIR}/t/unit-tests")
- add_executable(unit-tests "${CMAKE_SOURCE_DIR}/t/unit-tests/unit-test.c")
- target_link_libraries(unit-tests unit-tests-lib common-main)
--- 
-An old man doll... just what I always wanted! - Clara
-
diff --git a/package/git/git.hash b/package/git/git.hash
index c290ebe6bd..7608cbe176 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  1ce114da88704271b43e027c51e04d9399f8c88e9ef7542dae7aebae7d87bc4e  git-2.47.0.tar.xz
+sha256  1c5d545f5dc1eb51e95d2c50d98fdf88b1a36ba1fa30e9ae5d5385c6024f82ad  git-2.48.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index bc17c9a993..de3103f4ff 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.47.0
+GIT_VERSION = 2.48.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

--===============6778361975013769957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6778361975013769957==--
