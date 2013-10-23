From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2013 00:44:13 +0200
Subject: [Buildroot] [git commit] php: fix runtime error on big endian
Message-ID: <20131023224545.0EC489BB7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21a4a9003e3acc161f0ae95c23ad44bad0250881
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #6566

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 92665b4..e310bd6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -19,6 +19,11 @@ PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--with-config-file-path=/etc \
 		--localstatedir=/var \
 		--disable-rpath
+ifeq ($(BR2_ENDIAN),"BIG")
+PHP_CONF_ENV = ac_cv_c_bigendian_php=yes
+else
+PHP_CONF_ENV = ac_cv_c_bigendian_php=no
+endif
 PHP_CONFIG_SCRIPTS = php-config
 
 PHP_CFLAGS = $(TARGET_CFLAGS)
