From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 10 Jun 2012 13:46:47 +0200
Subject: [Buildroot] [PATCH v3 0/6] OpenCV update and CPU fetures
In-Reply-To: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1339328813-6269-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series add some symbols for some of these features for
x86/x86_64 and PowerPC architures.

These new symbols are used in this 2nd version of the OpenCV patch, as
well as in some other packages.

Changes since v2:
- rename x86/x86_64 cpu feature symbols: BR2_CPU_HAS_* -> BR2_X86_CPU_HAS_*
- add CPU features symbols for PowerPC
- opencv: bump to version 2.4.1
- fix/cleanup menuconfig
- update opencv configure options

Changes since v1:
- add CPU features symbols for x86 and x86_64
- use those symbols in the opencv, sdl_gfx and sdl_sound packages
- opencv: add missing zlib dependency

Samuel Martin (6):
  target: add symbols for i386/x86_64 cpu features
  target: add symbols for PowerPC cpu features
  libevas: refactor *_CONF_OPT assignment with cpu-feature options
  sdl_gfx: refactor *_CONF_OPT assignment with cpu-feature options
  sdl_sound: refactor *_CONF_OPT assignment with cpu-feature options
  opencv: bump to version 2.4.1

 package/efl/libevas/libevas.mk                     |   24 ++--
 package/opencv/Config.in                           |  152 +++++++++++++++++---
 ...pencv-uclibc-optional-long-double-support.patch |   40 ------
 package/opencv/opencv.mk                           |  129 +++++++++++------
 package/sdl_gfx/sdl_gfx.mk                         |   10 +-
 package/sdl_sound/sdl_sound.mk                     |    3 +-
 target/Config.in.arch                              |  134 ++++++++++++++++-
 7 files changed, 368 insertions(+), 124 deletions(-)
 delete mode 100644 package/opencv/opencv-uclibc-optional-long-double-support.patch

--
1.7.10.4
