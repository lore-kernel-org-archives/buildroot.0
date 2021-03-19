From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:33:50 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/logrotate: add
 SELinux refpolicy module
Message-ID: <20210319171640.480798829A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32275b09eb9dcf2f107a622ef1be4ce672742914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

SELinux support for logrotate is added by the admin/logrotate refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bc96eb72e7f48db7aec940c031c6f35520fcbbd3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/logrotate/logrotate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index df79da677e..4d1344c2cd 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -11,6 +11,7 @@ LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
 LOGROTATE_CPE_ID_VENDOR = logrotate_project
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
+LOGROTATE_SELINUX_MODULES = logrotate
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
