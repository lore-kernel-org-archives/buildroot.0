From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 03 Dec 2014 11:25:24 -0800
Subject: [Buildroot] [PATCH v4 00/14] Add Xorg support for iMX6
In-Reply-To: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
Message-ID: <547F63A4.9070007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome, All,

On 12/02/2014 01:58 AM, J?r?me Pouiller wrote:
> Hello,
>
> Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
> Xorg. This work is mainly adapted from Yocto.
>
> v4:
>    - Fix example config in commit log of xdriver_xf86-video-imx-viv
>    - Add a note about OpenGL API in xdriver_xf86-video-imx-viv help
>
> v3:
>    - Respin on next
>    - Add patch to use self-extractible helper function
>    - Remove 'See freescale-imx.mk' comment
>    - Reword patch "gpu-viv-bin-mx6q: change output selection mecanisms"
>    - libdrm: Apply new patch naming policy
>    - xdriver_xf86-video-imx-viv: Apply new patch naming policy
>    - xdriver_xf86-video-imx-viv: Does not depends directly on glibc
>    - qt5base: Apply new patch naming policy
>    - qmx6_defconfig: Use internal toochain
>
> v2:
>    - Rebase on new version of mesa3d
>    - Reorder some patches (in order to make examples I provide in commit message
>      functional)
>    - Do not bump version of all freescale packages
>    - Bump kernel version of imx6 boards
>
> [snip]

It seems I can't build Qt5 properly now... I get the following errors;
In file included from ../../../../include/QtCore/qtextstream.h:1:0,
                  from ../../../../include/QtCore/QTextStream:1,
                  from qeglfsscreen.h:47,
                  from qeglfswindow.h:46,
                  from qeglfsintegration.cpp:44:
../../../../include/QtCore/../../src/corelib/io/qtextstream.h:54:2: 
error: #error qtextstream.h must be included before any header file that 
defines Status
  #error qtextstream.h must be included before any header file that 
defines Status
...
Makefile:1860: recipe for target '.obj/qeglfsscreen.o' failed
make[6]: *** [.obj/qeglfsscreen.o] Error 1
Makefile:117: recipe for target 'sub-eglfs-make_first' failed
make[5]: *** [sub-eglfs-make_first] Error 2

Could you send your entire config file? That might be easier to track 
down the issue this way.

Also, I'm sorry not to have said something earlier but I'm not sure 
about your qmx6_defconfig as it includes graphics and Qt5 by default. I 
thought the config files were meant to be as minimalistic as possible 
for the user to decide what packages he wants to use. I'm not sure that 
adding Qt5 by default is suitable especially since this is the only 
defconfig doing so.

Thanks,
Gary
