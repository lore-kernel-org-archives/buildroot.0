From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Feb 2021 14:54:31 +0100
Subject: [Buildroot] [PATCH 3/4] package/collectd: add 'logparser' option
In-Reply-To: <20210216135432.4830-1-patrickdepinguin@gmail.com>
References: <20210216135432.4830-1-patrickdepinguin@gmail.com>
Message-ID: <20210216135432.4830-4-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The logparser plugin is new since 5.11.0 and enabled by default in
collectd.

Add an option in Buildroot, disabled by default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.26.2
