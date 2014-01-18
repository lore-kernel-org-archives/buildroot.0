From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:38 +0100
Subject: [Buildroot] [PATCH 01/10] eigen: add C++ toolchain dependency
In-Reply-To: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390073027-14239-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As said in its help text, eigen heavily uses C++ features.
So, explicit this dependency in the Config.in.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v1 -> v2:
- add Reviewed-by tag
---
 package/eigen/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.8.5.3
