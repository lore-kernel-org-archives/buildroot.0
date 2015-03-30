From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 17:43:37 -0300
Subject: [Buildroot] [PATCH 2/3] libgtk2: drop libxcomposite duplicate dep
In-Reply-To: <1427748218-24477-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427748218-24477-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427748218-24477-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's got a mandatory dependency on libxcomposite and an autodep on it.
AFAIK it's mandatory so drop the autodep.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 39c629c..ceb4864 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -111,10 +111,6 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
 	LIBGTK2_DEPENDENCIES += xlib_libXfixes
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
-	LIBGTK2_DEPENDENCIES += xlib_libXcomposite
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
 	LIBGTK2_DEPENDENCIES += xlib_libXdamage
 endif
-- 
2.0.5
