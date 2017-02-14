From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Feb 2017 21:53:43 +0100
Subject: [Buildroot] [PATCH] cups: add host-pkgconf as a dependency
In-Reply-To: <1487105279-25370-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487105279-25370-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170214205343.GD3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-14 21:47 +0100, Thomas Petazzoni spake thusly:
> cups configure script checks for a pkg-config program. If host-pkgconf
> has not been built prior to cups, it uses the system pkg-config, which
> might potentially lead to bogus results:
> 
> checking for i586-buildroot-linux-musl-pkg-config... no
> checking for pkg-config... /usr/bin/pkg-config
> 
> With this patch applied:
> 
> checking for i586-buildroot-linux-musl-pkg-config... no
> checking for pkg-config... /home/thomas/projets/buildroot/output/host/usr/bin/pkg-config
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/cups/cups.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 0573776..7ef2f36 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -28,6 +28,7 @@ CUPS_CONF_OPTS = \
>  CUPS_CONFIG_SCRIPTS = cups-config
>  CUPS_DEPENDENCIES = \
>  	host-autoconf \
> +	host-pkgconf \
>  	$(if $(BR2_PACKAGE_ZLIB),zlib)
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -- 
> 2.7.4
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
