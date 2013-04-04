From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Apr 2013 22:48:17 +0200
Subject: [Buildroot] [git commit] sysstat: needs host-gettext
Message-ID: <20130404205334.875AF9B4BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5fc984e15a292a61226142c8d1c18674d44a6ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/50182a661367af1a9c09f510c672fb3a144cd869/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sysstat/sysstat.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
