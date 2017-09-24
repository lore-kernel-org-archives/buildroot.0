From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:46:20 +0200
Subject: [Buildroot] [git commit] package/ngircd: add optional support for
	gnutls
Message-ID: <20170924114002.3E2A37FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9131507795eed56261a31b91e91f51a6ad1b2869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl and gnutls can not be enabled at the same time:
https://github.com/ngircd/ngircd/blob/master/configure.ng#L449

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ngircd/ngircd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 2ab9187..06318a9 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -16,6 +16,12 @@ NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 NGIRCD_DEPENDENCIES += openssl
 else
 NGIRCD_CONF_OPTS += --without-openssl
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+NGIRCD_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
+NGIRCD_DEPENDENCIES += gnutls
+else
+NGIRCD_CONF_OPTS += --without-gnutls
+endif
 endif
 
 $(eval $(autotools-package))
