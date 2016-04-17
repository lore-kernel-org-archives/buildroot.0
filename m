From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:17:11 +0200
Subject: [Buildroot] [git commit] package/freeswitch: add optional
	dependency to openldap
Message-ID: <20160417201717.8B7D881983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b52f8f8dbaee1cc568584a6f76169bb7e2a11a3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 0544e9e..41ad39a 100644
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
