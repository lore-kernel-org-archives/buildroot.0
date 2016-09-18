From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:36:04 +0200
Subject: [Buildroot] [git commit] package/php: set MySQL socket path
Message-ID: <20160918175031.1A54681F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=411cb66acdca6bf74db52e652788f61c6d978c01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set the PHP default MySQL socket path to match what the
mysql package is using.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 083b451..b1b19ad 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -211,6 +211,11 @@ PHP_DEPENDENCIES += unixodbc
 endif
 endif
 
+ifneq ($(BR2_PACKAGE_PHP_EXT_MYSQLI)$(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),)
+# Set default MySQL unix socket to what the MySQL server is using by default
+PHP_CONF_OPTS += --with-mysql-sock=$(MYSQL_SOCKET)
+endif
+
 define PHP_DISABLE_PCRE_JIT
 	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
 endef
