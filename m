From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Mar 2017 22:20:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: fix libusb detection
In-Reply-To: <20170321070926.14178-1-bernd.kuhls@t-online.de>
References: <20170321070926.14178-1-bernd.kuhls@t-online.de>
Message-ID: <20170321212033.GD3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-03-21 08:09 +0100, Bernd Kuhls spake thusly:
> gnupg2 does not use pkgconf to detect the include dir of libusb.
> 
> Fixes
> http://autobuild.buildroot.net/results/70c/70c9f5f8ae77fbda2b5eba3aacf831430dc59a1c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is not the best fix, but the best fix would require use of
pkg-config. Maybe worth pushing that support upstream? ;-)

Regards,
Yann E. MORIN.

> ---
>  package/gnupg2/gnupg2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 5815e7003..3932c3a0f 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -43,6 +43,7 @@ GNUPG2_CONF_OPTS += --disable-gnutls
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
> +GNUPG2_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/libusb-1.0"
>  GNUPG2_CONF_OPTS += --enable-ccid-driver
>  GNUPG2_DEPENDENCIES += libusb-compat
>  else
> -- 
> 2.11.0
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
