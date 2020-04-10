From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Apr 2020 23:00:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/boinc: set curl-config
Message-ID: <20200410210025.738362-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build can fail because boinc uses curl-config that it founds on host:

checking for curl-config... /usr/bin/curl-config
checking for the version of libcurl... 7.47.0
checking for libcurl >= version 7.17.1... yes
checking whether libcurl is usable... no

Fixes:
 - http://autobuild.buildroot.org/results/26ab8024e3ef70b898981763f4ea89b647cc9f4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index d32b258ea7..a47ad9abe6 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -12,6 +12,7 @@ BOINC_LICENSE = LGPL-3.0+
 BOINC_LICENSE_FILES = COPYING COPYING.LESSER
 BOINC_DEPENDENCIES = host-pkgconf libcurl openssl
 BOINC_AUTORECONF = YES
+BOINC_CONF_ENV = ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
 BOINC_CONF_OPTS = \
 	--disable-apps \
 	--disable-boinczip \
-- 
2.25.1
