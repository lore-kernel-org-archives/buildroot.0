From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:12 +0200
Subject: [Buildroot] [PATCH 00/29] qt,
	qt5: only ever use the free/opensource licenses
Message-ID: <cover.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series drops the option to accept the "free license" (as per the
current prompts), to only ever use that, and no longer claim to allow
use of Qt/Qt5 under a proprietary version.

The rationale behind this change is multi-fold:

  - the name of the tarballs we download clearly hint that they can
    only be used under the opensource license;

  - the proprietary license is unknown to us (the Buildroot community
    at large); we do not even know if there is a single such license;

  - we do not have such license choice for any other package in a
    similar situation (e.g. mongoose); we only ever use the publicly
    available licenses, always;

  - finally, we do not have such click-wrap acceptance option for any
    license, be it free, opensource, or proprietary, and whether it be
    redistributable or not. The licenses are available in the output
    of legal-info, which a user should consult before using or
    distributing the result of a build.

So, we drop the option to "Approve free license" for both Qt and
Qt5, and do as we do for all packages: just use the publicly-known
opensource licenses.

Users interested in using Qt under a proprietary license will have
to take special steps to use it (as they were already probably doing
anyway).


Regards,
Yann E. MORIN.


The following changes since commit 4c2b11977a70d418b7ae2cd7d4b62e77bddbc2c6

  syslog-ng: disable mongodb (2017-04-22 15:59:31 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 0edfc64dedabab8b436312b1212c08dcf9765a05

  package/qt5: drop option for license approved (2017-04-23 19:09:57 +0200)


----------------------------------------------------------------
Yann E. MORIN (29):
      package/qt: default to approved license
      package/qt5base: default to approved license
      package/qt: always use the opensource license
      package/qt5base: always use the opensource license
      package/qt53d: always use the opensource license
      package/qt5canvas: always use the opensource license
      package/qt5connectivity: always use the opensource license
      package/qt5declarative: always use the opensource license
      package/qt5enginio: always use the opensource license
      package/qt5graphicaleffects: always use the opensource license
      package/qt5imageformats: always use the opensource license
      package/qt5location: always use the opensource license
      package/qt5multimedia: always use the opensource license
      package/qt5quickcontrols: always use the opensource license
      package/qt5quickcontrols2: always use the opensource license
      package/qt5script: always use the opensource license
      package/qt5sensors: always use the opensource license
      package/qt5serialbus: always use the opensource license
      package/qt5serialport: always use the opensource license
      package/qt5svg: always use the opensource license
      package/qt5tools: always use the opensource license
      package/qt5webchannel: always use the opensource license
      package/qt5webkit: always use the opensource license
      package/qt5websockets: always use the opensource license
      package/qt5x11extras: always use the opensource license
      package/qt5xmlpatterns: always use the opensource license
      configs: drop Qt/Qt5 license approval option
      package/qt: drop option for license approved
      package/qt5: drop option for license approved

 Config.in.legacy                                       | 12 ++++++++++++
 configs/beaglebone_qt5_defconfig                       |  1 -
 configs/firefly_rk3288_demo_defconfig                  |  1 -
 package/qt/Config.in                                   | 11 -----------
 package/qt/qt.mk                                       |  6 +-----
 package/qt5/qt53d/qt53d.mk                             |  5 -----
 package/qt5/qt5base/Config.in                          | 12 ------------
 package/qt5/qt5base/qt5base.mk                         |  5 -----
 package/qt5/qt5canvas3d/qt5canvas3d.mk                 |  5 -----
 package/qt5/qt5connectivity/qt5connectivity.mk         |  5 -----
 package/qt5/qt5declarative/qt5declarative.mk           |  5 -----
 package/qt5/qt5enginio/qt5enginio.mk                   |  5 -----
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  5 -----
 package/qt5/qt5imageformats/qt5imageformats.mk         |  5 -----
 package/qt5/qt5location/qt5location.mk                 |  5 -----
 package/qt5/qt5multimedia/qt5multimedia.mk             |  5 -----
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk       |  5 -----
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk     |  5 -----
 package/qt5/qt5script/qt5script.mk                     |  5 -----
 package/qt5/qt5sensors/qt5sensors.mk                   |  5 -----
 package/qt5/qt5serialbus/qt5serialbus.mk               |  5 -----
 package/qt5/qt5serialport/qt5serialport.mk             |  5 -----
 package/qt5/qt5svg/qt5svg.mk                           |  5 -----
 package/qt5/qt5tools/qt5tools.mk                       |  5 -----
 package/qt5/qt5webchannel/qt5webchannel.mk             |  5 -----
 package/qt5/qt5webkit/qt5webkit.mk                     |  5 -----
 package/qt5/qt5websockets/qt5websockets.mk             |  5 -----
 package/qt5/qt5x11extras/qt5x11extras.mk               |  5 -----
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           |  5 -----
 29 files changed, 13 insertions(+), 145 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
