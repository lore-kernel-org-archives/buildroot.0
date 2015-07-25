From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 18:48:10 +0200
Subject: [Buildroot] [PATCH 03/47] package/libcec: bump to version 3.0.1
In-Reply-To: <20150725164358.GL3662@free.fr>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-4-git-send-email-bernd.kuhls@t-online.de>
 <20150725164358.GL3662@free.fr>
Message-ID: <20150725164810.GM3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-07-25 18:43 +0200, Yann E. MORIN spake thusly:
> On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> > - reflect upstream changes of the build system by switching from
> >   an autotools-package to cmake-package
> > - package is broken with gcc 4.5.4
> >   https://github.com/Pulse-Eight/libcec/issues/78#issuecomment-91578591
> >   "4.6 is no longer supported. you need a C++ 11 compatible compiler,
> >    so 4.7 or newer"
> >   Since buildroot does not contain gcc 4.6 anymore, using
> >   depends on !BR2_GCC_VERSION_4_5_X
> >   is enough.
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> This does not build with the toolchain Linaro ARM 2014.09 (gcc-4.9), with
> a *lot* of error messages:
> 
> 
> 1) at configure time, a git issue:
> 
> -- git found: fatal: Not a git repository (or any parent up to mount point /home)
> Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
> \n
> 
> -- lib info: git revision: fatal: Not a git repository (or any parent up to mount point /home)
> Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
> \n, compiled on Sat Jul 25 16:13:04 UTC 2015 by ymorin at ns304657.ip-46-105-103.eu on
> Linux 3.13.0-55-generic (x86_64), features: P8_USB, P8_detect, 'RPi'

This one seems to have already been fixed upstream:

    https://github.com/Pulse-Eight/libcec/issues/112
    https://github.com/Pulse-Eight/libcec/commit/2f32a9debc1f148b5dfcfc463480f1432bb71725

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
