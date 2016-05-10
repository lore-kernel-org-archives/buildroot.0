From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 May 2016 20:40:19 +0200
Subject: [Buildroot] [PATCH 2/6] package/kodi-visualisation-shadertoy: needs
	libplatform
In-Reply-To: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
References: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1462905623-17739-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

Makefile:477: *** libplatform is in the dependency chain of
 kodi-visualisation-shadertoy that has added it to its _DEPENDENCIES
 variable without selecting it or depending on it from Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-shadertoy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index 10a6e55..3b981d0 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Shadertoy visualiser for Kodi
 
-- 
2.8.1
