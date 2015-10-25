From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:41:51 +0100
Subject: [Buildroot] [PATCH v5 27/36] package/efl/libedje: remove package
In-Reply-To: <1445720476-21517-28-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-28-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025164151.GY11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> Libedje is now available in efl package.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However. see a comment below...

> ---
> v5: remove libedje directory
> v4: update Config.in to use libefl
> v3: update legacy option for 2015.11
>     update help text
> ---
>  Config.in.legacy               |  7 +++++++
>  package/efl/Config.in          |  1 -
>  package/efl/libedje/Config.in  | 28 ----------------------------
>  package/efl/libedje/libedje.mk | 28 ----------------------------
>  4 files changed, 7 insertions(+), 57 deletions(-)
>  delete mode 100644 package/efl/libedje/Config.in
>  delete mode 100644 package/efl/libedje/libedje.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d35a241..3349c50 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.11"
>  
> +config BR2_PACKAGE_LIBEDJE
> +	bool "libedje package has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_EFL
> +	help
> +	  The libedje package has been removed with the efl bump to 1.15.

It would be interesting to explain that it has been integrating into the
libefl package by upstream, like so:

    With EFL 1.15, libedje is now provided by the libefl package.

Probably something similar for libethumb, below (forgot to say so in my
previous mail).

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_LIBETHUMB
>  	bool "libethumb package has been removed"
>  	select BR2_LEGACY

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
