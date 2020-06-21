From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 22:48:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpsd: drop patch
In-Reply-To: <20200621204132.1807797-1-fontaine.fabrice@gmail.com>
References: <20200621204132.1807797-1-fontaine.fabrice@gmail.com>
Message-ID: <20200621204842.GK2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-21 22:41 +0200, Fabrice Fontaine spake thusly:
> This patch is not needed since version 3.19 and
> https://gitlab.com/gpsd/gpsd/-/commit/e3ec42e08a08af377499551d0528fc6ddf74cc12
> 
> So drop this patch and set CCFLAGS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[--SNIP--]
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 49de4b256c..0925e0340f 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -200,7 +200,10 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
>  GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
>  endif
>  
> -GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
> +GPSD_SCONS_ENV += \
> +	LDFLAGS="$(GPSD_LDFLAGS)" \
> +	CFLAGS="$(GPSD_CFLAGS)" \
> +	CCFLAGS="$(GPS_CFLAGS)"

Typo: GPSD_CFLAGS, not GPS_CFLAGS, I guess?

Applied to master with that fixed. thanks.

Regards,
Yann E. MORIN.

>  define GPSD_BUILD_CMDS
>  	(cd $(@D); \
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
