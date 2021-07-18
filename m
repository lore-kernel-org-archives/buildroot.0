From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 09:53:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: ignore CVE-2016-4983
In-Reply-To: <20210717212439.1146952-1-fontaine.fabrice@gmail.com>
References: <20210717212439.1146952-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718075337.GB12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-17 23:24 +0200, Fabrice Fontaine spake thusly:
> CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm,
> which is part of the Red Hat packaging and not part of upstream dovecot
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dovecot/dovecot.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
> index 93d04fc8a1..cb1cc990a1 100644
> --- a/package/dovecot/dovecot.mk
> +++ b/package/dovecot/dovecot.mk
> @@ -18,6 +18,10 @@ DOVECOT_DEPENDENCIES = \
>  # add host-gettext for AM_ICONV macro
>  DOVECOT_DEPENDENCIES += host-gettext
>  
> +# CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
> +# is part of the Red Hat packaging and not part of upstream dovecot
> +DOVECOT_IGNORE_CVES += CVE-2016-4983
> +
>  DOVECOT_CONF_ENV = \
>  	RPCGEN=__disable_RPCGEN_rquota \
>  	i_cv_epoll_works=yes \
> -- 
> 2.30.2
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
