From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 23:48:45 +0100
Subject: [Buildroot] [PATCH 1/3] binutils: remove dead code
In-Reply-To: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141101224845.GN10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-28 23:19 +0100, Thomas Petazzoni spake thusly:
> We no longer have any way of using version 2.23, and all the other
> versions that we support are available as .tar.bz2. Therefore we can
> remove the special case related to the 2.23 version only being
> available as a .tar.gz archive.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/binutils/binutils.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index f40c45f..ab9f167 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -16,10 +16,6 @@ BINUTILS_VERSION = 2.21
>  endif
>  endif
>  
> -ifeq ($(BINUTILS_VERSION),2.23)
> -BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
> -endif
> -
>  ifeq ($(ARCH),avr32)
>  BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
>  endif
> -- 
> 2.0.0
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
