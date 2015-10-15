From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 22:37:46 -0300
Subject: [Buildroot] [PATCH] sane-backends: specify explicit path to
	net-snmp-config
Message-ID: <1444873066-10450-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise if the host distro has net-snmp devel files sane-backends will
find /usr/bin/net-snmp-config first and the build will break. Fixes:
http://autobuild.buildroot.net/results/c38/c381c316907964787ebe1a0807399022f15d8158/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sane-backends/sane-backends.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 0c0b5a9..e980929 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -39,6 +39,7 @@ SANE_BACKENDS_CONF_OPTS += --enable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
+SANE_BACKENDS_CONF_ENV += ac_cv_path_SNMP_CONFIG_PATH=$(STAGING_DIR)/usr/bin/net-snmp-config
 SANE_BACKENDS_DEPENDENCIES += netsnmp
 else
 SANE_BACKENDS_CONF_OPTS += --without-snmp
-- 
2.4.9
