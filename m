From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 May 2013 13:24:48 +0200
Subject: [Buildroot] [git commit] linknx: fix dependencies
Message-ID: <20130513112616.A5B4B9A1A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=065183044758455044b593104393047a002fa7ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mysql_client is set instead of added, thus eliminating libpthsem.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linknx/linknx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 54e0426..701eabf 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -15,7 +15,7 @@ LINKNX_DEPENDENCIES = libpthsem
 
 ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
 LINKNX_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
-LINKNX_DEPENDENCIES = mysql_client
+LINKNX_DEPENDENCIES += mysql_client
 else
 LINKNX_CONF_OPT += --without-mysql
 endif
