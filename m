From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 22:55:12 +0200
Subject: [Buildroot] [PATCHv2 1/6] minidlna: do not select
 BR2_PACKAGE_GETTEXT_TOOLS
In-Reply-To: <1401654214-19384-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401654214-19384-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401654214-19384-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140608205512.GR3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-01 22:23 +0200, Thomas Petazzoni spake thusly:
> Commit 9ff640ae30ca588228030faf2c6fd13af292cb66 ("minidlna: needs
> gettext and host-gettext tools if locale is enabled") modified the
> minidlna package to fix gettext related issues. As part of this patch,
> a select of BR2_PACKAGE_GETTEXT_TOOLS was added, which according to
> the commit title is used to have host-gettext tools installed.
> 
> However, this is not what this option is about: this option is about
> having gettext tools installed on the target.
> 
> Since this is not what minidlna needs, and we anyway plan to remove
> this BR2_PACKAGE_GETTEXT_TOOLS option, this commit removes this
> incorrect select statement.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/minidlna/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
> index 4a46b0c..5c5306d 100644
> --- a/package/minidlna/Config.in
> +++ b/package/minidlna/Config.in
> @@ -14,7 +14,6 @@ config BR2_PACKAGE_MINIDLNA
>  	select BR2_PACKAGE_LIBJPEG
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> -	select BR2_PACKAGE_GETTEXT_TOOLS if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
>  	  fully compliant with DLNA/UPnP-AV clients.
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
