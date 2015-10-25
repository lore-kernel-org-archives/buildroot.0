From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:13:48 +0100
Subject: [Buildroot] [PATCH v5 23/36] package/efl: libefl and
 libelementary share the same version number
In-Reply-To: <1445720476-21517-24-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-24-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025161348.GU11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, see a comment/question below...

> ---
>  package/efl/efl.mk                         | 2 ++
>  package/efl/libefl/libefl.mk               | 3 +--
>  package/efl/libelementary/libelementary.mk | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index 99e4d14..151ac28 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -1,2 +1,4 @@
>  
> +EFL_VERSION = 1.15.2
> +
>  include $(sort $(wildcard package/efl/*/*.mk))
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index 8ddca64..6aaa08b 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -4,8 +4,7 @@
>  #
>  ################################################################################
>  
> -# hardcode the version here since the bump to 1.15 is not complete in Buildroot
> -LIBEFL_VERSION = 1.15.2
> +LIBEFL_VERSION = $(EFL_VERSION)
>  LIBEFL_SOURCE = efl-$(LIBEFL_VERSION).tar.xz
>  LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
>  LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
> diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
> index 4ba8681..c920801 100644
> --- a/package/efl/libelementary/libelementary.mk
> +++ b/package/efl/libelementary/libelementary.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBELEMENTARY_VERSION = 1.15.2
> +LIBELEMENTARY_VERSION = $(EFL_VERSION)

Even though this is true right now, will that ever be the case?

I.e. are we sure libefl and libelementary will always be released in
tandem?

Regards,
Yann E. MORIN.

>  LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
>  LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
>  LIBELEMENTARY_LICENSE = LGPLv2.1
> -- 
> 2.4.3
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
