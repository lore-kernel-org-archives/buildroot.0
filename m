From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Dec 2018 23:16:15 +0100
Subject: [Buildroot] [PATCH/next 1/1] pulseview: drop boost thread
Message-ID: <20181201221615.17298-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since bump to 0.4.0, boost thread is not needed anymore:
https://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=b8f1cdeba7cf6c2b749ff60102ce4e260fa1309e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseview/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 301acf7d90..a42fdcd879 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
-- 
2.17.1
