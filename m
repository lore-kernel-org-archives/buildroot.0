From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Feb 2014 16:25:19 +0200
Subject: [Buildroot] [PATCH 0/3] xtensa autobuild fixes
Message-ID: <cover.1392128329.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes a few xtensa specific build failures reported by the 
autobuild machine.

Baruch Siach (3):
  gst1-libav: fix build for xtensa
  coreutils: fix build against uclibc snapshot
  gcc: xtensa: fix __builtin_frame_address use with shared libgcc

 package/coreutils/coreutils-01-spawn-uclibc.patch  | 43 ++++++++++++++++++++++
 package/coreutils/coreutils.mk                     |  3 ++
 .../4.7.3/850-xtensa-libgcc-linker-script.patch    | 29 +++++++++++++++
 .../4.8.2/850-xtensa-libgcc-linker-script.patch    | 29 +++++++++++++++
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  8 ++++
 5 files changed, 112 insertions(+)
 create mode 100644 package/coreutils/coreutils-01-spawn-uclibc.patch
 create mode 100644 package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
 create mode 100644 package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch

-- 
1.8.5.3
