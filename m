From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 10:17:35 -0500
Subject: [Buildroot] [PATCH v2 7/7] package/setools: libselinux depend
 >=gcc4.7
In-Reply-To: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
References: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180813151735.5297-7-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depend on at least gcc 4.7 when using libselinux as the
package is using ATOMICS.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/setools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 0a7899b5eb..ef28b980a9 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_SETOOLS
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on BR2_USE_MMU
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libselinux use of __ATOMIC_*
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_NETWORKX # runtime
-- 
2.17.0
