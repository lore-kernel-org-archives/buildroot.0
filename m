From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 15:03:53 -0300
Subject: [Buildroot] [PATCH 2/2] shared-mime-info: re-enable parallel builds
In-Reply-To: <1457719433-25900-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457719433-25900-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457719433-25900-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They don't seem to be causing any issues after many bumps and tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/shared-mime-info/shared-mime-info.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index aebc66b..b3e4470 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -11,7 +11,6 @@ SHARED_MIME_INFO_INSTALL_STAGING = YES
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-shared-mime-info libxml2 libglib2
 SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
-SHARED_MIME_INFO_MAKE = $(MAKE1)
 SHARED_MIME_INFO_LICENSE = GPLv2
 SHARED_MIME_INFO_LICENSE_FILES = COPYING
 
@@ -19,7 +18,6 @@ HOST_SHARED_MIME_INFO_DEPENDENCIES = \
 	host-pkgconf host-intltool host-libxml2 host-libglib2
 
 HOST_SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
-HOST_SHARED_MIME_INFO_MAKE = $(MAKE1)
 
 define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
-- 
2.4.10
