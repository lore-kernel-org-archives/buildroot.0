From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 15:23:29 -0300
Subject: [Buildroot] [PATCH 1/3] netatalk: bump to version 3.1.2
Message-ID: <1402943011-12166-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netatalk/netatalk.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index e5e5c6b..1285af2 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.0.8
+NETATALK_VERSION = 3.1.2
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 NETATALK_AUTORECONF = YES
@@ -27,7 +27,8 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--without-kerberos \
 	--without-pam \
 	--with-libevent=no \
-	--with-dtrace=no
+	--with-dtrace=no \
+	--with-mysql-config=no
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
-- 
1.8.5.5
