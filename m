From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:06:23 +0100
Subject: [Buildroot] [git commit] rsyslog: use the more traditional
	--{enable, disable}
Message-ID: <20150114211411.DCA6680D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20e0d97038b1158fb1e0b1c91ca4cddd9e79f843
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using --enable-<foo>={yes,no}, use
--{enable,disable}-<foo>, like we do in most other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/rsyslog.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index b13baec..fe28d2f 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -31,9 +31,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RSYSLOG_DEPENDENCIES += libgcrypt
 RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-RSYSLOG_CONF_OPTS += --enable-libgcrypt=yes
+RSYSLOG_CONF_OPTS += --enable-libgcrypt
 else
-RSYSLOG_CONF_OPTS += --enable-libgcrypt=no
+RSYSLOG_CONF_OPTS += --disable-libgcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
