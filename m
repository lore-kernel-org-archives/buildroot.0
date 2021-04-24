From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 09:46:23 +0200
Subject: [Buildroot] [PATCH 3/3] package/bash: drop SHOBJ_STATUS from
 BASH_CONF_ENV
In-Reply-To: <20210423202356.37681-3-thomas.petazzoni@bootlin.com>
References: <20210423202356.37681-1-thomas.petazzoni@bootlin.com>
 <20210423202356.37681-3-thomas.petazzoni@bootlin.com>
Message-ID: <20210424074623.GN298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-04-23 22:23 +0200, Thomas Petazzoni spake thusly:
> SHOBJ_STATUS=unsupported was added in commit
> 4a2af11cba83ef176672609dd7321712fa7f6a28 to work around a limitation
> of the configure script that forgot to set this variable in
> static-linking configurations.
> 
> It turns out that this issue has been fixed upstream as of bash 5.0:
> 
>   https://git.savannah.gnu.org/cgit/bash.git/diff/configure.ac?id=d233b485e83c3a784b803fb894280773f16f2deb
> 
>   (see hunk @@ -1151,6 +1179,9 @@)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bash/bash.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 6913ccafd8..7b853ece08 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -29,7 +29,6 @@ BASH_CONF_ENV += \
>  # The static build needs some trickery
>  ifeq ($(BR2_STATIC_LIBS),y)
>  BASH_CONF_OPTS += --enable-static-link
> -BASH_CONF_ENV += SHOBJ_STATUS=unsupported
>  # bash wants to redefine the getenv() function. To check whether this is
>  # possible, AC_TRY_RUN is used which is not possible in
>  # cross-compilation.
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
