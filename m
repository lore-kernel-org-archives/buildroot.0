From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jan 2014 20:56:19 +0100
Subject: [Buildroot] [PATCH 0/3] Add ffmpeg-2 and omxplayer
Message-ID: <cover.1390593263.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series introduces OMXplayer, an optimised video application, specially
written for the Raspberry Pi, which allows decoding video using hardware
acceleration.

With OMXplayer, it is posible to decode h264 1080p30 with as low as 20%
CPU usage (where gst is not able to, and tops at ~40% CPU for 720p30).

OMXplayer can play local files, as well as rtmp streams.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      package/rpi-userland: fix fall-out after cmake infra change
      package/ffmpeg2: new package
      package/omxplayer: new package

 package/Config.in                                  |   2 +
 package/ffmpeg2/Config.in                          | 235 ++++++++++++++++++
 package/ffmpeg2/ffmpeg2.mk                         | 274 +++++++++++++++++++++
 package/omxplayer/Config.in                        |  31 +++
 .../omxplayer-0000-clean-up-Makefile.include.patch |  38 +++
 package/omxplayer/omxplayer.mk                     |  44 ++++
 package/rpi-userland/rpi-userland.mk               |   2 +-
 7 files changed, 625 insertions(+), 1 deletion(-)
 create mode 100644 package/ffmpeg2/Config.in
 create mode 100644 package/ffmpeg2/ffmpeg2.mk
 create mode 100644 package/omxplayer/Config.in
 create mode 100644 package/omxplayer/omxplayer-0000-clean-up-Makefile.include.patch
 create mode 100644 package/omxplayer/omxplayer.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
