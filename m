From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Mar 2017 16:34:22 +0100
Subject: [Buildroot] [PATCH] cryptsetup: install to staging
In-Reply-To: <1488727151-7633-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488727151-7633-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305153422.GG3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-05 16:19 +0100, Thomas Petazzoni spake thusly:
> cryptsetup installs a library and a header file, so it makes sense to
> install it to staging.
> 
> Fixes bug #9691.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Me 

Regards,
Yann E. MORIN.

> ---
>  package/cryptsetup/cryptsetup.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 50bf5f2..6081009 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -12,6 +12,7 @@ CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
>  	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
>  CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
>  CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
> +CRYPTSETUP_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
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
