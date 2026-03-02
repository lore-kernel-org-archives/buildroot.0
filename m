Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986E2D58E4C
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 09:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68EEC813EE;
	Mon,  2 Mar 2026 09:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TG1VdA43qxt6; Mon,  2 Mar 2026 09:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 536098146F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772444041;
	bh=CQ7ZjyC99lepQvbuc1LT/d8f7eo3oeDur5XP+kqTEKQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A0mpQHmCsIk9qBFd1ZafU7aOuQNWW4pXPlDA+sijFilpva6xOJtaADwucfGg3DG/S
	 +yb4SHg3sMunUA0TNrIH9h44I1Mq5C+DZ0u4nMNc7mtO3NUDgZNobEk8UKyx1+cgle
	 wojPY87GsTIgzv64wqf4IP1L97Qg+DmI77JO7SCy+722Cy4hDAdtiTRG8xU2Qdyamx
	 xE1UE91PruhollMWVKOfWHmVb4+3YqfA098sLiM8at0BChxcBmzqX6p5Olyy0ohoGG
	 lEAAlRZ01OguyqqdDwSx6EO8cwsh2P46TpX9RH7GsGqtwdvrJ97F3hXMUfsQEfCbyy
	 0Sk9qYghR6PrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536098146F;
	Mon,  2 Mar 2026 09:34:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57677231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48C2C8146F
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08dh4IC2EIrn for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 09:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558AE813EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558AE813EE
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:33:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5903A81785; Mon,  2 Mar 2026 09:33:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Mar 2026 10:32:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 156e5fa7eb0de95076a54a93f66ba32ec1591853
X-Git-Newrev: 093725864a150ad2034bee78230e5151fb7004d4
X-Patchwork-Hint: ignore
Message-Id: <20260302093359.5903A81785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: add patch to enforce
 project as C project
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
Content-Type: multipart/mixed; boundary="===============1108527626242776565=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1108527626242776565==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/093725864a150ad2034bee78230e5151fb7004d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When the toolchain involved in openscap build does not support C++, the
configure step fails with the following error:

  -- Detecting CXX compiler ABI info
  -- Detecting CXX compiler ABI info - failed
  -- Check for working CXX compiler: /bin/false
  -- Check for working CXX compiler: /bin/false - broken
  CMake Error at /usr/share/cmake/Modules/CMakeTestCXXCompiler.cmake:73 (message):
    The C++ compiler

      "/bin/false"

    is not able to compile a simple test program.

    It fails with the following output:

      Change Dir: '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'

      Run Build Command(s): /usr/bin/cmake -E env VERBOSE=1 /usr/bin/make -f Makefile cmTC_1834b/fast
      make[1]: Entering directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
      /usr/bin/make  -f CMakeFiles/cmTC_1834b.dir/build.make CMakeFiles/cmTC_1834b.dir/build
      make[2]: Entering directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
      Building CXX object CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o /bin/false    -o CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o -c /home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI/testCXXCompiler.cxx
      make[2]: *** [CMakeFiles/cmTC_1834b.dir/build.make:81: CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o] Error 1
      make[2]: Leaving directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
      make[1]: *** [Makefile:134: cmTC_1834b/fast] Error 2
      make[1]: Leaving directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'

    CMake will not be able to correctly generate this project.
  Call Stack (most recent call first):
    CMakeLists.txt:11 (project)

  -- Configuring incomplete, errors occurred!
  make: *** [package/pkg-generic.mk:263: /home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/.stamp_configured] Error 1
  make: Leaving directory '/home/autobuild/autobuild/instance-6/buildroot'

The openscap project does not contain any C++ file, and so does not need
a C++ capable compiler. Bring the to-be-integrated-upstream patch
enforcing C language in CMakeLists.txt to prevent this build failure.

Fixes: https://autobuild.buildroot.org/results/1fe550ffa79f0a083a450ae03fe067a8ab7336be
Fixes: https://autobuild.buildroot.org/results/e9d52b52658544916022050c78dcb137ca6c97e0
Fixes: https://autobuild.buildroot.org/results/4a9c21763aaddb217ee5f8bb8947faad9767baa3
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../openscap/0001-set-project-as-c-project.patch   | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/package/openscap/0001-set-project-as-c-project.patch b/package/openscap/0001-set-project-as-c-project.patch
new file mode 100644
index 0000000000..c794fbaf44
--- /dev/null
+++ b/package/openscap/0001-set-project-as-c-project.patch
@@ -0,0 +1,78 @@
+From a742647efd215b682e4cd26b15ac3e580c10ef9f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
+Date: Mon, 16 Feb 2026 13:50:48 +0100
+Subject: [PATCH] Set project as C project in CMakeLists.txt
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The openscap tool has been recently integrated in the buildroot build
+system ([1]), which makes the openscap tool buildable for a wide variety
+or architectures/OSes, with a wide variety of _compilers_. And so when
+such compilers are not supporting C++ projects (as it is the case with a
+default buildroot toolchain), the build breaks on the following error
+(see [2] for an example):
+
+  -- Detecting CXX compiler ABI info
+  -- Detecting CXX compiler ABI info - failed
+  -- Check for working CXX compiler: /bin/false
+  -- Check for working CXX compiler: /bin/false - broken
+  CMake Error at /usr/share/cmake/Modules/CMakeTestCXXCompiler.cmake:73 (message):
+    The C++ compiler
+
+      "/bin/false"
+
+    is not able to compile a simple test program.
+
+    It fails with the following output:
+
+      Change Dir: '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
+
+      Run Build Command(s): /usr/bin/cmake -E env VERBOSE=1 /usr/bin/make -f Makefile cmTC_1834b/fast
+      make[1]: Entering directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
+      /usr/bin/make  -f CMakeFiles/cmTC_1834b.dir/build.make CMakeFiles/cmTC_1834b.dir/build
+      make[2]: Entering directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
+      Building CXX object CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o
+      /bin/false    -o CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o -c /home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI/testCXXCompiler.cxx
+      make[2]: *** [CMakeFiles/cmTC_1834b.dir/build.make:81: CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o] Error 1
+      make[2]: Leaving directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
+      make[1]: *** [Makefile:134: cmTC_1834b/fast] Error 2
+      make[1]: Leaving directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
+
+    CMake will not be able to correctly generate this project.
+  Call Stack (most recent call first):
+    CMakeLists.txt:11 (project)
+
+openscap does not have any C++ code to build, so restricting builds to
+toolchains supporting C++ is overconstraining, the configuration step
+should rather not try to check C++ support.
+
+Enforce the project as a C project in CMakeLists.txt to make sure not to
+test C++ features on the used toolchain.
+
+[1] https://buildroot.org/
+[2] https://autobuild.buildroot.org/results/1fe550ffa79f0a083a450ae03fe067a8ab7336be/build-end.log
+
+Upstream: https://github.com/OpenSCAP/openscap/pull/2312
+[patch slightly adapted to be applicable on v1.3.12]
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb13debb47cf..05b054327951 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -8,7 +8,7 @@ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
+ 		"MinSizeRel" "RelWithDebInfo")
+ endif()
+ 
+-project("openscap")
++project("openscap" C)
+ set(OPENSCAP_VERSION_MAJOR "1")
+ set(OPENSCAP_VERSION_MINOR "3")
+ set(OPENSCAP_VERSION_PATCH "12")
+-- 
+2.53.0
+

--===============1108527626242776565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1108527626242776565==--
