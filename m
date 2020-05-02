From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 19:08:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: bump version to 3.0.10
In-Reply-To: <20200430172430.1050224-1-bernd.kuhls@t-online.de>
References: <20200430172430.1050224-1-bernd.kuhls@t-online.de>
Message-ID: <20200502170803.GO15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-04-30 19:24 +0200, Bernd Kuhls spake thusly:
> Release notes: https://www.videolan.org/developers/vlc-branch/NEWS
> 
> Added optional dependency to dav1d, reformatted hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/vlc/vlc.hash | 16 ++++++++--------
>  package/vlc/vlc.mk   |  9 ++++++++-
>  2 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
> index 9eb8ec9dcb..8b2910af49 100644
> --- a/package/vlc/vlc.hash
> +++ b/package/vlc/vlc.hash
> @@ -1,9 +1,9 @@
> -# From https://get.videolan.org/vlc/3.0.9.2/vlc-3.0.9.2.tar.xz.sha256
> -sha256 a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601 vlc-3.0.9.2.tar.xz
> -# From https://get.videolan.org/vlc/3.0.9.2/vlc-3.0.9.2.tar.xz.sha1
> -sha1 f68eb80c6cb2baa96279b85f04f08fffc7dbf308 vlc-3.0.9.2.tar.xz
> -# From https://get.videolan.org/vlc/3.0.9.2/vlc-3.0.9.2.tar.xz.md5
> -md5 bdedd425a7d41dc0664b1e65286c523c vlc-3.0.9.2.tar.xz
> +# From https://get.videolan.org/vlc/3.0.10/vlc-3.0.10.tar.xz.sha256
> +sha256  a966abfc7f3b2ff3adaa130306ecaf5d6ad3b6dc73385fc9ab0c1204029d4c31  vlc-3.0.10.tar.xz
> +# From https://get.videolan.org/vlc/3.0.10/vlc-3.0.10.tar.xz.sha1
> +sha1  4b3c75d1861bf463db53ba9059e8cc165f5c30a7  vlc-3.0.10.tar.xz
> +# From https://get.videolan.org/vlc/3.0.10/vlc-3.0.10.tar.xz.md5
> +md5  28417dd27462ccb014b7dc7e50e9e9d6  vlc-3.0.10.tar.xz
>  # Locally computed
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 801b99f884..965c9d5ca9 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VLC_VERSION = 3.0.9.2
> +VLC_VERSION = 3.0.10
>  VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
>  VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
>  VLC_LICENSE = GPL-2.0+, LGPL-2.1+
> @@ -123,6 +123,13 @@ else
>  VLC_CONF_OPTS += --disable-avahi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_DAV1D),y)
> +VLC_CONF_OPTS += --enable-dav1d
> +VLC_DEPENDENCIES += dav1d
> +else
> +VLC_CONF_OPTS += --disable-dav1d
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  VLC_CONF_OPTS += --enable-dbus
>  VLC_DEPENDENCIES += dbus
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
