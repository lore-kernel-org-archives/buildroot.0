From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 10:43:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl_ttf: Update to GitHub source
In-Reply-To: <20210321071038.1734475-1-glex.spb@gmail.com>
References: <20210321071038.1734475-1-glex.spb@gmail.com>
Message-ID: <20210321094319.GY3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gleb, All,

On 2021-03-21 07:10 +0000, Gleb Mazovetskiy spake thusly:
> SDL's canonical source is now on GitHub

The commit log did not explain why we did not use the git commit tht
matches the Hg commit we were using so far, so I've added a little blurb
that only the autotools file have been touched in-between.

> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/sdl_ttf/sdl_ttf.hash | 2 +-
>  package/sdl_ttf/sdl_ttf.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sdl_ttf/sdl_ttf.hash b/package/sdl_ttf/sdl_ttf.hash
> index 97416c18c6..0da8416bc9 100644
> --- a/package/sdl_ttf/sdl_ttf.hash
> +++ b/package/sdl_ttf/sdl_ttf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  f7bf5f6a4a21542a6ce5440dc0d81f3a26d029ee689e1fade62925b1e6667bd9  de50cffd41e6.tar.gz
> +sha256  c24e3b48f5ffa5afb3256d23700506fad72117ac2834147c2e46ee94c3cb12b5  sdl_ttf-70b2940cc7.tar.gz
>  sha256  b609721d3d4ac67facaf86f068c8b311b6c5f6cef89b6d84268aa38b7867ab7b  COPYING
> diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
> index 9ac12ef5b7..0fdb6d665b 100644
> --- a/package/sdl_ttf/sdl_ttf.mk
> +++ b/package/sdl_ttf/sdl_ttf.mk
> @@ -13,9 +13,8 @@
>  #
>  # DPI scaling is used for rendering on HiDPI displays and displays
>  # with non-square pixels.
> -SDL_TTF_VERSION = de50cffd41e6
> -SDL_TTF_SOURCE = $(SDL_TTF_VERSION).tar.gz
> -SDL_TTF_SITE = https://hg.libsdl.org/SDL_ttf/archive
> +SDL_TTF_VERSION = 70b2940cc7

We want to tuse full-length hashes to identify commits, so I've switched
to that.

Applied to master with the above fixed, thanks.

I've also applied your three other SDL-related changes, with similar
fixups. Thanks!

Regards,
Yann E. MORIN.

> +SDL_TTF_SITE = $(call github,libsdl-org,SDL_ttf,$(SDL_TTF_VERSION))
>  SDL_TTF_LICENSE = Zlib
>  SDL_TTF_LICENSE_FILES = COPYING
>  
> -- 
> 2.27.0
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
