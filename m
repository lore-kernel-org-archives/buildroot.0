From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 15:20:02 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-pctv: add jsoncpp reverse
	dependency
Message-ID: <20151003132414.8FF727FAF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3046c80e792216c592fc63b77f31f3d23c9be49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-pctv/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
index 255cd4a..1bef551 100644
--- a/package/kodi-pvr-pctv/Config.in
+++ b/package/kodi-pvr-pctv/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_KODI_PVR_PCTV
 	bool "kodi-pvr-pctv"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  PCTV PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.vdr.vnsi
+
+comment "kodi-pvr-pctv needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
