From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 11:17:14 +0200
Subject: [Buildroot] [PATCH 1/3] package/rsyslog: Autoreconf is not
 necessary anymore
In-Reply-To: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411091714.GC4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-11 09:52 +0200, Bernd Kuhls spake thusly:
> Buildroot contains no patches for this package anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[build-tested only]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/rsyslog/rsyslog.mk |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index c6758eb..7d49ed1 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -16,8 +16,6 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
>  	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
>  RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
>  	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
> -# For mysql and pgsql support patches
> -RSYSLOG_AUTORECONF = YES
>  
>  # Build after BusyBox
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
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
