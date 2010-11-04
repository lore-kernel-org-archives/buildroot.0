From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  4 Nov 2010 03:50:27 +0100
Subject: [Buildroot] [PATCH 08/12] sysstat: bump to 9.1.5
In-Reply-To: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1288839031-24277-9-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/sysstat/sysstat.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 324580e..7294b86 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.0.5
+SYSSTAT_VERSION = 9.1.5
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
 SYSSTAT_AUTORECONF = NO
@@ -12,9 +12,7 @@ SYSSTAT_LIBTOOL_PATCH = NO
 SYSSTAT_INSTALL_STAGING = NO
 SYSSTAT_INSTALL_TARGET = YES
 
-# Should be --disable-man-group, it might be a little mistake in the
-# configure.in script.
-SYSSTAT_CONF_OPT = --enable-man-group
+SYSSTAT_CONF_OPT = --disable-man-group
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SYSSTAT_CONF_OPT += --disable-documentation
 endif
-- 
1.7.2.3
