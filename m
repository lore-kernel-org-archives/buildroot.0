From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 22:23:22 +0200
Subject: [Buildroot] [git commit] package/openobex: disable doc build
Message-ID: <20170928201606.6A347810DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=647490012a64c7b497e129bc8db48d25e19a630e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openobex would need the host variant of xmlint (provided by host-
libxml2) to build the documentation.
To avoid this dependency we disable the build of the documentation.

Fixes
http://autobuild.buildroot.net/results/668/668ffb15f8c4faf0f4c462488dbb70b61386d465/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openobex/openobex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index d9d4db5..ea41f65 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -13,6 +13,7 @@ OPENOBEX_LICENSE = GPL-2.0+/LGPL-2.1+
 OPENOBEX_LICENSE_FILES = COPYING COPYING.LIB
 OPENOBEX_DEPENDENCIES = host-pkgconf
 OPENOBEX_INSTALL_STAGING = YES
+OPENOBEX_CONF_OPTS = -DBUILD_DOCUMENTATION=OFF
 
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 OPENOBEX_DEPENDENCIES += bluez_utils
