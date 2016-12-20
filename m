From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 10:09:58 +0100
Subject: [Buildroot] [git commit] rsyslog: remove non-existent
	enable/disable systemd options
Message-ID: <20161220091252.277D280AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d505b87f6858e3adb61adaa2ed757d94e8664ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configuration flags `--enable-systemd` and `--disable-systemd` do
not exist in rsyslog (and may have never existed; most likely copy-paste
from other packages which have said options); removing the options.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
