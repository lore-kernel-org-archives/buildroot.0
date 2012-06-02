From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:09:42 +0200
Subject: [Buildroot] [PATCH v2 0/5] OpenCV update and x86/x86_64 CPU fetures
Message-ID: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 1st try of bumping OpenCV package has highlighted the lack of some
CPU feature symbols.

This patch series define symbols for some of these features for x86
and x86_64 architures.

These new symbols are used in this 2nd version of the OpenCV patch, as
well as in some other packages.

Changes since v1:
- add CPU features symbols
- use those symbols in the opencv, sdl_gfx and sdl_sound packages
- opencv: add missing zlib dependency

Samuel Martin (5):
  target: add symbols for i386/x86_64 cpu features
  libevas: refactor *_CONF_OPT assignment with cpu-feature options
  sdl_gfx: refactor *_CONF_OPT assignment with cpu-feature options
  sdl_sound: refactor *_CONF_OPT assignment with cpu-feature options
  opencv: bump to version 2.4.0

 package/efl/libevas/libevas.mk                     |   24 ++--
 package/opencv/Config.in                           |  120 ++++++++++++++++----
 ...pencv-uclibc-optional-long-double-support.patch |   40 -------
 package/opencv/opencv.mk                           |   78 ++++++++-----
 package/sdl_gfx/sdl_gfx.mk                         |   10 +-
 package/sdl_sound/sdl_sound.mk                     |    3 +-
 target/Config.in.arch                              |  117 ++++++++++++++++++-
 7 files changed, 281 insertions(+), 111 deletions(-)
 delete mode 100644 package/opencv/opencv-uclibc-optional-long-double-support.patch

--
1.7.10.3
