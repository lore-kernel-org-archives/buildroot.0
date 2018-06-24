From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 15:55:09 +0200
Subject: [Buildroot] [git commit] boost: bump to version 1.67.0
Message-ID: <20180624135258.55A7880262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85a49834caaad9083c4f8480880287253e9be9ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove fifth patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/0005-fix-build-with-g-5.patch | 32 -----------------------------
 package/boost/boost.hash                    |  4 ++--
 package/boost/boost.mk                      |  2 +-
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/boost/0005-fix-build-with-g-5.patch b/package/boost/0005-fix-build-with-g-5.patch
deleted file mode 100644
index 49149e6ebf..0000000000
--- a/package/boost/0005-fix-build-with-g-5.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From da2793fcde5c4e3ff448b4b21348ef8b1482c678 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 16 Jan 2018 14:51:32 +0100
-Subject: [PATCH] fix build with g++5
-
-Patch needed to build domoticz
-
-Patch fetch from one of the answer of
- https://github.com/domoticz/domoticz/issues/2034:
- workaround suggested to the boost developers
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- boost/asio/detail/consuming_buffers.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/boost/asio/detail/consuming_buffers.hpp b/boost/asio/detail/consuming_buffers.hpp
-index a429f97..b7a887c 100644
---- a/boost/asio/detail/consuming_buffers.hpp
-+++ b/boost/asio/detail/consuming_buffers.hpp
-@@ -102,7 +102,7 @@ public:
- 
-     std::advance(next, next_elem_);
-     std::size_t elem_offset = next_elem_offset_;
--    while (next != end && max_size > 0 && result.count < result.max_buffers)
-+    while (next != end && max_size > 0 && (result.count) < result.max_buffers)
-     {
-       Buffer next_buf = Buffer(*next) + elem_offset;
-       result.elems[result.count] = boost::asio::buffer(next_buf, max_size);
--- 
-2.7.4
-
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 7eb675d5b1..fb1eb4291f 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From http://www.boost.org/users/history/version_1_66_0.html
-sha256 5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9  boost_1_66_0.tar.bz2
+# From http://www.boost.org/users/history/version_1_67_0.html
+sha256 2684c972994ee57fc5632e03bf044746f6eb45d4920c343937a465fd67a5adba  boost_1_67_0.tar.bz2
 
 # Locally computed
 sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 9ad83d5aeb..981d701bdf 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.66.0
+BOOST_VERSION = 1.67.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
