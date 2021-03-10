From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 10 Mar 2021 10:14:51 +0100
Subject: [Buildroot] [PATCH v2 4/6] package/openal: disable package if
 binutils is affected from bug 27100
In-Reply-To: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210310091453.23611-5-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/c05/c053b9e191b31f0b1f8f8c902b602e187f714dc0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/openal/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openal/Config.in b/package/openal/Config.in
index 6b0e9973db..def95222de 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_OPENAL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
 	help
 	  OpenAL provides capabilities for playing audio in a virtual
 	  3D environment. Distance attenuation, doppler shift, and
@@ -31,4 +32,5 @@ comment "openal needs a toolchain w/ NPTL, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
-- 
2.25.1
