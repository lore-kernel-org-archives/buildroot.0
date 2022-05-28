Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC9340B74;
	Sat, 28 May 2022 19:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0JRanROAgUf; Sat, 28 May 2022 19:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3301940B77;
	Sat, 28 May 2022 19:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 126061BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E82A610D5
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoRGxej77Z15 for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7751C610D1
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 425A485E04; Sat, 28 May 2022 19:16:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:23:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 14ba7bbbab9c2561500c176e246529a14e65435b
X-Git-Newrev: 8b2d0c31a723b10b2c4fa647521c466b0e49d1e7
X-Patchwork-Hint: ignore
Message-Id: <20220528191613.425A485E04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcgi: disable
 tests
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b2d0c31a723b10b2c4fa647521c466b0e49d1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable tests to avoid the following static build failure on sh4aeb:

In file included from /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:20:
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/include/libcgi/cgi.h:81:31: note: expected 'char *' but argument is of type 'const char *'
   81 | extern int slist_delete(char *name, formvars **start, formvars **last);
      |                         ~~~~~~^~~~
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: unable to find a register to spill in class 'FPUL_REGS'
  352 | }
      | ^
/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: this is the insn:
(insn 1084 1081 1085 105 (set (reg:SI 4 r4)
        (mem/f:SI (post_inc:SI (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])) [0 MEM[base: _414, offset: 0B]+0 S4 A32])) "/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c":323:3 189 {movsi_ie}
     (expr_list:REG_INC (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])
        (nil)))

Fixes:
 - http://autobuild.buildroot.org/results/84a2339568d23b328af2416bfcec1ef41eccdce5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 260e7fda6adca10e0341532d03a8e1f4d08e9a10)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-CMakeLists.txt-honour-BUILD_TESTING.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
new file mode 100644
index 0000000000..3ec674ae70
--- /dev/null
+++ b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
@@ -0,0 +1,44 @@
+From 15ec267520efbe45193eb1df5361a4ab56164294 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 May 2022 17:54:42 +0200
+Subject: [PATCH] CMakeLists.txt: honour BUILD_TESTING
+
+Allow the user to disable tests through the standard BUILD_TESTING
+option: https://cmake.org/cmake/help/latest/module/CTest.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rafaelsteil/libcgi/commit/15ec267520efbe45193eb1df5361a4ab56164294]
+---
+ CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cbf0d97..e3329a1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -29,15 +29,21 @@ option(BUILD_SHARED_LIBS
+ 	"Global flag to cause add_library to create shared libraries if on."
+ 	ON
+ )
++option(BUILD_TESTING
++	"Build tests."
++	ON
++)
+ 
+ # subdirectories
+ add_subdirectory("include/libcgi")
+ add_subdirectory("src")
+ 
+ # test
+-enable_testing()
+-include(CTest)
+-add_subdirectory("test")
++if(BUILD_TESTING)
++	enable_testing()
++	include(CTest)
++	add_subdirectory("test")
++endif(BUILD_TESTING)
+ 
+ # cmake package stuff
+ configure_package_config_file(${PROJECT_NAME_LC}-config.cmake.in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
