From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 10:17:33 -0500
Subject: [Buildroot] [PATCH v2 5/7] package/libsemanage: libselinux depend
 >=gcc4.7
In-Reply-To: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
References: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180813151735.5297-5-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depend on at least gcc 4.7 when using libselinux as the
package is using ATOMICS.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libsemanage/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 7ee9c38606..44f4828e08 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_LIBSEMANAGE
 	# - audit is not available on musl
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
 	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_USTR
-- 
2.17.0
