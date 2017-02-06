From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 16:40:58 +0100
Subject: [Buildroot] [PATCH v6 0/9] bump/choice for qt 5.8.0
In-Reply-To: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20170206164058.3f443334@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Jan 2017 08:59:02 +0100, Zoltan Gyarmati wrote:

> The Qt 5.8 config (and pyqt5) was tested on Raspberry Pi.

As Arnout said we are trying to apply this patch series (or actually a
subset of it). We have already fixed the comments that people have
raised, and you can see the result at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=qt5-bump

Unfortunately, this fails to build with the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5DECLARATIVE=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5LOCATION=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5SENSORS=y
BR2_PACKAGE_QT5SERIALBUS=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5TOOLS=y
BR2_PACKAGE_QT5TOOLS_PIXELTOOL=y
BR2_PACKAGE_QT5TOOLS_QTDIAG=y
BR2_PACKAGE_QT5TOOLS_QTPATHS=y
BR2_PACKAGE_QT5TOOLS_QTPLUGININFO=y
BR2_PACKAGE_QT5WEBCHANNEL=y
BR2_PACKAGE_QT5ENGINIO=y

With the following error message during the qt5base build:

  Project ERROR: Library 'libpng' is not defined.

Could you take our branch, and see why there is this build failure ?

Note that our branch intentionally doesn't contain the OpenGL related
patches of your series, because they are not ready for merging (see the
comments).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
