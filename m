From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] webkit: fix dependencies on host
	tools flex and gperf
Message-ID: <20100128150633.DB7C877719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f7a6cfc22500b5d9d4057d74ac6f4f238780848d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
