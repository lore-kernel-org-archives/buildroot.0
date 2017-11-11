From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:26:50 +0100
Subject: [Buildroot] [git commit branch/next] python-numpy: disable for
 ARCompact
Message-ID: <20171113221622.81B17807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=636f4d81ff4be52dc7818c51b9d479a9cb6ecea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package fails when building for ARCompact due to toolchain issue.

Marking this with special comment "#ARC toolchain issues for
ARCompact" as the package is to be enabled as soon as the issue with
the ARC toolchain is resolved.

Fixes:

  http://autobuild.buildroot.net/results/4c4eaa90335756448007ae3c5ae3839fb17d4442/

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 5abe04b..1405218 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	bool
 	# Numpy has some CPU specific code
-	default y if BR2_arc 
+	# ARC toolchain issues for ARCompact
+	default y if BR2_arc && !(BR2_arc770d || BR2_arc750d)
 	default y if BR2_aarch64
 	default y if BR2_arm 
 	default y if BR2_armeb
