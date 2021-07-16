Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C94C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:00:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587C861029
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 587C861029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33CEA605BF;
	Tue,  3 Aug 2021 22:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_5lnmjPy45P; Tue,  3 Aug 2021 22:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4410E605EB;
	Tue,  3 Aug 2021 22:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6768A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBC56404EB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cs-2nNTBXm1V for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 120DE40291
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5C87385586; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 23:16:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 888b817e65ae20c552c41950ec6cbe986893c840
X-Git-Newrev: f2a3cd9ac4dbd15f2c667e35332c6e80a2c03c07
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.5C87385586@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qpid-proton: bump to
 version 0.35.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2a3cd9ac4dbd15f2c667e35332c6e80a2c03c07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patches (already in version)
- host-python3 is mandatory since
  https://github.com/apache/qpid-proton/commit/70ace037684f39c2d68681ef32302d38a9e06fac

https://qpid.apache.org/releases/qpid-proton-0.35.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.34.0/release-notes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oactor-epoll-internal.h-fix-build-on-musl.patch | 43 ---------------
 ...PROTON-2355-Fix-build-with-DPROACTOR-none.patch | 61 ----------------------
 package/qpid-proton/qpid-proton.hash               |  4 +-
 package/qpid-proton/qpid-proton.mk                 |  6 +--
 4 files changed, 5 insertions(+), 109 deletions(-)

diff --git a/package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch b/package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch
deleted file mode 100644
index 1806a7a780..0000000000
--- a/package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e4211aa978606b9201dc0eb2399d1af6c010a46a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 17 Mar 2021 17:21:52 +0100
-Subject: [PATCH] c/src/proactor/epoll-internal.h: fix build on musl
-
-Build with epoll proactor on musl is broken since at least version 0.23.0 and
-https://github.com/apache/qpid-proton/commit/37136940e3077f25ce58c94775f48c66f666f4a8
-because musl does not define PTHREAD_MUTEX_ADAPTIVE_NP resulting in the
-following build failure:
-
-In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll.c:60:
-/home/giuliobenetti/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h: In function 'pmutex_init':
-/home/giuliobenetti/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h:319:36: error: 'PTHREAD_MUTEX_ADAPTIVE_NP' undeclared (first use in this function); did you mean 'PTHREAD_MUTEX_STALLED'?
-  319 |   pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
-      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
-      |                                    PTHREAD_MUTEX_STALLED
-
-Fixes:
- - http://autobuild.buildroot.org/results/6a901b9ff68b7f52cabf8273d1017025fbd93b0d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://issues.apache.org/jira/browse/PROTON-2346]
----
- c/src/proactor/epoll-internal.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/c/src/proactor/epoll-internal.h b/c/src/proactor/epoll-internal.h
-index e8c9f0a9..fa6a6f2a 100644
---- a/c/src/proactor/epoll-internal.h
-+++ b/c/src/proactor/epoll-internal.h
-@@ -315,7 +315,9 @@ static inline void pmutex_init(pthread_mutex_t *pm){
-   pthread_mutexattr_t attr;
- 
-   pthread_mutexattr_init(&attr);
-+#ifdef PTHREAD_MUTEX_ADAPTIVE_NP
-   pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
-+#endif
-   if (pthread_mutex_init(pm, &attr)) {
-     perror("pthread failure");
-     abort();
--- 
-2.30.1
-
diff --git a/package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch b/package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch
deleted file mode 100644
index c99a65f2f3..0000000000
--- a/package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 2e3b81296020340692139f1a0d05c3bc7383b40e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jiri=20Dan=C4=9Bk?= <jdanek@redhat.com>
-Date: Thu, 1 Apr 2021 19:24:33 +0200
-Subject: [PATCH] PROTON-2355: Fix build with -DPROACTOR=none (#302)
-
-epoll proactor unconditionally uses pthread.h which will result in the
-following build failure:
-
-[  3%] Building C object c/CMakeFiles/qpid-proton-proactor-objects.dir/src/proactor/epoll.c.o
-In file included from /nvme/rc-buildroot-test/scripts/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll.c:60:
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h:37:10: fatal error: pthread.h: No such file or directory
-   37 | #include <pthread.h>
-      |          ^~~~~~~~~~~
-
-To fix this failure, the user could use -DPROACTOR=none but it also
-fails on:
-
-CMake Error at c/CMakeLists.txt:481 (add_library):
-  Error evaluating generator expression:
-
-    $<TARGET_OBJECTS:qpid-proton-proactor-objects>
-
-  Objects of target "qpid-proton-proactor-objects" referenced but no such
-  target exists.
-
-Co-authored-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/apache/qpid-proton/commit/2e3b81296020340692139f1a0d05c3bc7383b40e]
----
- c/CMakeLists.txt | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/c/CMakeLists.txt b/c/CMakeLists.txt
-index 2146a5c96..e1119d11d 100644
---- a/c/CMakeLists.txt
-+++ b/c/CMakeLists.txt
-@@ -464,7 +464,11 @@ set(qpid-proton-noncore-src
-   ${qpid-proton-include-extra}
- )
- 
--add_library (qpid-proton SHARED $<TARGET_OBJECTS:qpid-proton-core-objects> $<TARGET_OBJECTS:qpid-proton-platform-io-objects> $<TARGET_OBJECTS:qpid-proton-proactor-objects> ${qpid-proton-noncore-src})
-+add_library (qpid-proton SHARED
-+  $<TARGET_OBJECTS:qpid-proton-core-objects>
-+  $<TARGET_OBJECTS:qpid-proton-platform-io-objects>
-+  $<$<TARGET_EXISTS:qpid-proton-proactor-objects>:$<TARGET_OBJECTS:qpid-proton-proactor-objects>>
-+  ${qpid-proton-noncore-src})
- target_link_libraries (qpid-proton LINK_PRIVATE ${SSL_LIB} ${SASL_LIB} ${TIME_LIB} ${PLATFORM_LIBS} ${PROACTOR_LIBS})
- set_target_properties (qpid-proton
-   PROPERTIES
-@@ -480,7 +484,10 @@ if (BUILD_STATIC_LIBS)
-     C_EXTENSIONS ON)
-   add_library(qpid-proton-static STATIC $<TARGET_OBJECTS:qpid-proton-platform-io-static> ${qpid-proton-noncore-src})
-   target_compile_definitions(qpid-proton-static PUBLIC PROTON_DECLARE_STATIC)
--  target_link_libraries (qpid-proton-static qpid-proton-core-static qpid-proton-proactor-static ${SSL_LIB} ${SASL_LIB} ${TIME_LIB} ${PLATFORM_LIBS} ${PROACTOR_LIBS})
-+  target_link_libraries (qpid-proton-static
-+    qpid-proton-core-static
-+    $<$<TARGET_EXISTS:qpid-proton-proactor-static>:qpid-proton-proactor-static>
-+    ${SSL_LIB} ${SASL_LIB} ${TIME_LIB} ${PLATFORM_LIBS} ${PROACTOR_LIBS})
- endif(BUILD_STATIC_LIBS)
- 
- # Install executables and libraries
diff --git a/package/qpid-proton/qpid-proton.hash b/package/qpid-proton/qpid-proton.hash
index 22600e47d8..bead3c1807 100644
--- a/package/qpid-proton/qpid-proton.hash
+++ b/package/qpid-proton/qpid-proton.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.apache.org/dist/qpid/proton/0.33.0/qpid-proton-0.33.0.tar.gz.sha512
-sha512  d82cade354fd01f2cf7a3e0c17d48cdfa3bde263c8571762cdeb0b4da6ef2d6fd6f97cdba4fa4e8fc1b5368c54ccd2ca860fb56f46f58091c91deab843a17cf2  qpid-proton-0.33.0.tar.gz
+# Hash from: https://www.apache.org/dist/qpid/proton/0.35.0/qpid-proton-0.35.0.tar.gz.sha512
+sha512  1031e3d45854107a516699e1d18269c6acb22549b2709c1fc1cd25eb870096de109077445f1b400edf231bb21a476a268e2d6674e986fc50e92a281549085543  qpid-proton-0.35.0.tar.gz
 
 # Locally computed
 sha256  52310e65489d30afeefc8589479fc02862a875349c19edd165658a915009da82  LICENSE.txt
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 4e03357261..103cf9fd31 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPID_PROTON_VERSION = 0.33.0
+QPID_PROTON_VERSION = 0.35.0
 QPID_PROTON_SITE = \
 	https://downloads.apache.org/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_LICENSE = Apache-2.0
@@ -13,7 +13,7 @@ QPID_PROTON_CPE_ID_VENDOR = apache
 QPID_PROTON_CPE_ID_PRODUCT = qpid_proton
 QPID_PROTON_INSTALL_STAGING = YES
 QPID_PROTON_DEPENDENCIES = \
-	host-python \
+	host-python3 \
 	util-linux \
 	$(if $(BR2_PACKAGE_LIBUV),libuv) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
@@ -29,7 +29,7 @@ QPID_PROTON_CONF_OPTS = \
 	-DENABLE_FUZZ_TESTING=OFF \
 	-DENABLE_VALGRIND=OFF \
 	-DENABLE_WARNING_ERROR=OFF \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 
 # epoll proactor unconditionally uses pthread and cpp (C++) bindings
 # unconditionally use proactor
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
