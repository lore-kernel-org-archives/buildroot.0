From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jul 2015 22:51:32 +0200
Subject: [Buildroot] [PATCH] valgrind: install to staging
In-Reply-To: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150702205131.GE3838@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-07-02 17:52 +0200, Vicente Olivert Riera spake thusly:
> This is necessary for some packages depending on valgrind, such as
> libdrm which will fail with an error like this one:
> 
> checking for VALGRIND... no
> checking whether to enable Valgrind support... configure: error:
> Valgrind support required but not present
> package/pkg-generic.mk:146: recipe for target
> '/br/output/build/libdrm-2.4.62/.stamp_configured' failed
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/valgrind/valgrind.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index cfce8da..f8f205e 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -11,6 +11,7 @@ VALGRIND_LICENSE = GPLv2 GFDLv1.2
>  VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
>  VALGRIND_CONF_OPTS = --disable-tls
>  VALGRIND_AUTORECONF = YES
> +VALGRIND_INSTALL_STAGING = YES
>  
>  # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
>  # host tuple to determine whether it's being built for ARMv7 or
> -- 
> 2.3.6
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
