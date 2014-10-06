From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Oct 2014 19:27:40 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: remove unnecessary C flag
In-Reply-To: <1412594238-39906-1-git-send-email-kaszak@gmail.com>
References: <1412594238-39906-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141006172740.GB4122@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-10-06 13:17 +0200, Karoly Kasza spake thusly:
> Since commit 8bec0a1af57165081dc275f813c8c5c74ff12c14
> the -Wno-unused-local-typedefs CFLAG in not needed.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/openvmtools/openvmtools.mk |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> index 598107c..7aa04af 100644
> --- a/package/openvmtools/openvmtools.mk
> +++ b/package/openvmtools/openvmtools.mk
> @@ -41,7 +41,6 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
>  OPENVMTOOLS_CONF_OPTS += --with-pam
> -OPENVMTOOLS_MAKE_OPTS += CFLAGS+="-Wno-unused-local-typedefs"
>  OPENVMTOOLS_DEPENDENCIES += linux-pam
>  else
>  OPENVMTOOLS_CONF_OPTS += --without-pam
> -- 
> 1.7.10.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
