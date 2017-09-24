From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:46:20 +0200
Subject: [Buildroot] [git commit] package/ngircd: add optional dependency to
	openssl
Message-ID: <20170924114002.21C807FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bda664765b808228b1c8b6434e23cf32ef75c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ngircd/ngircd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 5f03b66..2ab9187 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -11,4 +11,11 @@ NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
+NGIRCD_DEPENDENCIES += openssl
+else
+NGIRCD_CONF_OPTS += --without-openssl
+endif
+
 $(eval $(autotools-package))
