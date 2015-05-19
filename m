From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 May 2015 12:13:17 +0300
Subject: [Buildroot] [PATCH v2] ntp: install after busybox
Message-ID: <a09a3696a8c28729f8806aa8a5bf01aa669d25f8.1432026797.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that ntp installs after busybox so that it overrides the busybox
provided ntpd applet.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   Don't depend on busybox when busybox is not enabled (Thomas P)
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 554094db1b3a..36fc53792061 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -7,7 +7,7 @@
 NTP_VERSION_MAJOR = 4.2
 NTP_VERSION = $(NTP_VERSION_MAJOR).8p2
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
-NTP_DEPENDENCIES = host-pkgconf libevent
+NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
-- 
2.1.4
