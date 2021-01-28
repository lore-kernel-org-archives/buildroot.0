From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:56 +0100
Subject: [Buildroot] [PATCH 8/9] package/logrotate: add SELinux refpolicy
 module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-9-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SELinux support for logrotate is added by the admin/logrotate refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/logrotate/logrotate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 747d8c2930..3614298f3a 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -10,6 +10,7 @@ LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
 LOGROTATE_CPE_ID_VALID = YES
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
+LOGROTATE_SELINUX_MODULES = logrotate
 # tarball does not have a generated configure script
 LOGROTATE_AUTORECONF = YES
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
-- 
2.25.4
