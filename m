From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 15:01:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5: QtSvg needs
 QtWidgets
In-Reply-To: <20200517122738.2207020-1-fontaine.fabrice@gmail.com>
References: <20200517122738.2207020-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017150158.7207b688@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 May 2020 14:27:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Building QtSvg without QtWidgets results in the following build failure:
> 
> /tmp/instance-0/output-1/host/bin/powerpc64le-linux-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/tmp/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot -fno-exceptions -Wall -Wextra -D_REENTRANT -fPIC -DSIP_PROTECTED_IS_PUBLIC -Dprotected=public -DQT_NO_DEBUG -DQT_PLUGIN -DQT_SVG_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I. -I. -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/python3.8 -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5 -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5/QtSvg -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5/QtGui -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I. -I../../../host/mkspecs/devices/linux-buildroot-g++ -o sipQtSvgcmodule.o sipQtSvgcmodule.cpp
> sip/QtWidgets/qwidget.sip:28:10: fatal error: qwidget.h: No such file or directory
> compilation terminated.
> sip/QtWidgets/qgraphicsitem.sip:26:10: fatal error: qgraphicsitem.h: No such file or directory
> compilation terminated.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/26f55a1fa9f6520ce449b98b40d98f984cec07b3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-pyqt5/python-pyqt5.mk | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
