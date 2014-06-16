From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 15:23:31 -0300
Subject: [Buildroot] [PATCH 3/3] netatalk: add support for ACLs
In-Reply-To: <1402943011-12166-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402943011-12166-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1402943011-12166-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netatalk/netatalk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index ab628a4..e976990 100644
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
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_DBUS),yy)
 	NETATALK_DEPENDENCIES += avahi
 	NETATALK_CONF_OPT += --enable-zeroconf=$(STAGING_DIR)/usr
-- 
1.8.5.5
