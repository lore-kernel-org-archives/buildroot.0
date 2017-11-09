From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu,  9 Nov 2017 18:15:50 +0300
Subject: [Buildroot] [PATCH 1/2] python-numpy: reformat config
In-Reply-To: <20171109151551.4858-1-didin@synopsys.com>
References: <20171109151551.4858-1-didin@synopsys.com>
Message-ID: <20171109151551.4858-2-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS variable layout going to be
inconvenient and ugly for adding new architectures or restricting specific
architectures. Lets reformat layout of this variable.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/Config.in | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 859542f584..5abe04bde9 100644
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
-- 
2.11.0
