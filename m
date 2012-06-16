From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 16 Jun 2012 21:54:10 +0200
Subject: [Buildroot] [git commit] monit: fix configuration error
Message-ID: <20120616200449.0EAD996F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5832382a18e285376e9a519e3fbfd6436e42a73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configuration fails for the monit package, with the following error.

  checking for SSL library directory... Not found

  Couldn't find your SSL library files.
  Use --with-ssl-lib-dir option to fix this problem or disable the
  SSL support with --without-ssl

Tweak the monit configuration command line so that openssl is found.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/monit/monit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
