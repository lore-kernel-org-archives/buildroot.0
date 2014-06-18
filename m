From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:19:58 +0200
Subject: [Buildroot] [git commit] netatalk: add support for ACLs
Message-ID: <20140618123420.50C239D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eba9e55baef7fc3c7b3600bf755ecfdb7604b6d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index f13fdf3..2786f92 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -29,6 +29,12 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-dtrace=no \
 	--with-mysql-config=no
 
+ifeq ($(BR2_PACKAGE_ACL),y)
+	NETATALK_DEPENDENCIES += acl
+else
+	NETATALK_CONF_OPT += --with-acls=no
+endif
+
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 	NETATALK_DEPENDENCIES += avahi
 	NETATALK_CONF_OPT += --enable-zeroconf=$(STAGING_DIR)/usr
