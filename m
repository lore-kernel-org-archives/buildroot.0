From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 23 Sep 2017 22:47:54 +0300
Subject: [Buildroot] [PATCH] libidn: fix build without makeinfo
Message-ID: <583676ae200bd379b846d5ccdcc5a2aafa4aad18.1506196074.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails when the makeinfo utility is not installed on the host.

Fixes:
http://autobuild.buildroot.net/results/dfd/dfdfb34ed81ba3a4b7a7271be482e75eca849dbf/
http://autobuild.buildroot.net/results/b33/b33c0b0e6b1033ab1d1294a91b869ee6adcd391a/
http://autobuild.buildroot.net/results/940/9401cc10f6da6a2e3453ebc65ce573c370733fb5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libidn/libidn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 420b8dfb911a..b50a8b622f2d 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -7,7 +7,7 @@
 LIBIDN_VERSION = 1.33
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
-LIBIDN_CONF_ENV = EMACS="no"
+LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
-- 
2.14.1
