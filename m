From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 May 2020 21:01:06 +0200
Subject: [Buildroot] [PATCH] package/cracklib: Force usage of buildroot
 python2 binary
In-Reply-To: <20200519134707.3070779-1-stefan.sorensen@spectralink.com>
References: <20200519134707.3070779-1-stefan.sorensen@spectralink.com>
Message-ID: <20200519190106.GD27030@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2020-05-19 15:47 +0200, Stefan S?rensen spake thusly:
> Fixes:
>   http://autobuild.buildroot.net/results/638f2e67b20d99994f1ccc08a9ecc32a2e3c3a40
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

We have another patch that allows building with either python(2) or
python3, which I believe is better:
    https://patchwork.ozlabs.org/project/buildroot/patch/20200202205306.1785085-2-fontaine.fabrice at gmail.com/

Regards,
Yann E. MORIN.

> ---
>  package/cracklib/cracklib.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
> index 91d510ff34..f17c717025 100644
> --- a/package/cracklib/cracklib.mk
> +++ b/package/cracklib/cracklib.mk
> @@ -21,7 +21,8 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  CRACKLIB_CONF_OPTS += --with-python
> -CRACKLIB_DEPENDENCIES += python
> +CRACKLIB_DEPENDENCIES += python host-python
> +CRACKLIB_CONF_ENV += PYTHON=$(HOST_DIR)/bin/python2
>  else
>  CRACKLIB_CONF_OPTS += --without-python
>  endif
> -- 
> 2.25.4
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
