From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Apr 2016 19:34:28 +0200
Subject: [Buildroot] [PATCH v2 0/6] package/ffmpeg: bump to version 3.0.1
Message-ID: <1459618474-11464-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

in the v2 series of the remaining patches to bump ffmpeg to 3.0.x I only
updated the vlc patch. In vlc.mk I added some explanation for the
updated code, two source code fixes needed to build VLC with buildroot
were accepted today upstream:
http://git.videolan.org/?p=vlc.git;a=search;s=Bernd+Kuhls;st=author
and for the patch included as 0008- the discussion is still going on ;)

Since I finished my ffmpeg work today I post this patch series as-is
for further discussion with you.

Regards, Bernd

Bernd Kuhls (3):
  package/freerdp: add support for ffmpeg 3.0
  package/ffmpeg: Add patch required by Kodi 16.0-Jarvis
  package/vlc: bump version to git master (to be released as 3.0)

Vicente Olivert Riera (3):
  package/ffmpeg: bump to version 3.0.1
  package/ffmpeg: cosmetic change for the mips fpu option
  package/ffmpeg: default to --cpu=generic for MIPS architecture

 .../ffmpeg/0013-hevc-support-main10-decoding.patch | 77 ++++++++++++++++++++++
 package/ffmpeg/ffmpeg.hash                         |  2 +-
 package/ffmpeg/ffmpeg.mk                           | 24 +++----
 package/freerdp/0004-ffmpeg30.patch                | 74 +++++++++++++++++++++
 package/vlc/0001-vlc-static.patch                  | 10 +--
 ...ac-add-check-for-libgcrypt-config-program.patch | 36 +++++-----
 .../vlc/0004-implicit-function-declaration.patch   |  4 +-
 package/vlc/0006-qt-x11.patch                      | 12 ++--
 package/vlc/0007-strerror.patch                    | 10 +--
 ...-error-using-uClibc-by-adding-sys-types.h.patch | 44 +++++++++++++
 package/vlc/Config.in                              |  6 +-
 package/vlc/vlc.mk                                 | 24 +++++--
 12 files changed, 263 insertions(+), 60 deletions(-)
 create mode 100644 package/ffmpeg/0013-hevc-support-main10-decoding.patch
 create mode 100644 package/freerdp/0004-ffmpeg30.patch
 create mode 100644 package/vlc/0008-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch

-- 
2.8.0.rc3
