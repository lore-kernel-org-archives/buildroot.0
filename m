From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 17:07:07 +0100
Subject: [Buildroot] [git commit] shared-mime-info: re-enable parallel builds
Message-ID: <20160314160806.3DE827FFDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfb56011fbe37a6c61c537d7c0d1fbe26996e43a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They don't seem to be causing any issues after many bumps and tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
