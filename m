From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Apr 2012 21:59:05 +0200
Subject: [Buildroot] [git commit] netatalk: fix build with cups support
Message-ID: <20120430210141.BDBB596C2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2816df90307429bc7a6d5b6bba1961ad395bcd2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netatalk/netatalk.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 8544026..4f0ec09 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -20,6 +20,7 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
+	NETATALK_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
 	NETATALK_CONF_OPT += --enable-cups
 else
 	NETATALK_CONF_OPT += --disable-cups
