From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 17:25:11 +0100
Subject: [Buildroot] [PATCH 4/5] xerces: make sure to use the
 cross-compiled curl
In-Reply-To: <1419688038-15640-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419688038-15640-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141227162511.GH4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-27 14:47 +0100, Thomas Petazzoni spake thusly:
> When curl support is enabled in xerces, and a host curl is available
> on the system, it might try to use it, so this patch adds --with-curl=
> to the configure options to explicitly indicate where is the curl
> library to use.
> 
> Should fix:
> 
>   http://autobuild.buildroot.org/results/c3c/c3c6be45d0f764fb931a46dbf1509ccf2916ecbf/
> 
>   (We were not able to reproduce specifically this problem, but
>   another similar problem, where curl was detected, but considered as
>   non-working because of the compilation failure of a test program.)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xerces/xerces.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
> index 36955e3..9b2bb81 100644
> --- a/package/xerces/xerces.mk
> +++ b/package/xerces/xerces.mk
> @@ -20,7 +20,7 @@ XERCES_DEPENDENCIES += libiconv
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
> -XERCES_CONF_OPTS += --enable-netaccessor-curl
> +XERCES_CONF_OPTS += --enable-netaccessor-curl --with-curl=$(STAGING_DIR)/usr/lib
>  XERCES_DEPENDENCIES += libcurl
>  else
>  XERCES_CONF_OPTS += --disable-network
> -- 
> 2.1.0
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
