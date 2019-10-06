From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Oct 2019 17:14:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/nbd: add host-pkgconf to
 dependencies
In-Reply-To: <20191006084912.10456-1-fontaine.fabrice@gmail.com>
References: <20191006084912.10456-1-fontaine.fabrice@gmail.com>
Message-ID: <20191006151424.GM10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-10-06 10:49 +0200, Fabrice Fontaine spake thusly:
> pkg-config is used to find libglib2 since version 3.17 and
> https://github.com/NetworkBlockDevice/nbd/commit/ef86bbd9da2e2116ec0da6f9c130fb52e89fc310

I was wondering why we had no build issue due to this, but nbd depends
on libglib2, and libglib2 already depends on host-pkgconf, so this was a
hidden dependency.

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nbd/nbd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
> index 484f3e695b..fa569f3224 100644
> --- a/package/nbd/nbd.mk
> +++ b/package/nbd/nbd.mk
> @@ -8,7 +8,7 @@ NBD_VERSION = 3.19
>  NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
>  NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
>  NBD_CONF_OPTS = --enable-lfs
> -NBD_DEPENDENCIES = libglib2
> +NBD_DEPENDENCIES = host-pkgconf libglib2
>  NBD_LICENSE = GPL-2.0
>  NBD_LICENSE_FILES = COPYING
>  
> -- 
> 2.23.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
