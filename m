From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Jul 2012 23:37:25 +0200
Subject: [Buildroot] [PATCH v5 0/5] OpenCV update and CPU fetures
Message-ID: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series add symbols for some of the features of the x86/x86_64
architectures.

These new symbols are used in the opencv.mk file, as well as in some other
packages.


Changelog:

v5:
- remove unused CPU features symbols.
- opencv: bump to version 2.4.2

v4:
- remove CPU features symbols for PowerPC
- opencv: fix the configure option for PowerPC and comment it.

v3:
- rename x86/x86_64 cpu feature symbols: BR2_CPU_HAS_* -> BR2_X86_CPU_HAS_*
- add CPU features symbols for PowerPC
- opencv: bump to version 2.4.1
- fix/cleanup menuconfig
- update opencv configure options

v2:
- add CPU features symbols for x86 and x86_64
- use those symbols in the opencv, sdl_gfx and sdl_sound packages
- opencv: add missing zlib dependency

v1:
- opencv: bump to version 2.4.0

Samuel Martin (5):
  target: add symbols for i386/x86_64 cpu features
  libevas: refactor *_CONF_OPT assignment with cpu-feature options
  sdl_gfx: refactor *_CONF_OPT assignment with cpu-feature options
  sdl_sound: refactor *_CONF_OPT assignment with cpu-feature options
  opencv: bump to version 2.4.2

 package/efl/libevas/libevas.mk                     |  24 ++--
 package/opencv/Config.in                           | 155 ++++++++++++++++++---
 ...pencv-uclibc-optional-long-double-support.patch |  40 ------
 package/opencv/opencv.mk                           | 144 +++++++++++++------
 package/sdl_gfx/sdl_gfx.mk                         |  10 +-
 package/sdl_sound/sdl_sound.mk                     |   3 +-
 target/Config.in.arch                              | 101 +++++++++++++-
 7 files changed, 353 insertions(+), 124 deletions(-)
 delete mode 100644 package/opencv/opencv-uclibc-optional-long-double-support.patch

--
1.7.11.2
