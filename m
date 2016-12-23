From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:32:21 +0100
Subject: [Buildroot] [git commit] collectd: add notify_nagios plugin support
Message-ID: <20161223214639.C106281765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d6dd49e60250f788c3d35b3982c3b0252143d56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add explicit support for the new notify_nagios dependency-less plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 6405af6..72e5793 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -75,6 +75,11 @@ config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 comment "notify_email needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_COLLECTD_NOTIFY_NAGIOS
+	bool "notify_nagios"
+	help
+	  Sends notifications to Nagios as a passive check result.
+
 config BR2_PACKAGE_COLLECTD_SYSLOG
 	bool "syslog"
 	default y
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index ccb2f11..942ba38 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -77,6 +77,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_NGINX),--enable-nginx,--disable-nginx) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFICATION),--enable-target_notification,--disable-target_notification) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),--enable-notify_email,--disable-notify_email) \
+	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_NAGIOS),--enable-notify_nagios,--disable-notify_nagios) \
 	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),--enable-openldap,--disable-openldap) \
