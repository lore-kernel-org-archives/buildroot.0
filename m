Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B075C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5BC604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA5BC604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B064F41DD4;
	Tue,  3 Aug 2021 22:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzdDsu7lsG39; Tue,  3 Aug 2021 22:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F143D4059C;
	Tue,  3 Aug 2021 22:57:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23F241BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 988E440635
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_GuGGCBBs_9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE98240552
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 12345843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Jun 2021 21:47:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 47ce1876ae7c202e045fda1c978412cd5c7724c8
X-Git-Newrev: e93eaf7248d62e5e79a3b0e46de7483094a276d8
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.12345843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-mediadriver:
 disable -Werror
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e93eaf7248d62e5e79a3b0e46de7483094a276d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable -Werror to avoid the following build failure:

<command-line>: error: "_FORTIFY_SOURCE" redefined [-Werror]

MEDIA_BUILD_FATAL_WARNINGS option is available since version 18.2.0 and
https://github.com/intel/media-driver/commit/6932fc0ffb8228245052528820adafb6743f7482

Fixes:
 - http://autobuild.buildroot.org/results/52638d95312e464626d1c4047b3b26d4f57a1cd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch | 51 ++++++++++++++++++++++
 package/intel-mediadriver/intel-mediadriver.mk     |  1 +
 2 files changed, 52 insertions(+)

diff --git a/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch b/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
new file mode 100644
index 0000000000..bc7a27f4d0
--- /dev/null
+++ b/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
@@ -0,0 +1,51 @@
+From f09fddd6763aca237f19417de05a1f5de7f51d40 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Jun 2021 16:57:32 +0200
+Subject: [PATCH] cmrtlib/linux/CMakelists.txt: respect
+ MEDIA_BUILD_FATAL_WARNINGS
+
+Respect MEDIA_BUILD_FATAL_WARNINGS to avoid the following build failure
+when the user provides _FORTIFY_SOURCE:
+
+In file included from /home/buildroot/autobuild/instance-0/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/dlfcn.h:22,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/intel-mediadriver-19.4.0r/cmrtlib/linux/../linux/share/cm_include.h:30,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/intel-mediadriver-19.4.0r/cmrtlib/agnostic/share/cm_printf_host.cpp:23:
+/home/buildroot/autobuild/instance-0/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/features.h:397:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+  397 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
+      |    ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/52638d95312e464626d1c4047b3b26d4f57a1cd2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/intel/media-driver/pull/1203]
+---
+ cmrtlib/linux/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
+index 7a0193a8..65f71cee 100644
+--- a/cmrtlib/linux/CMakeLists.txt
++++ b/cmrtlib/linux/CMakeLists.txt
+@@ -32,12 +32,16 @@ else()
+ 
+ # Set up compile options that will be used for the Linux build
+ if(CMAKE_COMPILER_IS_GNUCC)
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive")
+     set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing ")
+     set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive")
+     set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
+     set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
++    if(MEDIA_BUILD_FATAL_WARNINGS)
++        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
++        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
++    endif()
+ 
+    set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
+    set(CMAKE_SKIP_RPATH ON)
+-- 
+2.30.2
+
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 963e4b8f9c..01423b9611 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -23,6 +23,7 @@ INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
 INTEL_MEDIADRIVER_CONF_OPTS = \
 	-DINSTALL_DRIVER_SYSCONF=OFF \
+	-DMEDIA_BUILD_FATAL_WARNINGS=OFF \
 	-DMEDIA_RUN_TEST_SUITE=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
