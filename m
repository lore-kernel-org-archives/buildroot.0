From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 15:55:07 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/lftp: fix build
 with host expat
Message-ID: <20190902135101.2FEDB8913F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6defbe2ddfd9952269d42eeae11f6cc3bef6bc00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11881

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d8011a09f741cde3e1c48edb637b91f31129a04b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lftp/lftp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 93a0bf5c32..b8a2b24302 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -25,6 +25,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_EXPAT)$(BR2_PACKAGE_LFTP_PROTO_HTTP),yy)
 LFTP_DEPENDENCIES += expat
+LFTP_CONF_OPTS += --with-expat=$(STAGING_DIR)/usr
+else
+LFTP_CONF_OPTS += --without-expat
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
