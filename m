From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jan 2017 18:23:54 +0100
Subject: [Buildroot] [PATCH] jasper: disable PDF documentation generation
In-Reply-To: <b17e9f42b1d2e17bb543c9d5b3b17e80a95c38d0.1484417309.git.baruch@tkos.co.il>
References: <b17e9f42b1d2e17bb543c9d5b3b17e80a95c38d0.1484417309.git.baruch@tkos.co.il>
Message-ID: <20170115172354.GH3552@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-01-14 20:08 +0200, Baruch Siach spake thusly:
> We don't need the PDF document on target. This also avoids incompatible host
> Latex packages.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e60/e60c4a71a08aebadd0bc3fb95a57a4a223e4b6fa/
> http://autobuild.buildroot.net/results/4ec/4ec8a1735590a3cad4b74630b4b6bdd2e3a7eec8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/jasper/jasper.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index f4db8c492064..d659682a56e9 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -10,6 +10,8 @@ JASPER_INSTALL_STAGING = YES
>  JASPER_LICENSE = JasPer License Version 2.0
>  JASPER_LICENSE_FILES = LICENSE
>  JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
> +JASPER_CONF_OPTS = -DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
> +		-DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE

In this situation, I prefer all options are on a line by the,selves:

    JASPER_CONF_OPTS = \
        -DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
        -DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_STATIC_LIBS),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
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
