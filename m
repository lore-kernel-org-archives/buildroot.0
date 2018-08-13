From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 10:17:31 -0500
Subject: [Buildroot] [PATCH v2 3/7] package/busybox: libselinux depend
 >=gcc4.7
In-Reply-To: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
References: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180813151735.5297-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depend on at least gcc 4.7 when using libselinux as the
package is using ATOMICS.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/busybox/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index e5c5f89a4d..ff96b3aadb 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
 	select BR2_PACKAGE_LIBSELINUX
 	help
 	  Enable SELinux support in BusyBox. Please note that
-- 
2.17.0
