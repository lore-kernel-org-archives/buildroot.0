From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 10:17:30 -0500
Subject: [Buildroot] [PATCH v2 2/7] package/android-tools: libselinux depend
 >=gcc4.7
In-Reply-To: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
References: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180813151735.5297-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depend on at least gcc 4.7 when using libselinux as the
package is using ATOMICS.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/android-tools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 96e36e6cd7..7f0c2784ae 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -38,6 +38,8 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	depends on !BR2_STATIC_LIBS # libselinux
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_ZLIB
-- 
2.17.0
