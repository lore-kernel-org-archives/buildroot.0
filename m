From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:46:20 +0200
Subject: [Buildroot] [git commit] package/ngircd: add optional support for
	linux-pam
Message-ID: <20170924114002.618D67FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13755ca3056e4793e483c2ec634c06ac017088d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ngircd/ngircd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 9fa30da..37c4f87 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -10,6 +10,13 @@ NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+NGIRCD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
+NGIRCD_DEPENDENCIES += linux-pam
+else
+NGIRCD_CONF_OPTS += --with-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 NGIRCD_DEPENDENCIES += openssl
