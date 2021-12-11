Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9576C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7302740571;
	Sat, 11 Dec 2021 23:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePAvG7YoyI0s; Sat, 11 Dec 2021 23:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A684A4053B;
	Sat, 11 Dec 2021 23:11:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9285B1BF297
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E46D4006C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McAMo-1rfpi0 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:07:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C267540199
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5CF4082AE5; Sat, 11 Dec 2021 23:02:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 00:06:50 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b3f998b38ac37f393c24f1beee14e224bbfc7fb4
X-Git-Newrev: c795b817a9c785d29c7abc4de939d203b20c92d9
X-Patchwork-Hint: ignore
Message-Id: <20211211230244.5CF4082AE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/wireshark: fix
 build failure with -latomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=c795b817a9c785d29c7abc4de939d203b20c92d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure raised since bump to version 3.4.10 in
commit 0ce776942d34d5d3bea6c11913cac38ea3e52f8b:

/usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.0.0
collect2: error: ld returned 1 exit status
make[3]: *** [run/lemon] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/02ea7d76a683b039fb37e005578644108bd1e3b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 76e66240da9b5dac8177fca4deb0f66c3c994023)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...emon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch} | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
similarity index 56%
rename from package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
rename to package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
index 51875fd267..edf24fc6d0 100644
--- a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
+++ b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
@@ -1,26 +1,27 @@
-From 982e5ab072816e29f6f2dc84d9a00ee7c4fdee40 Mon Sep 17 00:00:00 2001
+From 33270f56477542dedf978e660cf8d08464f28797 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 26 Nov 2021 17:45:23 +0100
-Subject: [PATCH] cmake: lemon: wipe CMAKE_SYSROOT if needed
+Subject: [PATCH] cmake: lemon: wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} if needed
 
-Wipe CMAKE_SYSROOT when LEMON_C_COMPILER is set to avoid a build failure
-when cross-compiling (e.g. with buildroot)
+Wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} when LEMON_C_COMPILER is set to
+avoid a build failure when cross-compiling (e.g. with buildroot)
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status:
 https://gitlab.com/wireshark/wireshark/-/merge_requests/5224]
 ---
- tools/lemon/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
+ tools/lemon/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/tools/lemon/CMakeLists.txt b/tools/lemon/CMakeLists.txt
-index 8742aa9fc9..7c8cc23a35 100644
+index 8742aa9fc9..7a9263fe0d 100644
 --- a/tools/lemon/CMakeLists.txt
 +++ b/tools/lemon/CMakeLists.txt
-@@ -12,6 +12,7 @@ add_executable(lemon lemon.c)
+@@ -12,6 +12,8 @@ add_executable(lemon lemon.c)
  if(DEFINED LEMON_C_COMPILER)
  	set(CMAKE_C_COMPILER "${LEMON_C_COMPILER}")
  	set(CMAKE_C_FLAGS "")
++	set(CMAKE_EXE_LINKER_FLAGS "")
 +	set(CMAKE_SYSROOT "")
  endif()
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
