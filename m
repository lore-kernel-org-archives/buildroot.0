From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 23:11:24 +0200
Subject: [Buildroot] [PATCH] package/kodi: fix path to binary
In-Reply-To: <20170422210539.5750-1-yann.morin.1998@free.fr>
References: <20170422210539.5750-1-yann.morin.1998@free.fr>
Message-ID: <20170422211124.GO15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-04-22 23:05 +0200, Yann E. MORIN spake thusly:
> Since XBMC was renamed to Kodi, upstream is progressively propagating
> the rename to directories and files, and in some cases kept a legacy
> symlink xbmc->kodi, like /usr/lib/xbmc pointing to /usr/lib/kodi.
> 
> In 62165ae (package/kodi: Fix path to binary in service), the path nary

s/ nary$//

Not sure  what hapenned...

Regards,
Yann E. MORIN.

> was changed to use the new canonical path, but the init script was eft
> out. This was not seen previously, becasue of the legacy symlink.
> 
> But with the adevent of Kodi 17 (Krypton), that legacy symlink is no
> more, and the init script no longer works.
> 
> Do for the init script what was done two years ago for the service file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/S50kodi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kodi/S50kodi b/package/kodi/S50kodi
> index f00c59c5d9..0afe7a6706 100755
> --- a/package/kodi/S50kodi
> +++ b/package/kodi/S50kodi
> @@ -4,7 +4,7 @@
>  #
>  
>  BIN=/usr/bin/br-kodi
> -KODI=/usr/lib/xbmc/kodi.bin
> +KODI=/usr/lib/kodi/kodi.bin
>  KODI_ARGS="--standalone -fs -n"
>  PIDFILE=/var/run/kodi.pid
>  
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
