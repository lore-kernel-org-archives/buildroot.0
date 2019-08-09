From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:39:22 +0200
Subject: [Buildroot] [git commit] package/mpd: soundcloud needs curl
Message-ID: <20190809203651.AF1DE8E643@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12256d33207fa83b435c8984887a768b697c1b61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since switch to meson-package, soundcloud needs curl

Fixes:
 - http://autobuild.buildroot.org/results/eefe8c6816d9504e8997483abcf7b1327260409c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 69f2beeb7b..e9e7b83cbd 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_MPD_QOBUZ
 
 config BR2_PACKAGE_MPD_SOUNDCLOUD
 	bool "soundcloud"
+	select BR2_PACKAGE_MPD_CURL
 	select BR2_PACKAGE_YAJL
 	help
 	  Enable soundcloud.com playlist support.
