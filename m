From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 11 Nov 2013 13:14:50 +0000
Subject: [Buildroot] [PATCH] log4cxx: needs threads
Message-ID: <1384175690-24573-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/7b73901d9e8b5098cd96b54d292bb3ffffb3fe37/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/log4cxx/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 86d6a1d..1785232 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -5,11 +5,12 @@ config BR2_PACKAGE_LOG4CXX
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
 	  after Apache log4j.
 
 	  http://apache.linux-mirror.org/logging/log4cxx/0.10.0
 
-comment "log4cxx needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "log4cxx needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.3.2
