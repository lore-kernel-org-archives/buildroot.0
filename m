From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 10:19:18 +0100
Subject: [Buildroot] [PATCH 1/7] shared-mime-info: host variant requires
	libxml2 and libglib2
In-Reply-To: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425028764-1146-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add to HOST_SHARED_MIME_INFO_DEPENDENCIES the missing dependencies
host-libxml2 and host-libglib2.

Also remove from SHARED_MIME_INFO_DEPENDENCIES dependencies already
present in HOST_SHARED_MIME_INFO_DEPENDENCIES.

Fix build failure:
configure: error: Package requirements ( libxml-2.0 >= 2.4 glib-2.0 >= 2.6.0) were not met

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/shared-mime-info/shared-mime-info.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 978cd31..80a9526 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -9,13 +9,14 @@ SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
-SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
+SHARED_MIME_INFO_DEPENDENCIES = host-shared-mime-info libxml2 libglib2
 SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
 SHARED_MIME_INFO_MAKE = $(MAKE1)
 SHARED_MIME_INFO_LICENSE = GPLv2
 SHARED_MIME_INFO_LICENSE_FILES = COPYING
 
-HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-intltool
+HOST_SHARED_MIME_INFO_DEPENDENCIES = \
+	host-pkgconf host-intltool host-libxml2 host-libglib2
 
 HOST_SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
 HOST_SHARED_MIME_INFO_MAKE = $(MAKE1)
-- 
2.3.0
