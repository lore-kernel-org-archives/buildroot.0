From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 22:38:41 +0100
Subject: [Buildroot] [git commit] samba4: drop --with-gettext configure
	option
Message-ID: <20160325214308.B09C681D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5977118cdd07e12c099c9aa6623aaa4860cdd79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --with-gettext=X configure option was silently dropped from the
4.4.0 release and it errors out since it's unknown. Fixes:
http://autobuild.buildroot.net/results/3c0/3c0800fd6cc7a217a866cd9cf63d5f91dcbfd306/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9f7b11d..5bacbc3 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -48,7 +48,6 @@ SAMBA4_CONF_OPTS += --without-fam
 endif
 
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
-SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
 SAMBA4_DEPENDENCIES += gettext
 else
 SAMBA4_CONF_OPTS += --without-gettext
