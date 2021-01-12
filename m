From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Jan 2021 08:12:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/ntp: add CPE variables
Message-ID: <20210112071213.1504698-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ntp:ntp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Antp%3Antp

Also add NTP_CPE_ID_VERSION and NTP_CPE_ID_VERSION_MINOR

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntp/ntp.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index f82eeae9b4..1a86b49758 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p15
+NTP_VERSION_MAJOR = 4.2.8
+NTP_VERSION = $(NTP_VERSION_MAJOR)p15
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP
 NTP_LICENSE_FILES = COPYRIGHT
+NTP_CPE_ID_VENDOR = $(NTP_NAME)
+NTP_CPE_ID_VERSION = $(NTP_VERSION_MAJOR)
+NTP_CPE_ID_VERSION_MINOR = p15
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
 NTP_CONF_OPTS = \
 	--with-shared \
-- 
2.29.2
