From: Andreas Naumann <anaumann@ultratronik.de>
Date: Wed, 16 Nov 2016 08:41:41 +0100
Subject: [Buildroot] [Rejected v2 0/7] qt5 bump to 5.8.0-beta
In-Reply-To: <20161115171307.7499-1-corjon.j@ecagroup.com>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <20161115171307.7499-1-corjon.j@ecagroup.com>
Message-ID: <c9e42705-4042-c4bb-1636-c75948fcc513@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 15.11.2016 um 18:13 schrieb Julien Corjon:
> As I'm, also, working on qt5.8 next bump i made a V2 of Andreas
> series and include a proposed patch from Alexey for convinience.
>
> I mostly work on patch 2/7 to include qtwebkit fix and add C++11
> requirement.

Thank you, I was trying to prepare an improved version but couldnt 
figure out the private_tests trouble.

For the directfb patch, I have opened an issue upstream and they reacted 
quite quickly: https://bugreports.qt.io/browse/QTBUG-57039

So my proposal is to wait for that to be solved and then send v3 with 
the remaining comments taken into account.


regards,
Andreas


> Patches 6 & 7 are not touched (did not take Arnout comment yet).
>
> Of course as it's a beta version this series is to reject in
> patchwork. But if someone what to give a try on it, comments are
> more than welcome.
>
>
> Alexey Brodkin (1):
>   qt5webkit: Get sources from Qt-5-unofficial-builds
>
> Julien Corjon (2):
>   qt5enginio : move into legacy compatibility
>   qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
>
> Naumann Andreas (4):
>   qt5: bump to 5.8.0-beta
>   Revert "qt5base: install bundled fonts to target"
>   qt5declarative: enable Quick for non-GL platforms
>   quickcontrols1/2: enable for software renderer
>
>  package/qt5/Config.in                              | 14 +++----
>  package/qt5/qt5.mk                                 |  7 ++--
>  package/qt5/qt53d/qt53d.hash                       |  4 +-
>  ...001-directfb-make-platform-plugin-compile.patch | 22 +++++++++++
>  .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ----------------------
>  package/qt5/qt5base/qt5base.hash                   |  4 +-
>  package/qt5/qt5base/qt5base.mk                     | 11 +-----
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
>  package/qt5/qt5declarative/Config.in               |  4 +-
>  package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
>  package/qt5/qt5enginio/qt5enginio.hash             |  4 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
>  package/qt5/qt5location/qt5location.hash           |  4 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
>  package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +
>  package/qt5/qt5quickcontrols/Config.in             |  3 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  5 ++-
>  package/qt5/qt5quickcontrols2/Config.in            |  3 +-
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  8 ++--
>  package/qt5/qt5script/qt5script.hash               |  4 +-
>  package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
>  package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
>  package/qt5/qt5svg/qt5svg.hash                     |  4 +-
>  package/qt5/qt5tools/qt5tools.hash                 |  4 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
>  ...004-Remove-unused-check-for-private_tests.patch | 40 +++++++++++++++++++
>  package/qt5/qt5webkit/qt5webkit.hash               |  4 +-
>  package/qt5/qt5webkit/qt5webkit.mk                 | 14 ++-----
>  package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
>  36 files changed, 137 insertions(+), 133 deletions(-)
>  create mode 100644 package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
>  delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
>  create mode 100644 package/qt5/qt5webkit/0004-Remove-unused-check-for-private_tests.patch
>
