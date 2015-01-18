From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 16:01:52 +0100
Subject: [Buildroot] [PATCH 3/3] package/rpm: use 'none' for location
	path
In-Reply-To: <1421580900-15186-3-git-send-email-romain.naour@openwide.fr>
References: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
 <1421580900-15186-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150118150152.GI4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-01-18 12:35 +0100, Romain Naour spake thusly:
> The recognized keywords are:
> (location path: "external:internal:none")
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, some comments below...

> ---
>  package/rpm/rpm.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index ce7189e..6725ca4 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -34,14 +34,14 @@ ifeq ($(BR2_PACKAGE_PCRE),y)

... here ...

>  RPM_DEPENDENCIES += pcre
>  RPM_CONF_OPTS += --with-pcre=external
>  else
> -RPM_CONF_OPTS += --with-pcre=no
> +RPM_CONF_OPTS += --with-pcre=none
>  endif
>  
>  ifeq ($(BR2_PACKAGE_FILE),y)

... and here, we do rely on the dependant packages, without adding
sub-options to rpm to select them. I think we should do the same for
bzip2 and xz.

Regards,
Yann E. MORIN.

>  RPM_DEPENDENCIES += file
>  RPM_CONF_OPTS += --with-file=external
>  else
> -RPM_CONF_OPTS += --with-file=no
> +RPM_CONF_OPTS += --with-file=none
>  endif
>  
>  ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
> -- 
> 1.9.3
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
