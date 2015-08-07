From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 07 Aug 2015 20:56:58 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/x11r7/libepoxy: bump version
 to 1.3.1, fix OpenGL / EGL dependencies
References: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
 <20150806090135.21f7d8f7@free-electrons.com>
Message-ID: <qkbf9cx3g5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Thu, 06 Aug 2015 09:01:35 +0200 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> 
> On Sat,  1 Aug 2015 18:07:14 +0200, Bernd Kuhls wrote:
>> libepoxy depends on egl, opengl is an optional dependency
>> 
>> Fixes
>> http://autobuild.buildroot.net/results/f7e/
f7e6a42f53cb4ca523d2eeefde85c44770f6011e
>> http://autobuild.buildroot.net/
results/025/025a3d3b4d3dd4f496dcbf09f2dd279116250207
>> 
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
> 
> Could you separate the libepoxy bump from the OpenGL/EGL dependency fix?
> We're past -rc1, so I can apply fixes, but not version bumps.

done: http://patchwork.ozlabs.org/patch/505222/

> Also, could you get back to Yann E. Morin who asked some questions about
> this patch?

The problem mentioned by Yann is fixed by
http://patchwork.ozlabs.org/patch/502988/

This patch ( http://patchwork.ozlabs.org/patch/502832/ ), which should be 
applied after the two patches mentioned here, opens up glamor support in 
X.org xserver for other libegl providers.

The glamor capability depends on libepoxy & dri3 support, enabling glamor 
needs knowledge about these facts atm. What about adding a Kconfig option 
to package/x11r7/xserver_xorg-server/Config.in like 
BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX?

Regards, Bernd
