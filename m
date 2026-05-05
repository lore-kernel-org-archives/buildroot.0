Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E34CFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21AB7406DB;
	Tue,  5 May 2026 19:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-SmzBfty9Vo; Tue,  5 May 2026 19:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF99406DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778008518;
	bh=/Ol8xCpJ0rNsxmwXEeJW48CK3EEzqAlDWy+n7l7/6xw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fDaMltnXBstP7HQ6o6FWW+W/zJccY38oQTfylNLfVpHoi/8sTSXAGyKtfF0jvSxfi
	 MsuHPpqN1FcqBNdoM/1RsQ4jHl4DL74ksbxq9iLBWAhsMCibAcFHOC8Spiq1OnmAf1
	 YggalOuwZuuH0jNK2cCqNYaZTQttEMm/GvxFnEC+DgWwpSkxOO3hJ9P3Ogy4Yn4C8S
	 n2KsI6kL+MtO3gGYWnRMaCbEeZ8n6Gw1cP+LicwfRkuePiclWHZ92MiD5GGojqZtxU
	 mDbkc3GwnQeOnSNiiM778j1NB50TJ7E+HbzxwxwERGLmX+1+661coZmySP53XxDqXO
	 E9QUzeIczUCmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF99406DE;
	Tue,  5 May 2026 19:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE3B8315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFFF0403C9
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfJg5QtTKpBs for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A14403C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4A14403C7
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:15:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C57D0845A5; Tue,  5 May 2026 19:15:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 21:14:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81e72115a05fb9b32ccb9e613c1d5c4151980426
X-Git-Newrev: d58449b225a25b56f0f92634818e74c79b02754e
X-Patchwork-Hint: ignore
Message-Id: <20260505191514.C57D0845A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: bump version to 1.4.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1804663590424293117=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1804663590424293117==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d58449b225a25b56f0f92634818e74c79b02754e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenSCAP/openscap/blob/1.4.4/NEWS

Removed patch which is included in this release.

Added tarball hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...et-project-as-C-project-in-CMakeLists.txt.patch | 78 ----------------------
 package/openscap/openscap.hash                     |  5 +-
 package/openscap/openscap.mk                       |  2 +-
 3 files changed, 5 insertions(+), 80 deletions(-)

diff --git a/package/openscap/0001-Set-project-as-C-project-in-CMakeLists.txt.patch b/package/openscap/0001-Set-project-as-C-project-in-CMakeLists.txt.patch
deleted file mode 100644
index 2ccbfd138d..0000000000
--- a/package/openscap/0001-Set-project-as-C-project-in-CMakeLists.txt.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From d2fa8df126b533317b4b863758cf579fff3a2b45 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
-Date: Mon, 16 Feb 2026 13:50:48 +0100
-Subject: [PATCH] Set project as C project in CMakeLists.txt
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The openscap tool has been recently integrated in the buildroot build
-system ([1]), which makes the openscap tool buildable for a wide variety
-or architectures/OSes, with a wide variety of _compilers_. And so when
-such compilers are not supporting C++ projects (as it is the case with a
-default buildroot toolchain), the build breaks on the following error
-(see [2] for an example):
-
-  -- Detecting CXX compiler ABI info
-  -- Detecting CXX compiler ABI info - failed
-  -- Check for working CXX compiler: /bin/false
-  -- Check for working CXX compiler: /bin/false - broken
-  CMake Error at /usr/share/cmake/Modules/CMakeTestCXXCompiler.cmake:73 (message):
-    The C++ compiler
-
-      "/bin/false"
-
-    is not able to compile a simple test program.
-
-    It fails with the following output:
-
-      Change Dir: '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
-
-      Run Build Command(s): /usr/bin/cmake -E env VERBOSE=1 /usr/bin/make -f Makefile cmTC_1834b/fast
-      make[1]: Entering directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
-      /usr/bin/make  -f CMakeFiles/cmTC_1834b.dir/build.make CMakeFiles/cmTC_1834b.dir/build
-      make[2]: Entering directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
-      Building CXX object CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o
-      /bin/false    -o CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o -c /home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI/testCXXCompiler.cxx
-      make[2]: *** [CMakeFiles/cmTC_1834b.dir/build.make:81: CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o] Error 1
-      make[2]: Leaving directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
-      make[1]: *** [Makefile:134: cmTC_1834b/fast] Error 2
-      make[1]: Leaving directory '/home/autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
-
-    CMake will not be able to correctly generate this project.
-  Call Stack (most recent call first):
-    CMakeLists.txt:11 (project)
-
-openscap does not have any C++ code to build, so restricting builds to
-toolchains supporting C++ is overconstraining, the configuration step
-should rather not try to check C++ support.
-
-Enforce the project as a C project in CMakeLists.txt to make sure not to
-test C++ features on the used toolchain.
-
-[1] https://buildroot.org/
-[2] https://autobuild.buildroot.org/results/1fe550ffa79f0a083a450ae03fe067a8ab7336be/build-end.log
-
-Upstream: https://github.com/OpenSCAP/openscap/commit/bbfb2d7b00cbb8e08d999546734d3ba6ae150736
-[patch slightly adapted to be applicable on v1.4.3]
-Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c561116d826c..570812667036 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -8,7 +8,7 @@ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
- 		"MinSizeRel" "RelWithDebInfo")
- endif()
- 
--project("openscap")
-+project("openscap" C)
- set(OPENSCAP_VERSION_MAJOR "1")
- set(OPENSCAP_VERSION_MINOR "4")
- set(OPENSCAP_VERSION_PATCH "3")
--- 
-2.53.0
-
diff --git a/package/openscap/openscap.hash b/package/openscap/openscap.hash
index 7a25789b5b..16cebc54c9 100644
--- a/package/openscap/openscap.hash
+++ b/package/openscap/openscap.hash
@@ -1,3 +1,6 @@
+# From https://github.com/OpenSCAP/openscap/releases/tag/1.4.4
+sha256  25b1b046822121204e6d53d877a532c88bf7fde14b94c9c72297cd5709b03478  openscap-1.4.4.tar.gz
+# From https://github.com/OpenSCAP/openscap/releases/download/1.4.4/openscap-1.4.4.tar.gz.sha512
+sha512  c69736bee997e50a04aff8e4f22da880f342190e1289c5df0fb73b7af34833d3bd9f4e5055b227a18d571167671f821701a09f8c9a3e4568c7da68cc4be51133  openscap-1.4.4.tar.gz
 # Locally computed
-sha256  96ebe697aafc83eb297a8f29596d57319278112467c46e6aaf3649b311cf8fba  openscap-1.4.3.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/openscap/openscap.mk b/package/openscap/openscap.mk
index 42f644db55..7da38df345 100644
--- a/package/openscap/openscap.mk
+++ b/package/openscap/openscap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSCAP_VERSION = 1.4.3
+OPENSCAP_VERSION = 1.4.4
 OPENSCAP_SITE = https://github.com/OpenSCAP/openscap/releases/download/$(OPENSCAP_VERSION)
 OPENSCAP_LICENSE = LGPL-2.1+
 OPENSCAP_LICENSE_FILES = COPYING

--===============1804663590424293117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1804663590424293117==--
