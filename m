From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 15:19:37 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-argustv: add jsoncpp
	reverse dependency
Message-ID: <20151003132414.7F89B7FAF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0533fc8dce29753c282efb080e5b6aec29e27a6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-argustv/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
index 698ff46..247d83c 100644
--- a/package/kodi-pvr-argustv/Config.in
+++ b/package/kodi-pvr-argustv/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_KODI_PVR_ARGUSTV
 	bool "kodi-pvr-argustv"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Kodi's ARGUS TV client addon
 
 	  https://github.com/kodi-pvr/pvr.argustv
+
+comment "kodi-pvr-argustv needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
