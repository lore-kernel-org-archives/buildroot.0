From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Feb 2014 12:26:29 -0300
Subject: [Buildroot] [PATCH] systemd: ditch autoreconf
Message-ID: <1393601189-17764-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It needs AM_PATH_LIBGCRYPT and will bail out if ALL_EXTRAS (libgcrypt)
isn't around - and it doesn't seem to be used at all.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/systemd/systemd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index bcdf95e..36ef704 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -23,8 +23,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSTEMD_DEPENDENCIES += busybox
 endif
 
-SYSTEMD_AUTORECONF = YES
-
 SYSTEMD_CONF_OPT += \
 	--with-rootprefix= \
 	--with-rootlibdir=/lib \
-- 
1.8.3.2
