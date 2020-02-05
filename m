From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 17:10:44 +0100
Subject: [Buildroot] [git commit] package/gr-osmosdr: fix dependencies
Message-ID: <20200205155953.307F98CAA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d99cdcc86ccbbb4c7381a025181d22d6558d9b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
