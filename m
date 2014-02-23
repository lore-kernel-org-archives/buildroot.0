From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 23:58:04 +0100
Subject: [Buildroot] [PATCH 0/7] Misc set of fixes
Message-ID: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The first three patches are fixes for build failures. The last four
patches are fixes for missing dependency propagation of BR2_USE_MMU.

Thomas

Thomas Petazzoni (7):
  cairo: fix build on Blackfin in test/cairo-test-runner.c
  cairo: improve the Blackfin build fix
  util-linux: libblkid needs fork(), disable on !MMU
  opencv: add missing dependency on !MMU for gtk support
  packages: missing propagation of !mmu from pango
  pcmanfm: add missing BR2_USE_MMU dependency from gamin
  sconeserver: missing dependency on BR2_USE_MMU

 package/cairo/cairo-001-blackfin-build-fix.patch | 19 ++++++++++++++++
 package/cairo/cairo-003-fix-nofork-build.patch   | 29 ++++++++++++++++++++++++
 package/cryptsetup/Config.in                     |  2 +-
 package/e2fsprogs/Config.in                      |  1 +
 package/gstreamer/gst-plugins-base/Config.in     |  1 +
 package/gstreamer1/gst1-plugins-base/Config.in   |  1 +
 package/libgail/Config.in                        |  1 +
 package/opencv/Config.in                         |  1 +
 package/pcmanfm/Config.in                        |  1 +
 package/sconeserver/Config.in                    |  1 +
 package/udev/Config.in                           |  1 +
 package/util-linux/Config.in                     |  2 ++
 package/webkit/Config.in                         |  1 +
 system/Config.in                                 |  1 +
 14 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 package/cairo/cairo-003-fix-nofork-build.patch

-- 
1.8.3.2
