From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Thu, 05 Mar 2015 20:38:38 +0100
Subject: [Buildroot] [PATCH] cups: Fix dependency check
Message-ID: <54F8B0BE.2060800@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---

 package/cups/cups.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index cc87574..b6a0663 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -34,7 +34,7 @@ else
 	CUPS_CONF_OPTS += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 	CUPS_DEPENDENCIES += xlib_libX11
 endif
 
