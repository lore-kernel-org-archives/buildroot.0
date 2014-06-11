From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 12:53:41 +0200
Subject: [Buildroot] [git commit] flann: disable with the problematic NIOS
	II toolchain
Message-ID: <20140611111743.2E8949B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9cc00e8bf406cf5c0ce900348dcc1aa9e72afc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/062/0620bf8d60aa57949cede0c5b3920ef5446fe98b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flann/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/flann/Config.in b/package/flann/Config.in
index 6185b12..a3af7c1 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_PREFER_STATIC_LIB
+	# triggers an assert in the linker of this toolchain
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	help
 	  FLANN is a library for performing fast approximate nearest
 	  neighbor searches in high dimensional spaces. It contains a
