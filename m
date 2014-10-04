From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Oct 2014 18:30:51 +0200
Subject: [Buildroot] [RFC 1/3] Rename XBMC to Kodi - part I - move files
In-Reply-To: <1412439081-2975-2-git-send-email-bernd.kuhls@t-online.de>
References: <1412439081-2975-1-git-send-email-bernd.kuhls@t-online.de>
 <1412439081-2975-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141004163050.GB3990@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-04 18:11 +0200, Bernd Kuhls spake thusly:
> Background information: http://xbmc.org/introducing-kodi-14
> 
> In a first step to bump version to 14.0-Helix move the package
> to its new directory. Because git will not recognize the moved
> files due to many upcoming changes to variable names the move
> is done in this seperate commit.

The packages infrastructure uses the name of the directory to derive the
name of the package.

All this patch does is move the XBMC package to a directory named 'kodi'.

Thus, xbmc no longer exists for the package infrastructure, and is thus
no longer buildable.

So, NAK, as-is.

OTOH, it makes it easy for review.

But a final patch would be the renaming of the files *and* options in a
single patch, which could be done by the committer.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                                                    |    2 +-
>  package/{xbmc => kodi}/Config.in                                     |    0
>  package/{xbmc/S50xbmc => kodi/S50kodi}                               |    0
>  package/{xbmc/br-xbmc => kodi/br-kodi}                               |    0
>  .../kodi-0001-Fixup-include-path.patch}                              |    0
>  .../{xbmc/xbmc-0002-mathutil.patch => kodi/kodi-0002-mathutil.patch} |    0
>  package/{xbmc/xbmc.mk => kodi/kodi.mk}                               |    0
>  package/{xbmc/xbmc.service => kodi/kodi.service}                     |    0
>  8 files changed, 1 insertion(+), 1 deletion(-)
>  rename package/{xbmc => kodi}/Config.in (100%)
>  rename package/{xbmc/S50xbmc => kodi/S50kodi} (100%)
>  rename package/{xbmc/br-xbmc => kodi/br-kodi} (100%)
>  rename package/{xbmc/xbmc-0001-Fixup-include-path.patch => kodi/kodi-0001-Fixup-include-path.patch} (100%)
>  rename package/{xbmc/xbmc-0002-mathutil.patch => kodi/kodi-0002-mathutil.patch} (100%)
>  rename package/{xbmc/xbmc.mk => kodi/kodi.mk} (100%)
>  rename package/{xbmc/xbmc.service => kodi/kodi.service} (100%)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7f8faff..b9ba2cc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -14,6 +14,7 @@ menu "Audio and video applications"
>  	source "package/gstreamer/Config.in"
>  	source "package/gstreamer1/Config.in"
>  	source "package/jack2/Config.in"
> +	source "package/kodi/Config.in"
>  	source "package/lame/Config.in"
>  	source "package/libvpx/Config.in"
>  	source "package/madplay/Config.in"
> @@ -33,7 +34,6 @@ menu "Audio and video applications"
>  	source "package/vlc/Config.in"
>  	source "package/vorbis-tools/Config.in"
>  	source "package/wavpack/Config.in"
> -	source "package/xbmc/Config.in"
>  	source "package/yavta/Config.in"
>  	source "package/ympd/Config.in"
>  endmenu
> diff --git a/package/xbmc/Config.in b/package/kodi/Config.in
> similarity index 100%
> rename from package/xbmc/Config.in
> rename to package/kodi/Config.in
> diff --git a/package/xbmc/S50xbmc b/package/kodi/S50kodi
> similarity index 100%
> rename from package/xbmc/S50xbmc
> rename to package/kodi/S50kodi
> diff --git a/package/xbmc/br-xbmc b/package/kodi/br-kodi
> similarity index 100%
> rename from package/xbmc/br-xbmc
> rename to package/kodi/br-kodi
> diff --git a/package/xbmc/xbmc-0001-Fixup-include-path.patch b/package/kodi/kodi-0001-Fixup-include-path.patch
> similarity index 100%
> rename from package/xbmc/xbmc-0001-Fixup-include-path.patch
> rename to package/kodi/kodi-0001-Fixup-include-path.patch
> diff --git a/package/xbmc/xbmc-0002-mathutil.patch b/package/kodi/kodi-0002-mathutil.patch
> similarity index 100%
> rename from package/xbmc/xbmc-0002-mathutil.patch
> rename to package/kodi/kodi-0002-mathutil.patch
> diff --git a/package/xbmc/xbmc.mk b/package/kodi/kodi.mk
> similarity index 100%
> rename from package/xbmc/xbmc.mk
> rename to package/kodi/kodi.mk
> diff --git a/package/xbmc/xbmc.service b/package/kodi/kodi.service
> similarity index 100%
> rename from package/xbmc/xbmc.service
> rename to package/kodi/kodi.service
> -- 
> 1.7.10.4
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
