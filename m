From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Apr 2016 17:24:48 +0200
Subject: [Buildroot] [PATCH v15 26/27] package/freeswitch: add optional
	dependency to openldap
In-Reply-To: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460906689-29900-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 5603b1f..9c4abe0 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -231,6 +231,11 @@ FREESWITCH_DEPENDENCIES += lua
 FREESWITCH_ENABLED_MODULES += languages/mod_lua
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+FREESWITCH_DEPENDENCIES += openldap
+FREESWITCH_ENABLED_MODULES += directories/mod_ldap xml_int/mod_xml_ldap
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 FREESWITCH_DEPENDENCIES += opus
 FREESWITCH_ENABLED_MODULES += codecs/mod_opus
-- 
2.8.0.rc3
