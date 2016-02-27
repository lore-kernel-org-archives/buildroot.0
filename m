From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:23:40 +0100
Subject: [Buildroot] [git commit] package/qhull: fix comment dependency
Message-ID: <20160227152355.220E680731@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=698f1e971c6c9a72ebdfcd43d19ec647d2c5767e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment must be displayed with toolchain without C++ compiler support when
BR2_STATIC_LIBS is not set.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qhull/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qhull/Config.in b/package/qhull/Config.in
index f671e88..2bc8ff6 100644
--- a/package/qhull/Config.in
+++ b/package/qhull/Config.in
@@ -15,5 +15,4 @@ config BR2_PACKAGE_QHULL
 	  http://www.qhull.org
 
 comment "qhull needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
