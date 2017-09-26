From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Sep 2017 19:20:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/openobex: disable doc build
Message-ID: <20170926172040.25551-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openobex would need the host variant of xmlint (provided by host-
libxml2) to build the documentation.
To avoid this dependency we disable the build of the documentation.

Fixes
http://autobuild.buildroot.net/results/668/668ffb15f8c4faf0f4c462488dbb70b61386d465/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openobex/openobex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index d9d4db5609..ea41f65a80 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -13,6 +13,7 @@ OPENOBEX_LICENSE = GPL-2.0+/LGPL-2.1+
 OPENOBEX_LICENSE_FILES = COPYING COPYING.LIB
 OPENOBEX_DEPENDENCIES = host-pkgconf
 OPENOBEX_INSTALL_STAGING = YES
+OPENOBEX_CONF_OPTS = -DBUILD_DOCUMENTATION=OFF
 
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 OPENOBEX_DEPENDENCIES += bluez_utils
-- 
2.11.0
