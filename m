From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 19:42:10 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-tvheadend
Message-ID: <cover.1356719913.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here's a short series to add TVHeadend.

TVHeadend implements a PVR/DVR solution, which can record either from
a broadcast tunner (DVB-{T,S,C}, or ATSC), or IPTV multicast streams.

TVHeadend can be used as a backend by media centers, such as XBMC, or
it can be used stand-alone.

The following changes since commit 4848386446b937d4d0d9d3e9489932ca3fcb1003:

  libffi: fix mips build failures (2012-12-28 16:55:09 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-tvheadend

Yann E. MORIN (2):
      package/dvb-apps: new package
      package/tvheadend: new package

 package/Config.in                                  |    1 +
 package/dvb-apps/dvb-apps.mk                       |   32 ++++++++++++
 package/tvheadend/Config.in                        |   18 +++++++
 package/tvheadend/S99tvheadend                     |   54 ++++++++++++++++++++
 package/tvheadend/accesscontrol.1                  |   13 +++++
 package/tvheadend/etc.default.tvheadend            |    7 +++
 .../tvheadend-no-auto-download-dvbscans.patch      |   50 ++++++++++++++++++
 package/tvheadend/tvheadend.mk                     |   43 ++++++++++++++++
 8 files changed, 218 insertions(+), 0 deletions(-)
 create mode 100644 package/dvb-apps/dvb-apps.mk
 create mode 100644 package/tvheadend/Config.in
 create mode 100644 package/tvheadend/S99tvheadend
 create mode 100644 package/tvheadend/accesscontrol.1
 create mode 100644 package/tvheadend/etc.default.tvheadend
 create mode 100644 package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
 create mode 100644 package/tvheadend/tvheadend.mk

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
