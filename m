From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu,  9 Nov 2017 18:15:51 +0300
Subject: [Buildroot] [PATCH 2/2][v2] python-numpy: disable for ARCompact
In-Reply-To: <20171109151551.4858-1-didin@synopsys.com>
References: <20171109151551.4858-1-didin@synopsys.com>
Message-ID: <20171109151551.4858-3-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package fails when building for ARCompact due to toolchain issue.

Marking this with special comment "#ARC toolchain issues for ARCompact"
as the package is to be enabled as soon as the issue with the ARC toolchain is resolved.
Fixes:
        http://autobuild.buildroot.net/results/4c4/4c4eaa90335756448007ae3c5ae3839fb17d4442//

The same compiler error appears building "trousers" package for ARCompact. This package
is already disabled for ARC.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
-Removed duplicate entry in BR2_PACKAGE_PYTHON_NUMPY
-Now disables python-numpy accordingly to new format

 package/python-numpy/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 5abe04bde9..1405218b1c 100644
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
-- 
2.11.0
