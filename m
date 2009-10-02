From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 11:51:47 +0200
Subject: [Buildroot] [git commit master] festival: needs C++ support
Message-ID: <20091002095205.659B477768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fa324fb8bc7a0b941a20b4e038da507a741371d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/festival/Config.in |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/multimedia/festival/Config.in b/package/multimedia/festival/Config.in
index 0c681d1..2be32f9 100644
--- a/package/multimedia/festival/Config.in
+++ b/package/multimedia/festival/Config.in
@@ -1,9 +1,10 @@
 menuconfig BR2_PACKAGE_FESTIVAL
-bool "festival text-to-speech system"
-select BR2_PACKAGE_ALSA_LIB
-select BR2_PACKAGE_SPEECH_TOOLS
-help
-	Text to speech system for Linux
+	bool "festival text-to-speech system"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_SPEECH_TOOLS
+	help
+	  Text to speech system for Linux
 
 if BR2_PACKAGE_FESTIVAL
 
@@ -20,3 +21,6 @@ if BR2_PACKAGE_FESTIVAL
 	endmenu
 
 endif
+
+comment "festival requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
1.6.3.3
