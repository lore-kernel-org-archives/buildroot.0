From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 10:17:34 -0500
Subject: [Buildroot] [PATCH v2 6/7] package/restorecond: libselinux depend
 >=gcc4.7
In-Reply-To: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
References: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180813151735.5297-6-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depend on at least gcc 4.7 when using libselinux as the
package is using ATOMICS.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/restorecond/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
index 54a5545a12..58718e28d8 100644
--- a/package/restorecond/Config.in
+++ b/package/restorecond/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_RESTORECOND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on !BR2_STATIC_LIBS # libselinux
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBGLIB2
-- 
2.17.0
