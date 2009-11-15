From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 11:12:57 +0100
Subject: [Buildroot] [PATCH 8/8] webkit: fix dependencies on host tools flex
	and gperf
In-Reply-To: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258279977-1482-9-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/webkit/webkit.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 01baa27..389a5fc 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -11,8 +11,8 @@ WEBKIT_INSTALL_STAGING = YES
 WEBKIT_INSTALL_TARGET = YES
 WEBKIT_LIBTOOL_PATCH = NO
 
-WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite enchant \
-			libsoup
+WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
+			libgtk2 sqlite enchant libsoup
 
 ifeq ($(BR2_PACKAGE_WEBKIT_X11),y)
 WEBKIT_CONF_OPT = --with-target=x11
-- 
1.6.5.2
