From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 22:32:48 +0100
Subject: [Buildroot] [git commit] package/sysstat: enable lm-sensors support
Message-ID: <20201223211604.B43318221E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c428aaa10a034b994e6297828c33e7abca5ceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 8e627f2e96..7d254d6643 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -7,9 +7,16 @@
 SYSSTAT_VERSION = 12.4.2
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
-SYSSTAT_CONF_OPTS = --disable-file-attr --disable-sensors
+SYSSTAT_CONF_OPTS = --disable-file-attr
 SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
+SYSSTAT_DEPENDENCIES += lm-sensors
+SYSSTAT_CONF_OPTS += --enable-sensors
+else
+SYSSTAT_CONF_OPTS += --disable-sensors
+endif
+
 $(eval $(autotools-package))
