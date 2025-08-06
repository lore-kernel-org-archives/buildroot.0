Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5637BC87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 12:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DEFF83DFE;
	Wed,  6 Aug 2025 12:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0nqM2xyQ-pC; Wed,  6 Aug 2025 12:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B61283E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B61283E11;
	Wed,  6 Aug 2025 12:59:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFAFD84
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ACDD845BE
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fawYdf-LXNiu for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 12:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C47C84585
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C47C84585
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AA1A86F28; Wed,  6 Aug 2025 12:59:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Aug 2025 14:54:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fd520c8d52b9e0ed5e26343813fdd8dbcadb45f
X-Git-Newrev: 8083972a9098d174f3f7e1be007a55b134864cd8
X-Patchwork-Hint: ignore
Message-Id: <20250806125918.0AA1A86F28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: security bump to v0.11.2
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
Content-Type: multipart/mixed; boundary="===============7064595510259143231=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7064595510259143231==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8083972a9098d174f3f7e1be007a55b134864cd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For more information on the release see:
  - https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.11.2

This fixes the following vulnerabilities:

- CVE-2025-4878

    A vulnerability was found in libssh, where an uninitialized variable
    exists under certain conditions in the privatekey_from_file()
    function. This flaw can be triggered if the file specified by the
    filename doesn't exist and may lead to possible signing failures or
    heap corruption.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-4878
  - https://git.libssh.org/projects/libssh.git/commit/?id=697650caa97eaf7623924c75f9fcfec6dd423cd1
  - https://git.libssh.org/projects/libssh.git/commit/?id=b35ee876adc92a208d47194772e99f9c71e0bedb

- CVE-2025-5318

    A flaw was found in the libssh library. An out-of-bounds read can be
    triggered in the sftp_handle function due to an incorrect comparison
    check that permits the function to access memory beyond the valid
    handle list and to return an invalid pointer, which is used in further
    processing. This vulnerability allows an authenticated remote attacker
    to potentially read unintended memory regions, exposing sensitive
    information or affect service behavior.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-5318
  - https://www.libssh.org/security/advisories/CVE-2025-5318.txt

- CVE-2025-5351

    A flaw was found in the key export functionality of libssh. The issue
    occurs in the internal function responsible for converting
    cryptographic keys into serialized formats. During error handling, a
    memory structure is freed but not cleared, leading to a potential
    double free issue if an additional failure occurs later in the
    function. This condition may result in heap corruption or application
    instability in low-memory scenarios, posing a risk to system
    reliability where key export operations are performed.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-5351

- CVE-2025-5372

    A flaw was found in libssh versions built with OpenSSL versions older
    than 3.0, specifically in the ssh_kdf() function responsible for key
    derivation. Due to inconsistent interpretation of return values where
    OpenSSL uses 0 to indicate failure and libssh uses 0 for success—the
    function may mistakenly return a success status even when key
    derivation fails. This results in uninitialized cryptographic key
    buffers being used in subsequent communication, potentially
    compromising SSH sessions' confidentiality, integrity, and
    availability.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-5372

- CVE-2025-5449

    A flaw was found in the SFTP server message decoding logic of libssh.
    The issue occurs due to an incorrect packet length check that allows
    an integer overflow when handling large payload sizes on 32-bit
    systems. This issue leads to failed memory allocation and causes the
    server process to crash, resulting in a denial of service.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-5449
  - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=261612179f740bc62ba363d98b3bd5e5573a811f
  - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=3443aec90188d6aab9282afc80a81df5ab72c4da
  - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=5504ff40515439a5fecbb17da7483000c4d12eb7
  - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=78485f446af9b30e37eb8f177b81940710d54496
  - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=f79ec51b7fd519dbc5737a7ba826e3ed093f6ceb
  - https://www.libssh.org/security/advisories/CVE-2025-5449.txt

- CVE-2025-5987

    A flaw was found in libssh when using the ChaCha20 cipher with the
    OpenSSL library. If an attacker manages to exhaust the heap space,
    this error is not detected and may lead to libssh using a partially
    initialized cipher context. This occurs because the OpenSSL error code
    returned aliases with the SSH_OK code, resulting in libssh not
    properly detecting the error returned by the OpenSSL library. This
    issue can lead to undefined behavior, including compromised data
    confidentiality and integrity or crashes.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-5987

The patch 0001 is removed as it's now included upstream see [1].

[1] https://gitlab.com/libssh/libssh-mirror/-/commit/093431f929ec8c36d5941bfdc0b2d3b68404a2aa
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Only-enable-CXX-when-running-the-coverage.patch | 57 ----------------------
 package/libssh/libssh.hash                         |  4 +-
 package/libssh/libssh.mk                           |  2 +-
 3 files changed, 3 insertions(+), 60 deletions(-)

diff --git a/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
deleted file mode 100644
index c1f39b7d9a..0000000000
--- a/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 328ae3d2306c9f65b5e85a2be98a368c07287a05 Mon Sep 17 00:00:00 2001
-From: Thomas Perale <thomas.perale@mind.be>
-Date: Sat, 14 Sep 2024 21:07:30 +0200
-Subject: [PATCH] cmake: Only enable CXX when running the coverage
-
-Commit 25a678190c42b24076fdd805a8d7a722a8a9c798 introduced code coverage
-collection. That also introduced a dependency to CXX language.
-
-When cross-compiling libssh in an environment that doesn't have a C++ compiler
-the following error is raised: "No CMAKE_CXX_COMPILER could be found.".
-
-Since the C++ part is only needed for the coverage part, this commit only enable
-that language dependency when actually needing it.
-
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
-Upstream: https://gitlab.com/libssh/libssh-mirror/-/merge_requests/537
----
- CMakeLists.txt                    | 3 ++-
- cmake/Modules/AddCMockaTest.cmake | 1 +
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 13330ea3..5595a47a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -9,7 +9,7 @@ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
- include(DefineCMakeDefaults)
- include(DefineCompilerFlags)
- 
--project(libssh VERSION 0.11.1 LANGUAGES C CXX)
-+project(libssh VERSION 0.11.1 LANGUAGES C)
- 
- # global needed variable
- set(APPLICATION_NAME ${PROJECT_NAME})
-@@ -190,6 +190,7 @@ endif (WITH_SYMBOL_VERSIONING AND ABIMAP_FOUND)
- 
- # Coverage
- if (WITH_COVERAGE)
-+    ENABLE_LANGUAGE(CXX)
-     include(CodeCoverage)
-     setup_target_for_coverage_lcov(
-         NAME "coverage"
-diff --git a/cmake/Modules/AddCMockaTest.cmake b/cmake/Modules/AddCMockaTest.cmake
-index 79178183..f49961ba 100644
---- a/cmake/Modules/AddCMockaTest.cmake
-+++ b/cmake/Modules/AddCMockaTest.cmake
-@@ -117,6 +117,7 @@ function(ADD_CMOCKA_TEST _TARGET_NAME)
-         ${TARGET_SYSTEM_EMULATOR} ${_TARGET_NAME}
-     )
-     if (WITH_COVERAGE)
-+        ENABLE_LANGUAGE(CXX)
-         include(CodeCoverage)
-         append_coverage_compiler_flags_to_target(${_TARGET_NAME})
-     endif (WITH_COVERAGE)
--- 
-2.46.0
-
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index b131557ee8..161d5b1e58 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.1.tar.xz.asc
+# https://www.libssh.org/files/0.11/libssh-0.11.2.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  14b7dcc72e91e08151c58b981a7b570ab2663f630e7d2837645d5a9c612c1b79  libssh-0.11.1.tar.xz
+sha256  69529fc18f5b601f0baf0e5a4501a2bc26df5e2f116f5f8f07f19fafaa6d04e7  libssh-0.11.2.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index a00e6a9445..7bcf077929 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).2
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1

--===============7064595510259143231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7064595510259143231==--
