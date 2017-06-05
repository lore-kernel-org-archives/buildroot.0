From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 17:48:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: needs boost regex module
Message-ID: <20170605154822.21596-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since
https://git.gnuradio.org/cgit/gnuradio.git/commit/cmake/Modules/GrBoost.cmake?id=27fbbf22e359e8ec4a04399f3dc139f8c25031cb
gnuradio needs the boost regex module.

Fixes
http://autobuild.buildroot.net/results/d71/d71278032c083c2c4b1bf20b81629225f8965c6e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnuradio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 0291d7096..178bdc886 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
-- 
2.11.0
