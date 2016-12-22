From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:14 -0300
Subject: [Buildroot] [PATCH 07/14] collectd: add cpusleep plugin support
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-7-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add explicit support for the new cpusleep dependency-less plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 5e84aa5..d1b85aa 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -157,6 +157,11 @@ config BR2_PACKAGE_COLLECTD_CPUFREQ
 	help
 	  Collects the current CPU's frequency.
 
+config BR2_PACKAGE_COLLECTD_CPUSLEEP
+	bool "cpusleep"
+	help
+	  Measures time spent by CPU in deep sleep mode.
+
 config BR2_PACKAGE_COLLECTD_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5018fb0..d8b2576 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -41,6 +41,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_CONTEXTSWITCH),--enable-contextswitch,--disable-contextswitch) \
 	$(if $(BR2_PACKAGE_COLLECTD_CPU),--enable-cpu,--disable-cpu) \
 	$(if $(BR2_PACKAGE_COLLECTD_CPUFREQ),--enable-cpufreq,--disable-cpufreq) \
+	$(if $(BR2_PACKAGE_COLLECTD_CPUSLEEP),--enable-cpusleep,--disable-cpusleep) \
 	$(if $(BR2_PACKAGE_COLLECTD_CSV),--enable-csv,--disable-csv) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),--enable-curl,--disable-curl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),--enable-curl_json,--disable-curl_json) \
-- 
2.10.2
