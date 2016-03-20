From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:32:37 +0100
Subject: [Buildroot] [PATCH 4/5] qt5: bump version to 5.6.0
In-Reply-To: <1458207749-19507-5-git-send-email-corjon.j@ecagroup.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
 <1458207749-19507-5-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20160320233237.3e6002e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 10:42:28 +0100, Julien Corjon wrote:
> Remove upstream committed patches (qt5base):
>   - 0001-Force_egl_visual_ID_33.patch (see [1], [2])
>   - 0003-xcb-egl-fixes.patch (see [3])
>   - 0005-forkd-disable-eventfd-for-uclibc.patch (see [4], [5])
>   - 0009-fix-eglfs-for-sunxi-mali.patch (see [6])
>   - 0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch (see [7])
> 
> Remove MX6_WORKAROUND from qt5base.mk since we do not need to tweak
> EGL visual ID to 33.
> 
> Remove upstream committed patch (qt5webchannel):
>   - 0001-Fix-builds-without-qml-module.patch (see [8], [9])
> 
> Fix Qt5Enginio to 1.6.0 version (see [10])
> 
> [1] https://bugreports.qt.io/browse/QTBUG-44290
> [2] https://codereview.qt-project.org/#/c/108849/
> [3] https://codereview.qt-project.org/#/c/115438/
> [4] https://bugreports.qt.io/browse/QTBUG-47337
> [5] https://codereview.qt-project.org/#/c/121988/
> [6] https://codereview.qt-project.org/#/c/125837/
> [7] https://codereview.qt-project.org/#/c/126725/
> [8] https://bugreports.qt.io/browse/QTBUG-47360
> [9] https://codereview.qt-project.org/#/c/122086/
> [10] https://bugreports.qt.io/browse/QTBUG-50111
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5.mk                                 |   4 +-
>  package/qt5/qt53d/qt53d.hash                       |   4 +-
>  .../qt5/qt5base/0001-Force_egl_visual_ID_33.patch  |  27 -----
>  package/qt5/qt5base/0003-xcb-egl-fixes.patch       |  82 ----------------
>  .../0005-forkd-disable-eventfd-for-uclibc.patch    |  32 ------
>  .../qt5base/0009-fix-eglfs-for-sunxi-mali.patch    | 109 ---------------------
>  ...Invert-conditional-for-defining-QT_SOCKLE.patch |  40 --------
>  package/qt5/qt5base/qt5base.hash                   |   4 +-
>  package/qt5/qt5base/qt5base.mk                     |   4 -
>  package/qt5/qt5connectivity/qt5connectivity.hash   |   4 +-
>  package/qt5/qt5declarative/qt5declarative.hash     |   4 +-
>  package/qt5/qt5enginio/qt5enginio.hash             |   4 +-
>  package/qt5/qt5enginio/qt5enginio.mk               |   4 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |   4 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash   |   4 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash       |   4 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   4 +-
>  package/qt5/qt5script/qt5script.hash               |   4 +-
>  package/qt5/qt5sensors/qt5sensors.hash             |   4 +-
>  package/qt5/qt5serialport/qt5serialport.hash       |   4 +-
>  package/qt5/qt5svg/qt5svg.hash                     |   4 +-
>  package/qt5/qt5tools/qt5tools.hash                 |   4 +-
>  .../0001-Fix-builds-without-qml-module.patch       |  61 ------------
>  package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |   4 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash         |   4 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   4 +-
>  27 files changed, 41 insertions(+), 394 deletions(-)
>  delete mode 100644 package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
>  delete mode 100644 package/qt5/qt5base/0003-xcb-egl-fixes.patch
>  delete mode 100644 package/qt5/qt5base/0005-forkd-disable-eventfd-for-uclibc.patch
>  delete mode 100644 package/qt5/qt5base/0009-fix-eglfs-for-sunxi-mali.patch
>  delete mode 100644 package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
>  delete mode 100644 package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
