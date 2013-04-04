From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Apr 2013 07:32:21 -0300
Subject: [Buildroot] [PATCH] sysstat: needs host-gettext
Message-ID: <1365071541-4122-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/50182a661367af1a9c09f510c672fb3a144cd869/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 0513998..d211f9c 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -8,6 +8,7 @@ SYSSTAT_VERSION = 10.0.3
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
+SYSSTAT_DEPENDENCIES = host-gettext
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext
-- 
1.8.1.5
