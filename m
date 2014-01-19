From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 21:13:54 +0100
Subject: [Buildroot] [git commit] eigen: add C++ toolchain dependency
Message-ID: <20140119203153.020FF9C551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76f02e371a3b9d73d62bd6a74a85437b9dec7f9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As said in its help text, eigen heavily uses C++ features.
So, explicit this dependency in the Config.in.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eigen/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/eigen/Config.in b/package/eigen/Config.in
index c7fcde2..e94f9a3 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EIGEN
 	bool "eigen"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Eigen is a C++ template library for linear algebra: vectors,
 	  matrices, and related algorithms. It is versatile, fast, elegant
@@ -11,3 +12,6 @@ config BR2_PACKAGE_EIGEN
 	  template library defined in the headers.
 
 	  http://eigen.tuxfamily.org/
+
+comment "eigen needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
