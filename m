From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jun 2016 00:13:18 +0200
Subject: [Buildroot] [PATCH 3/7] Add host-libcap-ng capabilities.
In-Reply-To: <1466803929-5513-3-git-send-email-Aduskett@gmail.com>
References: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
 <1466803929-5513-3-git-send-email-Aduskett@gmail.com>
Message-ID: <20160624221318.GE4157@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2016-06-24 17:32 -0400, Adam Duskett spake thusly:
> host-libcap-ng can be a requirement for host-audit.  This allows libcap-ng to be compiled as a host package.

Too long line. Please wrap at <80 chars.

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, as discussed on IRC: this patch should come before you
introduce the host variant for the audit package.

So, probably in this order:

  - add host-libcap-ng
  - bump audit to 2.5
  - add host-audit

Regards,
Yann E. MORIN.

> ---
>  package/libcap-ng/libcap-ng.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
> index d78f5dc..543cbe6 100644
> --- a/package/libcap-ng/libcap-ng.mk
> +++ b/package/libcap-ng/libcap-ng.mk
> @@ -13,4 +13,8 @@ LIBCAP_NG_INSTALL_STAGING = YES
>  LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
>  LIBCAP_NG_CONF_OPTS = --without-python
>  
> +HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
> +HOST_LIBCAP_NG_CONF_OPTS = --without-python
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
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
