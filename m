From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:20:54 +0200
Subject: [Buildroot] [PATCH 01/20] webkit: fix misc build issues
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9dd1a03a78adfd28cb1c1c1844af86bbae7eaff7.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
