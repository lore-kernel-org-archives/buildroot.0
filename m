From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:51 +0200
Subject: [Buildroot] [PATCH 17/50] package/busybox: invert dependency with
 psmisc
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <f3d0b3e8ac1187b4b2d8592c1f1fef81f6e89fa2.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/psmisc/psmisc.mk   | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3a19500ad3..d861e3c1ef 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_PSMISC),psmisc) \
 	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslogd) \
 	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
 	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3d9a80462d..3916e34b08 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -23,9 +23,4 @@ ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 PSMISC_CONF_OPTS = --disable-harden-flags
 endif
 
-# build after busybox, we prefer fat versions while we're at it
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-PSMISC_DEPENDENCIES += busybox
-endif
-
 $(eval $(autotools-package))
-- 
2.14.1
