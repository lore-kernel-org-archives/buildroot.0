From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  9 Aug 2019 10:11:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/mpd: soundcloud needs curl
In-Reply-To: <20190809081104.19686-1-fontaine.fabrice@gmail.com>
References: <20190809081104.19686-1-fontaine.fabrice@gmail.com>
Message-ID: <20190809081104.19686-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since switch to meson-package, soundcloud needs curl

Fixes:
 - http://autobuild.buildroot.org/results/eefe8c6816d9504e8997483abcf7b1327260409c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
