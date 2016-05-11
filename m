From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 16:02:13 +0200
Subject: [Buildroot] [git commit] package/kodi-visualisation-shadertoy:
	needs libplatform
Message-ID: <20160511140632.4F4BD80404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27a82980e6d63501376c7b82eefaba4ea8e30c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

Makefile:477: *** libplatform is in the dependency chain of
 kodi-visualisation-shadertoy that has added it to its _DEPENDENCIES
 variable without selecting it or depending on it from Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
