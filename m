From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 09:30:44 +0100
Subject: [Buildroot] [git commit] liblinear: requires C++ support
Message-ID: <20141222083105.7CBD68072D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a20c15f1812ef50aa63bf050a604012db370bc14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/1be/1be890ece519ebc0d0ff4f3f31abc06eb0b7356c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liblinear/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index 08e8365..17c5a74 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBLINEAR
 	bool "liblinear"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  liblinear is a linear classifier for data with millions of instances and
 	  features.
 
 	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
+
+comment "liblinear needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
