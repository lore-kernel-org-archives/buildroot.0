From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Feb 2015 13:03:16 +0100
Subject: [Buildroot] [PATCH next 1/1] package/portaudio: Remove threads
	dependency for alsa module
Message-ID: <1425124996-17097-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Portaudio as a whole already depends on threads support, so there is no
need to have an additional dependency for its alsa module.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/portaudio/Config.in |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index eaf095c..252a92a 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -15,7 +15,6 @@ if BR2_PACKAGE_PORTAUDIO
 config BR2_PACKAGE_PORTAUDIO_ALSA
 	bool "alsa support"
 	select BR2_PACKAGE_ALSA_LIB
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	default y
 	help
 	  Compile with ALSA support.
-- 
1.7.10.4
