From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 18:07:07 +0200
Subject: [Buildroot] [PATCH 5/6] gmp: correct legal info
In-Reply-To: <1467636386-6759-5-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1467636386-6759-5-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160704160707.GE3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-07-04 18:16 +0530, Rahul Bedarkar spake thusly:
> Since version 6, GMP is distributed under the dual licenses LGPLv3+ or
> GPLv2+
> 
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/gmp/gmp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
> index cdde794..485bf7c 100644
> --- a/package/gmp/gmp.mk
> +++ b/package/gmp/gmp.mk
> @@ -8,8 +8,8 @@ GMP_VERSION = 6.1.1
>  GMP_SITE = $(BR2_GNU_MIRROR)/gmp
>  GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
>  GMP_INSTALL_STAGING = YES
> -GMP_LICENSE = LGPLv3+
> -GMP_LICENSE_FILES = COPYING.LESSERv3
> +GMP_LICENSE = LGPLv3+ or GPLv2+
> +GMP_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2

There are also COPYING and COPYINGv3; both contain the text of the
GPLv3. I'm not sure whether we should carry them or not...

I've looked at a few files, used a few grep-fuu, and they seem to really
consistently refer to either LGPLv3 or GPLv2, which is what you wrote.

So I'd be tempted to agree with you.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  GMP_DEPENDENCIES = host-m4
>  HOST_GMP_DEPENDENCIES = host-m4
>  
> -- 
> 2.6.2
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
