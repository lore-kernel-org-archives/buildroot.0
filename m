From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 21:54:28 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: stop qt stripping installed
 libraries
In-Reply-To: <1401306290-25105-1-git-send-email-will_wagner@carallon.com>
References: <1401306290-25105-1-git-send-email-will_wagner@carallon.com>
Message-ID: <20140528195428.GH3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On 2014-05-28 20:44 +0100, will_wagner at carallon.com spake thusly:
> From: Will Wagner <will_wagner@carallon.com>
> 
> By default the 'make install' step for qt5base will strip all the binaries
> and libraries when they are stinalled to staging. This hinders debugging

stinalled? :-)

> as the libries in staging dir have been stripped and is unnecessary
> as buildroot will strip all files on the target
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>

Otherwise, I'm OK with what this change is supposed to do. Not a Qt
expert, so not sure this is the correct way of doing things, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../qt5/qt5base/qt5base-0002-mkspecs-files.patch   |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> index 06436b4..6283bbe 100644
> --- a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> +++ b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> @@ -14,13 +14,14 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>  ===================================================================
>  --- /dev/null
>  +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -@@ -0,0 +1,11 @@
> +@@ -0,0 +1,12 @@
>  +include(../common/linux_device_pre.conf)
>  +
>  +#modifications to gcc-base.conf
>  +QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
>  +QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
>  +QMAKE_CXXFLAGS_RELEASE += -O3
> ++CONFIG                 += nostrip
>  +
>  +QMAKE_LIBS             += -lrt -lpthread -ldl
>  +
> -- 
> 1.7.2.5
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
