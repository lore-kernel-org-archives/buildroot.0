From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 09:23:47 +0200
Subject: [Buildroot] [git commit] package/gnuradio: needs boost regex module
Message-ID: <20170607073013.E07CD816A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c9b77f380de07efecbf6e445793b1552d8a6006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since
https://git.gnuradio.org/cgit/gnuradio.git/commit/cmake/Modules/GrBoost.cmake?id=27fbbf22e359e8ec4a04399f3dc139f8c25031cb
gnuradio needs the boost regex module.

Fixes
http://autobuild.buildroot.net/results/d71/d71278032c083c2c4b1bf20b81629225f8965c6e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 0291d70..178bdc8 100644
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
