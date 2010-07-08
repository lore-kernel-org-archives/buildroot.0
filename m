From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] webkit: fix misc build issues
Message-ID: <20100708115824.4F2048269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9dd1a03a78adfd28cb1c1c1844af86bbae7eaff7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Webkit depends on libjpeg, so add it as a dependency. Webkit also uses
icu but fails to find it if we don't pass ac_cv_path_icu_config to its
./configure script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/webkit.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 39debd3..fc355ce 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -12,8 +12,9 @@ WEBKIT_INSTALL_TARGET = YES
 WEBKIT_LIBTOOL_PATCH = NO
 
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
-			libgtk2 sqlite enchant libsoup
+			libgtk2 sqlite enchant libsoup jpeg
 
+WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	WEBKIT_CONF_OPT += --with-target=x11
-- 
1.7.1
