From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Nov 2014 17:43:08 +0100
Subject: [Buildroot] [RFC/PATCH v5 00/13] package/kodi: Bump version to
 14.0b2-Helix
In-Reply-To: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141108164308.GB7925@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-08 15:53 +0100, Bernd Kuhls spake thusly:
> this patchset is a RFC and not meant to be committed to buildroot git yet.
> 
> The follow-up version of XBMC 13.x-Gotham will be called Kodi, its beta2 was
> released November 8th.
> 
> In order to prepare this version bump I am sharing my patchset as an RFC, two
> preparatory patches to rename the package, splitted for easier review, and one
> patch for the real version bump.

Of all those patches, are there some we could apply even before Kodi is
officially out?

For example, could we apply the libcec bump right now, ie.e is it
useable for XBMC?

Regards,
Yann E. MORIN.

> Bernd Kuhls (13):
>   package/libcec: Bump to version 2.2.0
>   package/ffmpeg: Add Kodi patchset
>   Rename XBMC to Kodi - part I - move files
>   Rename XBMC to Kodi - part II - rename variables
>   package/kodi: Bump version to 14.0b2-Helix
>   xbmc-pvr-addons: Bump version for Helix-compatibility
>   package/xbmc-addon-xvdr: Bump version for Helix-compatibility
>   package/kodi: New option to enable support for optical drives
>   package/kodi: Enable install to STAGING_DIR, needed for audioencoder
>     addons
>   package/kodi-audioencoder-flac: New package
>   package/kodi-audioencoder-lame: New package
>   package/kodi-audioencoder-vorbis: New package
>   package/kodi-audioencoder-wav: New package
> 
>  package/alsa-utils/Config.in                     |    1 -
>  package/alsa-utils/alsa-utils-0001-libintl.patch |   23 ----
>  package/alsa-utils/alsa-utils.mk                 |   11 +-
>  package/ffmpeg/ffmpeg-0001-fminf.patch           |   47 ++++++++
>  package/lame/lame.mk                             |   13 ---
>  package/openssl/openssl.mk                       |    2 -
>  package/uclibc/0.9.33.2/uclibc-0063-fminf.patch  |  127 ----------------------
>  package/x11r7/xserver_xorg-server/Config.in      |    1 -
>  8 files changed, 48 insertions(+), 177 deletions(-)
>  delete mode 100644 package/alsa-utils/alsa-utils-0001-libintl.patch
>  create mode 100644 package/ffmpeg/ffmpeg-0001-fminf.patch
>  delete mode 100644 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch
> 
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
