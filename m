From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Dec 2015 22:46:45 +0100
Subject: [Buildroot] [PATCH 3/5] python-cffi: add host variant
In-Reply-To: <1450992641-8618-3-git-send-email-yegorslists@googlemail.com>
References: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
 <1450992641-8618-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151224214645.GA3738@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2015-12-24 22:30 +0100, Yegor Yefremov spake thusly:
> Host variant is needed to build python-cryptography package.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-cffi/python-cffi.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
> index 70fbe02..a6e4107 100644
> --- a/package/python-cffi/python-cffi.mk
> +++ b/package/python-cffi/python-cffi.mk
> @@ -11,5 +11,7 @@ PYTHON_CFFI_SETUP_TYPE = setuptools
>  PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
>  PYTHON_CFFI_LICENSE = MIT
>  PYTHON_CFFI_LICENSE_FILES = LICENSE
> +HOST_PYTHON_CFFI_DEPENDENCIES = host-python-pycparser

So, the host variant needs python-pycparser, but the target variantdoes
not?

I would have expect either:
    PYTHON_CFFI_DEPENDENCIES += host-python-pycparser

or:
    PYTHON_CFFI_DEPENDENCIES += python-pycparser

Care to shed some light on this, please?

Regards,
Yann E. MORIN.

>  $(eval $(python-package))
> +$(eval $(host-python-package))
> -- 
> 2.1.4
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
