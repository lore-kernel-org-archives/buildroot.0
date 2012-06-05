From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Jun 2012 16:36:28 +0200
Subject: [Buildroot] [git commit] collectd: fix dependencies for bind plugin
Message-ID: <20120605143657.8D0E596E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6457adf87b17c597761a503cfbee4923a3772ee8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bind plugin requires libcurl and libxml2.
These are properly selected but never added to COLLECTD_DEPENDENCIES.
Fix that.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/collectd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 0109f77..4404509 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -87,6 +87,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 
 COLLECTD_DEPENDENCIES = host-pkg-config \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
+	$(if $(BR2_PACKAGE_COLLECTD_BIND),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
