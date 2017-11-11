From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:26:42 +0100
Subject: [Buildroot] [git commit] python-numpy: reformat
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
Message-ID: <20171111221932.D83DE80FAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=855002f22b4795b7ff3e37880c3ed65011cd036c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS variable layout going
to be inconvenient and ugly for adding new architectures or
restricting specific architectures. Lets reformat layout of this
variable.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/Config.in | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 859542f..5abe04b 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,9 +1,17 @@
 config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	bool
 	# Numpy has some CPU specific code
-	default y if BR2_arc || BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
-		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
-		|| BR2_sh || BR2_x86_64
+	default y if BR2_arc 
+	default y if BR2_aarch64
+	default y if BR2_arm 
+	default y if BR2_armeb
+	default y if BR2_i386 
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_powerpc
+	default y if BR2_powerpc64 
+	default y if BR2_sh 
+	default y if BR2_x86_64
 
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
