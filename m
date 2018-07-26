From: Ryan Coe <bluemrp9@gmail.com>
Date: Thu, 26 Jul 2018 09:37:02 -0700
Subject: [Buildroot] [PATCH v2 2/3] mariadb: needs dynamic library support
In-Reply-To: <20180726163703.7598-1-bluemrp9@gmail.com>
References: <20180726163703.7598-1-bluemrp9@gmail.com>
Message-ID: <20180726163703.7598-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mysql/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 278dc73e57..abda1880f2 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -17,6 +17,7 @@ choice
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS #dlopen
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NCURSES
@@ -70,6 +71,10 @@ config BR2_PACKAGE_PROVIDES_MYSQL
 
 endif
 
+comment "mariadb needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS
+
 comment "mysql needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.18.0
