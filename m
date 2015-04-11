From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 09:52:15 +0200
Subject: [Buildroot] [PATCH 1/3] package/rsyslog: Autoreconf is not
	necessary anymore
Message-ID: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot contains no patches for this package anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rsyslog/rsyslog.mk |    2 --
 1 file changed, 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index c6758eb..7d49ed1 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -16,8 +16,6 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
-# For mysql and pgsql support patches
-RSYSLOG_AUTORECONF = YES
 
 # Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.10.4
