From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 23:37:42 +0100
Subject: [Buildroot] [pull request v4] Pull request for branch yem-tvheadend
Message-ID: <cover.1356734184.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here's a one-patch series to add TVHeadend.

TVHeadend implements a PVR/DVR solution, which can record either from
a broadcast tunner (DVB-{T,S,C}, or ATSC), or IPTV multicast streams.

TVHeadend can be used as a backend by media centers, such as XBMC, or
it can be used stand-alone.

Changes v3 -> v4:
  - drop upstream-applied dvb-apps (Peter)
  - fix typos in tvheadend patch
Changes v2 -> v3:
  - fixed copy-paste and indentation (Thomas)
  - added desc to tvheadend patch (Thomas)
Changes v1 -> v2:
  - got rid of tvheadend user (Peter)
  - added dvb-apps package, get rid of cutom download (Thomas)

The following changes since commit 5e0b900c72bce75a3f86306d0aae79e9655a4753:

  package/dvb-apps: new package (2012-12-28 23:27:12 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-tvheadend

Yann E. MORIN (1):
      package/tvheadend: new package

 package/Config.in                                  |    1 +
 package/tvheadend/Config.in                        |   19 ++++++
 package/tvheadend/S99tvheadend                     |   54 ++++++++++++++++++
 package/tvheadend/accesscontrol.1                  |   13 ++++
 package/tvheadend/etc.default.tvheadend            |    7 ++
 .../tvheadend-no-auto-download-dvbscans.patch      |   60 ++++++++++++++++++++
 package/tvheadend/tvheadend.mk                     |   43 ++++++++++++++
 7 files changed, 197 insertions(+), 0 deletions(-)
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
