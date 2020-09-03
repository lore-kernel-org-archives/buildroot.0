From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Sep 2020 07:32:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/spandsp: needs jpeg support in tiff
 package
Message-ID: <20200903053248.475324-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f5e/f5efa4aeef661670403111074b9397da47167d07/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/spandsp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spandsp/Config.in b/package/spandsp/Config.in
index da0ca50fa2..c64eee8acd 100644
--- a/package/spandsp/Config.in
+++ b/package/spandsp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SPANDSP
 	bool "spandsp"
 	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_TIFF_JPEG
 	help
 	  Spandsp is a library of many DSP functions for telephony.
 	  These range from simple modules, such as DTMF detection, to
-- 
2.27.0
