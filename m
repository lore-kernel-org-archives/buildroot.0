From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:25:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/pixman: bump version to 0.40.0
In-Reply-To: <20200420180400.36290-1-bernd.kuhls@t-online.de>
References: <20200420180400.36290-1-bernd.kuhls@t-online.de>
Message-ID: <20200420212521.GP5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-04-20 20:04 +0200, Bernd Kuhls spake thusly:
> Upstream now provides sha256 & sha512 hashes only.
> 
> Switch _SITE to https and use upstream-provided xz tarball.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, after fixing the spaces in the hash file. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/pixman/pixman.hash | 8 ++++----
>  package/pixman/pixman.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
> index 7a79c206f1..c7cd0cab9b 100644
> --- a/package/pixman/pixman.hash
> +++ b/package/pixman/pixman.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2019-April/002991.html
> -md5 16a350a8a40116ddf67632a1d2623711  pixman-0.38.4.tar.bz2
> -sha1 87e1abc91ac4e5dfcc275f744f1d0ec3277ee7cd  pixman-0.38.4.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2020-April/003043.html
> +sha256 da8ed9fe2d1c5ef8ce5d1207992db959226bd4e37e3f88acf908fd9a71e2704e  pixman-0.40.0.tar.xz
> +sha512 8a60edb113d68791b41bd90b761ff7b3934260cb3dada3234c9351416f61394e4157353bc4d61b8f6c2c619de470f6feefffb4935bfcf79d291ece6285de7270  pixman-0.40.0.tar.xz
> +
>  # Locally computed
> -sha256 84abb7fa2541af24d9c3b34bf75d6ac60cc94ac4410061bbb295b66a29221550  pixman-0.38.4.tar.bz2
>  sha256 fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index e566603d29..a446ebca46 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PIXMAN_VERSION = 0.38.4
> -PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.bz2
> -PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
> +PIXMAN_VERSION = 0.40.0
> +PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
> +PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
>  PIXMAN_LICENSE = MIT
>  PIXMAN_LICENSE_FILES = COPYING
>  
> -- 
> 2.26.1
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
