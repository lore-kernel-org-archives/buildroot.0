From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:37:31 +0100
Subject: [Buildroot] [git commit] collectd: add cpusleep plugin support
Message-ID: <20161223214639.F3A377FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c48707f48715e744b8bb3fd03d40509147c6aab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add explicit support for the new cpusleep dependency-less plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
