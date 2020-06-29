From: Julien Olivain <juju@cotds.org>
Date: Mon, 29 Jun 2020 23:07:34 +0200
Subject: [Buildroot] [PATCH 3/4] package/poco: enable build for riscv64
In-Reply-To: <20200629210735.179913-1-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
Message-ID: <20200629210735.179913-3-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Poco riscv64 support was added upstream in commit:
https://github.com/pocoproject/poco/commit/26fa1b9e6bbe3a5d2d559d0e8bd5772a4e8fdfef
which is included in version >= 1.10.0.

This patch enable build for riscv64.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/poco/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index b6914539e3..a3d19d5640 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_POCO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_riscv || BR2_xtensa)
+		|| BR2_or1k || (BR2_riscv && !BR2_RISCV_64) \
+		|| BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -88,4 +89,5 @@ comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 5 w
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_riscv || BR2_xtensa)
+		|| BR2_or1k || (BR2_riscv && !BR2_RISCV_64) \
+		|| BR2_xtensa)
-- 
2.26.2
