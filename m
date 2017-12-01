From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:39:07 +0100
Subject: [Buildroot] [git commit] package/linknx: add lua as optional
 dependency
Message-ID: <20171201213207.D8453815FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c32968def5a09bf318a28a025690ed5719994a9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linknx/linknx.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 7965ce4..dfabef5 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -9,7 +9,6 @@ LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
 LINKNX_INSTALL_STAGING = YES
 LINKNX_CONF_OPTS = \
-	--without-lua \
 	--without-log4cpp \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr \
@@ -25,6 +24,13 @@ else
 LINKNX_CONF_OPTS += --without-libcurl
 endif
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+LINKNX_CONF_OPTS += --with-lua
+LINKNX_DEPENDENCIES += lua
+else
+LINKNX_CONF_OPTS += --without-lua
+endif
+
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 LINKNX_DEPENDENCIES += mysql
