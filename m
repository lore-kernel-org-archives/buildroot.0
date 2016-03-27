From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Mar 2016 11:16:45 +0200
Subject: [Buildroot] [PATCH v2 00/18] Bump ffmpeg to 3.0
Message-ID: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series bumps ffmpeg to version 3.0.

This cover letter collects the changelog of individual patches.
Packages not mentioned are unchanged.

Regards, Bernd

v2: opencv3: reworked options (Samuel)


Bernd Kuhls (15):
  package/kodi: add support for ffmpeg 3.0
  package/libdcadec: bump version to v0.2.0
  package/ortp: bump version to 0.25.0
  package/mediastreamer: bump version to 2.12.1
  package/opencv: bump version to 2.4.12.3
  package/opencv3: bump version to 3.1.0
  package/squeezelite: fix compilation with ffmpeg >= 2.9
  package/freerdp: bump version
  package/vlc: mark as broken due to incompatibility with ffmpeg 3.0
  package/ffmpeg: Add patch required by Kodi 16.0-Jarvis
  package/x264: bump version
  package/x265: bump version to 1.9
  package/dtv-scan-tables: bump version
  package/tvheadend: bump version
  package/live555: bump version to 2016.03.16

Vicente Olivert Riera (3):
  package/ffmpeg: bump to version 3.0
  package/ffmpeg: cosmetic change for the mips fpu option
  package/ffmpeg: default to --cpu=generic for MIPS architecture

 package/dtv-scan-tables/dtv-scan-tables.mk         |   2 +-
 .../ffmpeg/0013-hevc-support-main10-decoding.patch |  77 +++
 package/ffmpeg/ffmpeg.hash                         |   4 +-
 package/ffmpeg/ffmpeg.mk                           |  24 +-
 package/freerdp/freerdp.mk                         |   2 +-
 package/kodi/0007-ffmpeg30.patch                   | 646 +++++++++++++++++++++
 package/libdcadec/libdcadec.hash                   |   2 +
 package/libdcadec/libdcadec.mk                     |   2 +-
 package/live555/live555.hash                       |   4 +-
 package/live555/live555.mk                         |   2 +-
 package/mediastreamer/0001-misc-fixes.patch        | 156 -----
 package/mediastreamer/mediastreamer.hash           |   4 +-
 package/mediastreamer/mediastreamer.mk             |   2 +-
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 --
 package/opencv/0001-ffmpeg30.patch                 | 638 ++++++++++++++++++++
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 --
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 -----
 package/opencv/opencv.mk                           |   2 +-
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |  62 --
 ...002-fix-support-for-pthreads-parallel_for.patch | 212 -------
 package/opencv3/Config.in                          |   1 +
 package/opencv3/opencv3.mk                         |  13 +-
 package/ortp/ortp.hash                             |   4 +-
 package/ortp/ortp.mk                               |   2 +-
 package/squeezelite/0003-ffmpeg_2_9.patch          |  57 ++
 package/tvheadend/tvheadend.hash                   |   2 +-
 package/tvheadend/tvheadend.mk                     |   4 +-
 package/vlc/Config.in                              |   1 +
 package/x264/x264.mk                               |   2 +-
 package/x265/x265.hash                             |   2 +-
 package/x265/x265.mk                               |   2 +-
 31 files changed, 1459 insertions(+), 717 deletions(-)
 create mode 100644 package/ffmpeg/0013-hevc-support-main10-decoding.patch
 create mode 100644 package/kodi/0007-ffmpeg30.patch
 create mode 100644 package/libdcadec/libdcadec.hash
 delete mode 100644 package/mediastreamer/0001-misc-fixes.patch
 delete mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 create mode 100644 package/opencv/0001-ffmpeg30.patch
 delete mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 delete mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 delete mode 100644 package/opencv3/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
 delete mode 100644 package/opencv3/0002-fix-support-for-pthreads-parallel_for.patch
 create mode 100644 package/squeezelite/0003-ffmpeg_2_9.patch

-- 
2.8.0.rc3
