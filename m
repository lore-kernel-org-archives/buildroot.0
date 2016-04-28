From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Apr 2016 18:41:10 +0200
Subject: [Buildroot] [PATCH v3 0/7] package/ffmpeg: bump to version 3.0.2
Message-ID: <1461861677-22146-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here is the updated version of my ffmpeg 3.x patch series.

Regards, Bernd

v3:
- bump to ffmpeg 3.0.2
- bumped vlc to latest git master
- added patch to remove a tvheadend patch which ensured compatability
  with ffmpeg 2.x

v2:
in the v2 series of the remaining patches to bump ffmpeg to 3.0.x I only
updated the vlc patch. In vlc.mk I added some explanation for the
updated code, two source code fixes needed to build VLC with buildroot
were accepted today upstream:
http://git.videolan.org/?p=vlc.git;a=search;s=Bernd+Kuhls;st=author
and for the patch included as 0008- the discussion is still going on 



Bernd Kuhls (4):
  package/freerdp: add support for ffmpeg 3.0
  package/ffmpeg: Add patch required by Kodi 16.0-Jarvis
  package/vlc: bump version to git master (to be released as 3.0)
  package/tvheadend: remove compat patch for ffmpeg < 3.x

Vicente Olivert Riera (3):
  package/ffmpeg: bump to version 3.0.2
  package/ffmpeg: cosmetic change for the mips fpu option
  package/ffmpeg: default to --cpu=generic for MIPS architecture

 .../ffmpeg/0013-hevc-support-main10-decoding.patch | 77 ++++++++++++++++++++++
 package/ffmpeg/ffmpeg.hash                         |  2 +-
 package/ffmpeg/ffmpeg.mk                           | 24 +++----
 package/freerdp/0004-ffmpeg30.patch                | 74 +++++++++++++++++++++
 ...g-revert-minimum-required-version-numbers.patch | 51 --------------
 package/vlc/0001-vlc-static.patch                  | 10 +--
 ...ac-add-check-for-libgcrypt-config-program.patch | 36 +++++-----
 .../vlc/0004-implicit-function-declaration.patch   |  4 +-
 package/vlc/0006-qt-x11.patch                      | 12 ++--
 package/vlc/0007-strerror.patch                    | 10 +--
 ...-error-using-uClibc-by-adding-sys-types.h.patch | 44 +++++++++++++
 package/vlc/Config.in                              |  6 +-
 package/vlc/vlc.hash                               |  2 -
 package/vlc/vlc.mk                                 | 24 +++++--
 14 files changed, 263 insertions(+), 113 deletions(-)
 create mode 100644 package/ffmpeg/0013-hevc-support-main10-decoding.patch
 create mode 100644 package/freerdp/0004-ffmpeg30.patch
 delete mode 100644 package/tvheadend/0002-ffmpeg-revert-minimum-required-version-numbers.patch
 create mode 100644 package/vlc/0008-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
 delete mode 100644 package/vlc/vlc.hash

-- 
2.8.0.rc3
