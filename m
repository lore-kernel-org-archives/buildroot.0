From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 11:32:34 +0200
Subject: [Buildroot] [git commit] Revert "package/boost: bump to version
	1.58.0"
Message-ID: <20150501093321.5F40581DF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f431f5540e4c8bf250df820e59e106cf83f2d44d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 25655021fb66f58afe4966face0afdda1e7be65a.

Boost 1.58.0 breaks the build, trying to pass -m32 to compilers that
do not support it:

  http://autobuild.buildroot.org/results/66c/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.hash |    6 +++---
 package/boost/boost.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 706eea2..2019743 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.58.0/
-md5	b8839650e61e9c1c0a89f371dd475546	boost_1_58_0.tar.bz2
-sha1	2fc96c1651ac6fe9859b678b165bd78dc211e881	boost_1_58_0.tar.bz2
+# From http://sourceforge.net/projects/boost/files/boost/1.57.0/
+md5	1be49befbdd9a5ce9def2983ba3e7b76	boost_1_57_0.tar.bz2
+sha1	e151557ae47afd1b43dc3fac46f8b04a8fe51c12	boost_1_57_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index c658628..7060591 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.58.0
+BOOST_VERSION = 1.57.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
