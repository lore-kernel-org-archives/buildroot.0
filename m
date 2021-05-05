From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed,  5 May 2021 21:22:10 +0200
Subject: [Buildroot] [PATCH] package/log4qt: add telnet optional logging
Message-ID: <20210505192210.1354164-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Telnet logging is an optional feature that's disabled by default.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/log4qt/log4qt.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/log4qt/log4qt.mk b/package/log4qt/log4qt.mk
index b01d9c6611..29b533503b 100644
--- a/package/log4qt/log4qt.mk
+++ b/package/log4qt/log4qt.mk
@@ -17,4 +17,10 @@ else
 LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_NETWORK),y)
+LOG4QT_CONF_OPTS += -DBUILD_WITH_TELNET_LOGGING=ON
+else
+LOG4QT_CONF_OPTS += -DBUILD_WITH_TELNET_LOGGING=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.31.1
