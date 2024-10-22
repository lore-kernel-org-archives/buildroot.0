Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE44CDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C1F607A5;
	Tue, 22 Oct 2024 21:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLj6fdhe-RVB; Tue, 22 Oct 2024 21:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96EE160681
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96EE160681;
	Tue, 22 Oct 2024 21:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC2A2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A93B780573
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imbL2q00VLNu for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA9080530
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FA9080530
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89E4086242; Tue, 22 Oct 2024 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 22:57:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 908ba9d637975b820eaf1299d1adbdeb0daf9c6f
X-Git-Newrev: 05277a55c1e8bcf6eb1e2f4c631881c99d038226
X-Patchwork-Hint: ignore
Message-Id: <20241022210242.89E4086242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeltrace2: bump to version 2.0.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=05277a55c1e8bcf6eb1e2f4c631881c99d038226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2024-03-28 Babeltrace 2.0.6 (Respect Your Cat Day)
	* bt2: disable some warnings for `native_bt.c`
	* bt2: compile `native_bt.c` with `-Wno-undef`
	* Fix: src.ctf.lttng-live: expect NEW_STREAM/METADATA for inactive streams
	* Fix: `babeltrace2 convert`: don't consider the `--plugin-path` opt.
	* include/babeltrace2/plugin/plugin-dev.h: "define" -> "definition
	* Fix: doc: escape double quote in bt_p alias
	* Fix: bt2: pass _TraceClassConst to destruction listeners
	* fix: 'load_module()' deprecated in Python 3.12
	* tests: retry os.rename on PermissionError failure in lttng_live_server.py
	* doc: fix uptream -> upstream typos
	* fix: test_message_iterator.py hangs on Python 3.12
	* plugin-dev: mark symbols meant to be public with __attribute__((visibility("default")))
	* Silence -Wunused-but-set-variable error with clang
	* Fix: Windows DLL path lookup with Python >= 3.8
	* doc/man: make default values of boolean init. params. clearer
	* RFC: docs: fix: Match stated automake requirement
	* fix: make flake8 6.x happy
	* fix: running black on python 3.11
	* bt_query_executor_create_with_method_data(): fix docs note
	* Fix: ctf-writer: null dereference in bt_ctf_trace_common_add_stream_class
	* Update working version to Babeltrace v2.0.6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-simplify-warning-flags-detection.patch  | 14 ++++++++------
 package/babeltrace2/babeltrace2.hash                       |  2 +-
 package/babeltrace2/babeltrace2.mk                         |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch b/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
index ec7ea83ffd..bd61843acf 100644
--- a/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
+++ b/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
@@ -40,6 +40,8 @@ Reviewed-by: Michael Jeanson <mjeanson@efficios.com>
 [Retrieved from:
 https://github.com/efficios/babeltrace/commit/28ba44ad9ca14153e96c94a9100423ea224c1af3]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: adapt to 2.0.6]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac                    |  74 +++++++++------
  m4/ax_compiler_flags.m4         | 158 -------------------------------
@@ -56,7 +58,7 @@ diff --git a/configure.ac b/configure.ac
 index 055fba101..7ebcf2ad4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -660,25 +660,35 @@ target.
+@@ -694,25 +694,35 @@
  CFLAGS=${save_CFLAGS}
  
  # Detect C and LD warning flags supported by the compiler.
@@ -110,14 +112,11 @@ index 055fba101..7ebcf2ad4 100644
  		dnl
  		dnl Some versions of SWIG (like 3.0.12) generate code that produces
  		dnl -Wcast-function-type warnings.  This warning is present in gcc >= 8.  This
-@@ -692,24 +702,32 @@ AX_COMPILER_FLAGS(
- 		dnl
+@@ -727,24 +737,32 @@
  		dnl Ref: https://github.com/swig/swig/issues/1259
  		-Wno-cast-function-type dnl
+ 		-Wno-suggest-attribute=format dnl
 -	])
--
--# CFLAGS from AX_COMPILER_FLAGS.
--AM_CFLAGS="${AM_CFLAGS} ${WARN_CFLAGS}"
 +		-Wno-missing-field-initializers dnl
 +	],
 +	[WARN_CFLAGS],
@@ -131,6 +130,9 @@ index 055fba101..7ebcf2ad4 100644
 +	[WARN_CFLAGS="${WARN_CFLAGS} -Werror"]
 +)
  
+-# CFLAGS from AX_COMPILER_FLAGS.
+-AM_CFLAGS="${AM_CFLAGS} ${WARN_CFLAGS}"
+-
 -# The test used in AX_COMPILER_FLAGS, generated using AC_LANG_PROGRAM, is
 +# The test used in AX_APPEND_COMPILE_FLAGS, generated using AC_LANG_PROGRAM, is
  # written in such a way that it triggers a -Wold-style-definition warning.  So
diff --git a/package/babeltrace2/babeltrace2.hash b/package/babeltrace2/babeltrace2.hash
index 164e65cded..3caf52a792 100644
--- a/package/babeltrace2/babeltrace2.hash
+++ b/package/babeltrace2/babeltrace2.hash
@@ -1,5 +1,5 @@
 # From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.4.tar.bz2.sha256
-sha256  774f116685dab5db9c51577dde43c8c1df482aae6bb78a089b1e9e7c8b489bca  babeltrace2-2.0.4.tar.bz2
+sha256  a01c7e75e642de0b5b91f32cc706234c99eb556fcd52c9959045dc23a9ec52c9  babeltrace2-2.0.6.tar.bz2
 
 # Hash for license files
 sha256  d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index 2b2ab7db40..f3f1543c0e 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BABELTRACE2_SITE = https://www.efficios.com/files/babeltrace
-BABELTRACE2_VERSION = 2.0.4
+BABELTRACE2_VERSION = 2.0.6
 BABELTRACE2_SOURCE = babeltrace2-$(BABELTRACE2_VERSION).tar.bz2
 BABELTRACE2_LICENSE = MIT, LGPL-2.1 (src/common/list.h), GPL-2.0 (test code)
 BABELTRACE2_LICENSE_FILES = mit-license.txt lgpl-2.1.txt gpl-2.0.txt LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
