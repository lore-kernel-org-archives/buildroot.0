Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1158C433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9267F61A6C
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9267F61A6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6833440460;
	Tue,  9 Nov 2021 22:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZwctsbjzVOT; Tue,  9 Nov 2021 22:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 739B940450;
	Tue,  9 Nov 2021 22:19:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8DE31BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5DB9608CF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPShsKP-hDOM for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B590608CE
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 01A718B82A; Tue,  9 Nov 2021 22:15:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 21:46:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 827bd376e34aa76ff04dfdff2ae3d7d1b841452a
X-Git-Newrev: 4e267a7d3d5d350710a81ada188a1629348e4b4a
X-Patchwork-Hint: ignore
Message-Id: <20211109221516.01A718B82A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: needs boost or C++17
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e267a7d3d5d350710a81ada188a1629348e4b4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

log4cxx needs boost or C++17 since bump to version 0.12.0 in
commit 83a0e8dea203dc37c6c207a36b3f46160578dcc2 (see
https://github.com/apache/logging-log4cxx/commit/2ab3b78b9aa36524287764a129fa6ad96e89ca02):

In file included from /home/buildroot/autobuild/instance-3/output-1/build/log4cxx-0.12.0/src/main/cpp/action.cpp:18:0:
/home/buildroot/autobuild/instance-3/output-1/build/log4cxx-0.12.0/src/main/include/log4cxx/rolling/action.h:51:8: error: 'mutex' in namespace 'std' does not name a type
   std::mutex mutex;
        ^

Fixes:
 - http://autobuild.buildroot.org/results/71e/71eb8c4f69a2505242b3224bd79f4a96eb3b68a4/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/log4cxx/0001-LOGCXX-528.patch | 189 ++++++++++++++++++++++++++++++++++
 package/log4cxx/Config.in             |  14 +++
 package/log4cxx/log4cxx.mk            |   4 +
 3 files changed, 207 insertions(+)

diff --git a/package/log4cxx/0001-LOGCXX-528.patch b/package/log4cxx/0001-LOGCXX-528.patch
new file mode 100644
index 0000000000..d1d3189024
--- /dev/null
+++ b/package/log4cxx/0001-LOGCXX-528.patch
@@ -0,0 +1,189 @@
+From 249dd85494a430d95fd69d89f42b02fd950cda51 Mon Sep 17 00:00:00 2001
+From: Robert Middleton <rm5248@users.noreply.github.com>
+Date: Thu, 22 Jul 2021 15:27:50 -0700
+Subject: [PATCH] LOGCXX-528 (#66)
+
+Fixes for checking that C++11 is available.  Fix for older compilers.
+
+[Retrieved from:
+https://github.com/apache/logging-log4cxx/commit/249dd85494a430d95fd69d89f42b02fd950cda51]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt                                | 10 +++++++++
+ src/cmake/boost-fallback/boost-fallback.cmake | 21 ++++++++++---------
+ src/main/cpp/hierarchy.cpp                    |  4 ++--
+ src/main/include/CMakeLists.txt               |  2 +-
+ .../log4cxx/helpers/appenderattachableimpl.h  |  1 +
+ .../include/log4cxx/helpers/aprinitializer.h  |  1 +
+ src/main/include/log4cxx/helpers/loglog.h     |  1 +
+ .../include/log4cxx/helpers/serversocket.h    |  1 +
+ src/main/include/log4cxx/level.h              |  1 +
+ src/main/include/log4cxx/rolling/action.h     |  1 +
+ 10 files changed, 30 insertions(+), 13 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e5b44ef1a..9c6e63902 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -41,6 +41,9 @@ if( NOT "${CMAKE_CXX_STANDARD}")
+     set(CMAKE_CXX_STANDARD 17)
+ endif()
+ 
++# Don't allow for compiler-specific extensions
++set(CMAKE_CXX_EXTENSIONS OFF)
++
+ # Building
+ add_subdirectory(src)
+ 
+@@ -185,6 +188,13 @@ if(APACHE_MAINTAINER)
+ 	)
+ endif()
+ 
++#
++# Check for any fatal configuration errors
++#
++if( "${SHARED_MUTEX_IMPL}" STREQUAL "NONE" )
++    message( FATAL_ERROR "No shared_mutex implementation found.  Requires Boost or C++17" )
++endif()
++
+ #
+ # Output configuration information
+ # Similar to APR CMake configuration
+diff --git a/src/cmake/boost-fallback/boost-fallback.cmake b/src/cmake/boost-fallback/boost-fallback.cmake
+index a8d7d441b..8285b0b99 100644
+--- a/src/cmake/boost-fallback/boost-fallback.cmake
++++ b/src/cmake/boost-fallback/boost-fallback.cmake
+@@ -56,16 +56,17 @@ try_compile(STD_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+     "${CMAKE_CURRENT_LIST_DIR}/test-stdatomic.cpp")
+ 
+ find_package(Boost COMPONENTS thread)
+-try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+-    "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedptr.cpp")
+-try_compile(Boost_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+-    "${CMAKE_CURRENT_LIST_DIR}/test-boostmutex.cpp")
+-try_compile(Boost_SHARED_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+-    "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedmutex.cpp"
+-    LINK_LIBRARIES Threads::Threads
+-)
+-try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+-    "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
++if( ${Boost_FOUND} )
++    try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
++        "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedptr.cpp")
++    try_compile(Boost_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
++        "${CMAKE_CURRENT_LIST_DIR}/test-boostmutex.cpp")
++    try_compile(Boost_SHARED_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
++        "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedmutex.cpp"
++        LINK_LIBRARIES Threads::Threads Boost::thread)
++    try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
++        "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
++endif( ${Boost_FOUND} )
+ 
+ # Link the target with the appropriate boost libraries(if required)
+ function(boostfallback_link target)
+diff --git a/src/main/cpp/hierarchy.cpp b/src/main/cpp/hierarchy.cpp
+index 4f5174448..c70d39dbb 100644
+--- a/src/main/cpp/hierarchy.cpp
++++ b/src/main/cpp/hierarchy.cpp
+@@ -223,7 +223,7 @@ LoggerPtr Hierarchy::getLogger(const LogString& name,
+ 	else
+ 	{
+ 		LoggerPtr logger(factory->makeNewLoggerInstance(pool, name));
+-		logger->setHierarchy(weak_from_this());
++		logger->setHierarchy(shared_from_this());
+ 		loggers->insert(LoggerMap::value_type(name, logger));
+ 
+ 		ProvisionNodeMap::iterator it2 = provisionNodes->find(name);
+@@ -423,6 +423,6 @@ void Hierarchy::configureRoot(){
+ 	// LOGCXX-322 we need to turn the repositroy into a weak_ptr, and we
+ 	// can't use weak_from_this() in the constructor.
+ 	if( !root->getLoggerRepository().lock() ){
+-		root->setHierarchy(weak_from_this());
++		root->setHierarchy(shared_from_this());
+ 	}
+ }
+diff --git a/src/main/include/CMakeLists.txt b/src/main/include/CMakeLists.txt
+index 8183660a5..584941c97 100644
+--- a/src/main/include/CMakeLists.txt
++++ b/src/main/include/CMakeLists.txt
+@@ -133,7 +133,7 @@ if( ${STD_SHARED_MUTEX_FOUND} )
+ elseif( ${Boost_SHARED_MUTEX_FOUND} )
+     set( SHARED_MUTEX_IMPL "boost::shared_mutex" )
+ else()
+-    set( SMART_PTR_IMPL "NONE" )
++    set( SHARED_MUTEX_IMPL "NONE" )
+ endif()
+ 
+ if( ${STD_ATOMIC_FOUND} )
+diff --git a/src/main/include/log4cxx/helpers/appenderattachableimpl.h b/src/main/include/log4cxx/helpers/appenderattachableimpl.h
+index 40e77d93c..b80b5aade 100644
+--- a/src/main/include/log4cxx/helpers/appenderattachableimpl.h
++++ b/src/main/include/log4cxx/helpers/appenderattachableimpl.h
+@@ -28,6 +28,7 @@
+ #include <log4cxx/helpers/object.h>
+ #include <log4cxx/helpers/pool.h>
+ #include <log4cxx/log4cxx.h>
++#include <mutex>
+ 
+ namespace log4cxx
+ {
+diff --git a/src/main/include/log4cxx/helpers/aprinitializer.h b/src/main/include/log4cxx/helpers/aprinitializer.h
+index 6f3f55070..fccd18e0f 100644
+--- a/src/main/include/log4cxx/helpers/aprinitializer.h
++++ b/src/main/include/log4cxx/helpers/aprinitializer.h
+@@ -30,6 +30,7 @@ extern "C" {
+ }
+ 
+ #include <apr_time.h>
++#include <mutex>
+ 
+ namespace log4cxx
+ {
+diff --git a/src/main/include/log4cxx/helpers/loglog.h b/src/main/include/log4cxx/helpers/loglog.h
+index d54785ddc..a4c92416a 100644
+--- a/src/main/include/log4cxx/helpers/loglog.h
++++ b/src/main/include/log4cxx/helpers/loglog.h
+@@ -20,6 +20,7 @@
+ 
+ #include <log4cxx/logstring.h>
+ #include <exception>
++#include <mutex>
+ 
+ namespace log4cxx
+ {
+diff --git a/src/main/include/log4cxx/helpers/serversocket.h b/src/main/include/log4cxx/helpers/serversocket.h
+index e6e6d475e..7da75b969 100644
+--- a/src/main/include/log4cxx/helpers/serversocket.h
++++ b/src/main/include/log4cxx/helpers/serversocket.h
+@@ -19,6 +19,7 @@
+ #define _LOG4CXX_HELPERS_SERVER_SOCKET_H
+ 
+ #include <log4cxx/helpers/socket.h>
++#include <mutex>
+ 
+ namespace log4cxx
+ {
+diff --git a/src/main/include/log4cxx/level.h b/src/main/include/log4cxx/level.h
+index 4ca4bf28c..7848c902a 100644
+--- a/src/main/include/log4cxx/level.h
++++ b/src/main/include/log4cxx/level.h
+@@ -22,6 +22,7 @@
+ #include <log4cxx/logstring.h>
+ #include <limits.h>
+ #include <log4cxx/helpers/object.h>
++#include <mutex>
+ 
+ #if defined(_MSC_VER)
+ 	#pragma warning ( push )
+diff --git a/src/main/include/log4cxx/rolling/action.h b/src/main/include/log4cxx/rolling/action.h
+index 0e8d55f36..fc4497813 100644
+--- a/src/main/include/log4cxx/rolling/action.h
++++ b/src/main/include/log4cxx/rolling/action.h
+@@ -21,6 +21,7 @@
+ #include <log4cxx/portability.h>
+ #include <log4cxx/helpers/object.h>
+ #include <log4cxx/helpers/pool.h>
++#include <mutex>
+ 
+ namespace log4cxx
+ {
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index bf739a43ca..6f1956f829 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -5,8 +5,14 @@ config BR2_PACKAGE_LOG4CXX
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr
+	depends on BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
+	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
 	  after Apache log4j.
@@ -17,3 +23,11 @@ comment "log4cxx needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+
+comment "log4cxx needs a toolchain w/ wchar or gcc >= 7"
+	depends on !(BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7)
+	depends on BR2_USE_MMU
+
+comment "log4cxx needs a toolchain not affected by GCC bug 64735"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 8a7ca8ef17..e799b0fb16 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -17,6 +17,10 @@ LOG4CXX_CONF_OPTS = \
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
+ifeq ($(BR2_PACKAGE_BOOST),y)
+LOG4CXX_DEPENDENCIES += boost
+endif
+
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 LOG4CXX_DEPENDENCIES += libesmtp
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
