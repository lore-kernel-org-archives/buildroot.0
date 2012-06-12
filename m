From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 12 Jun 2012 09:27:15 +0100
Subject: [Buildroot] [PATCH] monit: fix configuration error
Message-ID: <1339489635-11299-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Configuration fails for the monit package, with the following error.

  checking for SSL library directory... Not found

  Couldn't find your SSL library files.
  Use --with-ssl-lib-dir option to fix this problem or disable the
  SSL support with --without-ssl

Tweak the monit configuration command line so that openssl is found.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/monit/monit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 958618d..11bc7e1 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -15,7 +15,7 @@ MONIT_CONF_OPT += \
 	--without-pam
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONIT_CONF_OPT += --with-ssl
+MONIT_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr
 MONIT_DEPENDENCIES += openssl
 else
 MONIT_CONF_OPT += --without-ssl
-- 
1.7.9.5
