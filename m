From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:28:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: add SYSTEMD_CPE_ID_VENDOR
Message-ID: <20210304112855.1235660-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:freedesktop:systemd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Asystemd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 64f23c38a9..41332f207a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -8,6 +8,7 @@ SYSTEMD_VERSION = 247.3
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
+SYSTEMD_CPE_ID_VENDOR = freedesktop
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
-- 
2.30.0
