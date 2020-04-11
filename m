From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 09:48:58 +0200
Subject: [Buildroot] [git commit] package/boinc: set curl-config
Message-ID: <20200411073743.9E89F89150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=546d280b24e6fc5019555a7ad0e9653f604c40c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build can fail because boinc uses curl-config that it founds on host:

checking for curl-config... /usr/bin/curl-config
checking for the version of libcurl... 7.47.0
checking for libcurl >= version 7.17.1... yes
checking whether libcurl is usable... no

Fixes:
 - http://autobuild.buildroot.org/results/26ab8024e3ef70b898981763f4ea89b647cc9f4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
