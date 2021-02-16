From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 20:56:02 +0100
Subject: [Buildroot] [git commit branch/next] package/collectd: add
 'logparser' option
Message-ID: <20210216193457.B3AC88157B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe74c2b846ec19c7964a24ce81ee28a37aba5366
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The logparser plugin is new since 5.11.0 and enabled by default in
collectd.

Add an option in Buildroot, disabled by default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 11136f98ef..679285d997 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -326,6 +326,11 @@ config BR2_PACKAGE_COLLECTD_LOAD
 	help
 	  Collects the system load.
 
+config BR2_PACKAGE_COLLECTD_LOGPARSER
+	bool "logparser"
+	help
+	  Plugin for filtering and parsing log messages.
+
 config BR2_PACKAGE_COLLECTD_MD
 	bool "md"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 792eb9c355..d57e6b8c1d 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -91,6 +91,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_IRQ),--enable-irq,--disable-irq) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOAD),--enable-load,--disable-load) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
+	$(if $(BR2_PACKAGE_COLLECTD_LOGPARSER),--enable-logparser,--disable-logparser) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),--enable-log_logstash,--disable-log_logstash) \
 	$(if $(BR2_PACKAGE_COLLECTD_LUA),--enable-lua,--disable-lua) \
 	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
