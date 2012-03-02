From: Stephan Thamm <thammi@chaossource.net>
Date: Fri, 2 Mar 2012 19:52:03 +0100
Subject: [Buildroot] [PATCH] boost: Add coment when C++ is missing
Message-ID: <201203021952.03453.thammi@chaossource.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
a coworker just searched boost in the current release and was not able to find 
it. He even found out which section it was in but he was missing C++ support 
so he didn't see anything.

This patch would have saved him much time:

---
 package/boost/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 7598d02..eac91dc 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_BOOST
 
          http://www.boost.org/
 
+comment "boost requires a toolchain with C++ support enabled"
+       depends on !BR2_INSTALL_LIBSTDCPP
+
 if BR2_PACKAGE_BOOST
 
 config BR2_PACKAGE_BOOST_MULTITHREADED
-- 
1.7.9
