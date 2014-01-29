From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Jan 2014 00:45:36 +0100
Subject: [Buildroot] [PATCH 0/2 v3] Add ffmpeg-2 and omxplayer
Message-ID: <cover.1391039071.git.yann.morin.1998@free.fr>
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

Changes v2 -> v3:
  - vampirise enhancements and fixes from ffmpeg1 in ffmpeg2
  - use the github helper  (Thomas DS)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      package/ffmpeg2: new package
      package/omxplayer: new package

 package/Config.in                                  |   2 +
 package/ffmpeg2/Config.in                          | 235 ++++++++++++++
 package/ffmpeg2/ffmpeg2.mk                         | 361 +++++++++++++++++++++
 package/omxplayer/Config.in                        |  31 ++
 .../omxplayer-0000-clean-up-Makefile.include.patch |  38 +++
 package/omxplayer/omxplayer.mk                     |  44 +++
 6 files changed, 711 insertions(+)
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
