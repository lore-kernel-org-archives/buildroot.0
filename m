From: Wojciech Ziniewicz <wojtek@gamecodehq.com>
Date: Thu, 13 May 2021 07:23:40 +0200
Subject: [Buildroot] Qt5 compilation error (libjpeg)
Message-ID: <F7ED58BD-6966-4CA2-AE16-6C1F6AEB883A@gamecodehq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is my first post on this group. 

I'm compiling qt5 kiosk and 2021.02 errors out on QT5.15.2 webengine compilation:

>>>>>>>>>>Begin

Package libjpeg was not found in the pkg-config search path.
Perhaps you should add the directory containing `libjpeg.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libjpeg', required by 'virtual:world', not found
Could not run pkg-config.
See //third_party/BUILD.gn:17:3: whence it was called.
 pkg_config("system_libjpeg") 

<<<<<<<<<<<End 

Not only libjpeg is explicitly defined by me in the config (BR2_PACKAGE_JPEG=y and BR2_PACKAGE_QT5BASE_JPEG=y just to be sure) but I can clearly see libjpeg being compiled during this process. What I think qtwebengine may be whining about is lack of host-libjpeg. So I'm getting exactlty the same error as in this official gitlab buildroot job here: https://gitlab.com/buildroot.org/buildroot/-/jobs/917539230

The error was previously reported and fixed with following patch: http://lists.buildroot.org/pipermail/buildroot/2020-December/299008.html 

FYI: the Freetype dependency was also erroring out but I added the package and qtwebenengine began to error out of libjpeg. 

I confirmed that the /usr/lib/x86_64-linux-gnu/pkgconfig/libjpeg.pc file exists inside the build environment.

My entire config file is available here: https://pastebin.com/ybjHhSG5

Any help or advice will be much appreciated
Wojtek 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210513/82e96410/attachment.html>
