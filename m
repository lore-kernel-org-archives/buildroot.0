From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 Mar 2020 18:26:49 -0600
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add optional systemd
 dependency
Message-ID: <20200330002649.36004-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
core/notifier.c:27:10: fatal error: systemd/sd-daemon.h: No such file or directory
   27 | #include <systemd/sd-daemon.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 237a44e233..2b51edb66d 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -110,6 +110,10 @@ SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SWUPDATE_DEPENDENCIES += systemd
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS),y)
 SWUPDATE_DEPENDENCIES += uboot-tools
 SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
-- 
2.20.1
