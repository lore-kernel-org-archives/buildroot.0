From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:18:24 +0200
Subject: [Buildroot] [git commit] lcdproc: needs dynamic library support
Message-ID: <20150514230013.9EEA281E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cc56c24c9cc135990f9b604761596456487322e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4ac/4ac625f4e888ba859a5867671664dc8d041ec9b9/
http://autobuild.buildroot.net/results/614/61450e889c3912e38e52759812fbb6ce03270788/
http://autobuild.buildroot.net/results/138/13800e3b52c9f6c84f85325710a59c7b3c04d0ee/
http://autobuild.buildroot.net/results/041/0410fb15e65561031453bedbc549ed82ce7bdc71/

And many more.

Lcdproc forces shared libraries for the drivers, so mark it as unavailable
for static only builds.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcdproc/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index f5a8501..042abd6 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -1,6 +1,10 @@
+comment "lcdproc needs a toolchain w/  dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LCDPROC
 	bool "lcdproc"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
