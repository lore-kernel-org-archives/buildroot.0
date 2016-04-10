From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 11:41:36 +0200
Subject: [Buildroot] [PATCH v12 28/31] package/freeswitch: add optional
	dependency to openldap
In-Reply-To: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460281299-2385-29-git-send-email-bernd.kuhls@t-online.de>
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
index b80c49d..54d7d14 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -220,6 +220,11 @@ FREESWITCH_DEPENDENCIES += lua
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
