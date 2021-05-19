From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 May 2021 09:01:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/nbd: add CPE variables
Message-ID: <20210519070128.1635309-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:network_block_device_project:network_block_device is a valid
CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetwork_block_device_project%3Anetwork_block_device

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nbd/nbd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 5fd5555510..6c77bffdfe 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -11,6 +11,8 @@ NBD_CONF_OPTS = --enable-lfs
 NBD_DEPENDENCIES = host-pkgconf libglib2
 NBD_LICENSE = GPL-2.0
 NBD_LICENSE_FILES = COPYING
+NBD_CPE_ID_VENDOR = network_block_device_project
+NBD_CPE_ID_PRODUCT = network_block_device
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # We have linux/falloc.h
-- 
2.30.2
