From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed,  5 Feb 2020 16:33:23 +0100
Subject: [Buildroot] [PATCH v2] package/gr-osmosdr: fix dependencies
Message-ID: <1580916803-11595-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-osmosdr fails with:
CMake Error at /somewhere/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/gnuradio/GnuradioConfig.cmake:116 (include):
  include could not find load file:

    /somewhere/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/gnuradio/gnuradio-filterConfig.cmake
Call Stack (most recent call first):
  CMakeLists.txt:45 (find_package)

gr-osmosdr depends on BR2_PACKAGE_GNURADIO_BLOCKS, BR2_PACKAGE_GNURADIO_FFT and
BR2_PACKAGE_GNURADIO_FILTER.

fix:
- http://autobuild.buildroot.net/results/1781db2b8c28641167f7a39a4d799930db13f9bf/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * add explicitly all dependencies (Thomas)
---
 package/gr-osmosdr/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index f26380371f..1e80137f35 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_GR_OSMOSDR
 	bool "gr-osmosdr"
 	depends on BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_GNURADIO_BLOCKS
+	select BR2_PACKAGE_GNURADIO_FFT
+	select BR2_PACKAGE_GNURADIO_FILTER
 	help
 	  GNU Radio block for interfacing with various radio hardware
 
-- 
2.24.1
