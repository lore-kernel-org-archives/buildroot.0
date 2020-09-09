From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed,  9 Sep 2020 12:32:40 +0300
Subject: [Buildroot] [PATCH 1/1 v2] package/boost: bump to version 1.74.0
Message-ID: <20200909093240.2178664-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 10 C++20 breaks boost library due to allocator changes.
https://github.com/boostorg/bimap/issues/23

We need boost 1.74.0 to fix build with gcc 10

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/boost/0002-fenv.patch | 2 +-
 package/boost/boost.hash      | 4 ++--
 package/boost/boost.mk        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boost/0002-fenv.patch b/package/boost/0002-fenv.patch
index 95c769aea2..9dc7848c93 100644
--- a/package/boost/0002-fenv.patch
+++ b/package/boost/0002-fenv.patch
@@ -18,7 +18,7 @@ Index: b/boost/config/platform/linux.hpp
 ===================================================================
 --- a/boost/config/platform/linux.hpp
 +++ b/boost/config/platform/linux.hpp
-@@ -47,6 +47,16 @@
+@@ -48,6 +48,16 @@
  #endif
  
  //
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index c94699aa67..d11232f5a9 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_73_0.html
-sha256  4eb3b8d442b426dc35346235c8733b5ae35ba431690e38c6a8263dce9fcbb402  boost_1_73_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_74_0.html
+sha256  83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1  boost_1_74_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 323802488d..82fe42d6b2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.73.0
+BOOST_VERSION = 1.74.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
-- 
2.27.0
