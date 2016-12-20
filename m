From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 19 Dec 2016 19:05:14 -0500
Subject: [Buildroot] [PATCH 1/2] rsyslog: remove non-existent enable/disable
	systemd options
Message-ID: <20161220000515.7996-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configuration flags `--enable-systemd` and `--disable-systemd` do
not exist in rsyslog (and may have never existed; most likely copy-paste
from other packages which have said options); removing the options.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/rsyslog/rsyslog.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index a0875b7..9e74e49 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -66,11 +66,8 @@ endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 RSYSLOG_CONF_OPTS += \
-	--enable-systemd \
 	--with-systemdsystemunitdir=/usr/lib/systemd/system
 RSYSLOG_DEPENDENCIES += systemd
-else
-RSYSLOG_CONF_OPTS += --disable-systemd
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
-- 
2.8.4.windows.1
