From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 17 Apr 2015 13:23:00 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: fix procps-ng library name
Message-ID: <1429269780-107634-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

procps-ng libraries are now accesible on the same name as procps, thus
using the CUSTOM_PROCPS_NAME environment variable breaks compilation.

This fixes autobuild error 2a19f84c35de0ff008c2cd1aea96f6a4f2767ee1.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/openvmtools/openvmtools.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index f180f6f..ef6544a 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -33,7 +33,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
 OPENVMTOOLS_CONF_OPTS += --with-procps
-OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
 OPENVMTOOLS_DEPENDENCIES += procps-ng
 else
 OPENVMTOOLS_CONF_OPTS += --without-procps
-- 
1.7.10.4
