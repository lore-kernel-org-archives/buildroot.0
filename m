From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:25:22 +0200
Subject: [Buildroot] [git commit] package/kodi-addon-xvdr: mark as deprecated
Message-ID: <20160424212540.74FB58198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31294a5cb1f5ab2120c153303482267a2e600413
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the github project page:
https://github.com/pipelka/xbmc-addon-xvdr
this package is discontinued.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: add a reason for the deprecation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-addon-xvdr/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi-addon-xvdr/Config.in b/package/kodi-addon-xvdr/Config.in
index 6e713af..85e9d60 100644
--- a/package/kodi-addon-xvdr/Config.in
+++ b/package/kodi-addon-xvdr/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_KODI_ADDON_XVDR
 	bool "kodi-addon-xvdr"
+	# upstream discontinued the development
+	depends on BR2_DEPRECATED_SINCE_2016_05
 	help
 	  This is a PVR add-on for Kodi to add VDR (http://tvdr.de/)
 	  as a TV/PVR Backend to Kodi.
