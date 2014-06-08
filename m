From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 14:50:12 +0200
Subject: [Buildroot] [PATCH v6 4/4] rpi-userland: cleanup *_CONF_OPT
In-Reply-To: <1401923053-30292-5-git-send-email-s.martin49@gmail.com>
References: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
 <1401923053-30292-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20140608125012.GC3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-06-05 01:04 +0200, Samuel Martin spake thusly:
> This change reverts the commit 5e3b1f31b3f82e3b163567f10d7131c9d649a2cf
> because rpi-userland is correctly built whatever the value of the
> BUILD_SHARED_LIBS CMake flags.
> 
> The cset 5e3b1f31b3f82e3b163567f10d7131c9d649a2cf originally intends to
> fix linkage/runtime failure in xbmc package because of missing flags in
> xbmc LIBS env. var. This has been fixed in the previous patch.
> 
> So, for rpi-userland package, BUILD_SHARED_LIBS does no longer need to
> be forced to OFF, and can safely be driven by the CMake infrastructure.

Fixes:
    http://autobuild.buildroot.net/results/6f3/6f36ad6a78d9c0e204d617ec6d15e7b577542c28/
    http://autobuild.buildroot.net/results/789/789fd88c66f898d0a2fd22acc27e9378dd4147af/
    http://autobuild.buildroot.net/results/588/58823900673d4b5304255c1c08ad529c262dd1ee/

Regards,
Yann E. MORIN.

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> changes v5 -> v6:
> - rebase
> 
> changes v4 -> v5:
> - rebase
> - extend commit log (ThomasP)
> 
> changes v3 -> v4:
> - rebase
> 
> changes v2 -> v3:
> - new patch
> ---
>  package/rpi-userland/rpi-userland.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 8b225ba..2de6b92 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -9,7 +9,7 @@ RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
>  RPI_USERLAND_LICENSE = BSD-3c
>  RPI_USERLAND_LICENSE_FILES = LICENCE
>  RPI_USERLAND_INSTALL_STAGING = YES
> -RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF
> +RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
>  
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>  
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
