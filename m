From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Aug 2014 10:22:07 +0200
Subject: [Buildroot] [PATCH 4 of 5 v3] uclibc: convert to
 kconfig-package infrastructure
In-Reply-To: <431289c9a7bcae14267c.1406922826@localhost>
References: <patchbomb.1406922822@localhost>
 <431289c9a7bcae14267c.1406922826@localhost>
Message-ID: <20140803082207.GE4052@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-01 21:53 +0200, Thomas De Schampheleire spake thusly:
> This patch converts the uclibc package to the new kconfig-package
> infrastructure, thus removing code duplication and ensuring a consistent
> behavior of kconfig packages.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Not removing my reviewed-by, but see below...

> diff -r fa937f090303 -r 431289c9a7bc package/uclibc/uclibc.mk
> --- a/package/uclibc/uclibc.mk	Thu Jul 24 20:54:50 2014 +0200
> +++ b/package/uclibc/uclibc.mk	Tue Jul 22 20:35:36 2014 +0200
[--SNIP--]
> +$(eval $(kconfig-package))
>  
>  # Before uClibc is built, we must have the second stage cross-compiler
>  $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate

Maybe we should add a comment saying why this should be after the
$(eval...) line. Something like:

    # Before uClibc is built, we must have the second stage cross-compiler.
    # This *must* be after the eval-line, because UCLIBC_TARGET_BUILD is
    # defined in there.
    $(eval .....)

With the above fixed, keep my:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
