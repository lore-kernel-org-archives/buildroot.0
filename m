From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 13:23:28 +0200
Subject: [Buildroot] [git commit] package/log4qt: add telnet optional logging
Message-ID: <20210511105529.1990E81076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=863378ed27ef83d3254249bb22ba45dac88cb5ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Telnet logging is an optional feature that's disabled by default.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4qt/log4qt.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/log4qt/log4qt.mk b/package/log4qt/log4qt.mk
index 0594427cf7..7144d33e33 100644
--- a/package/log4qt/log4qt.mk
+++ b/package/log4qt/log4qt.mk
@@ -22,4 +22,10 @@ else
 LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_NETWORK),y)
+LOG4QT_CONF_OPTS += -DBUILD_WITH_TELNET_LOGGING=ON
+else
+LOG4QT_CONF_OPTS += -DBUILD_WITH_TELNET_LOGGING=OFF
+endif
+
 $(eval $(cmake-package))
