From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 Aug 2014 08:57:37 +0200
Subject: [Buildroot] [PATCH 1/1] php: add pdo_pgsql extension
In-Reply-To: <1407603996-13837-1-git-send-email-bos@je-eigen-domein.nl>
References: <1407603996-13837-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <765bdf50-1723-4e47-b0e7-ac9cc46b8c6b@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris Bos <bos@je-eigen-domein.nl> schreef:
>Adds support for the PDO PostgreSQL extension to the PHP package.
>
>Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>---
> package/php/Config.ext                | 10 ++++++++
> package/php/php-04-no-pg-config.patch | 46 +++++++++++++++++++++++++++++++++++
> package/php/php.mk                    |  4 +++
> 3 files changed, 60 insertions(+)
> create mode 100644 package/php/php-04-no-pg-config.patch
>
>diff --git a/package/php/Config.ext b/package/php/Config.ext
>index 078be8d..cb25d26 100644
>--- a/package/php/Config.ext
>+++ b/package/php/Config.ext
>@@ -135,6 +135,16 @@ comment "MySQL drivers need a toolchain w/ C++"
> 	depends on BR2_USE_MMU
> 	depends on !BR2_INSTALL_LIBSTDCPP
> 
>+config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
>+	bool "PostgreSQL"
>+	depends on BR2_TOOLCHAIN_USES_GLIBC
>+	select BR2_PACKAGE_POSTGRESQL
>+	help
>+	  PDO driver for PostgreSQL
>+
>+comment "PostgreSQL needs glibc toolchain"
>+	depends on !BR2_TOOLCHAIN_USES_GLIBC

This should be: 'needs an (e)glibc toolchain' I believe. Double check the manual...
