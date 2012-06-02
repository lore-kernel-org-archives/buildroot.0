From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  2 Jun 2012 11:37:13 -0300
Subject: [Buildroot] [PATCH] collectd: fix dependencies for bind plugin
Message-ID: <1338647833-26267-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bind plugin requires libcurl and libxml2.
These are properly selected but never added to COLLECTD_DEPENDENCIES.
Fix that.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
