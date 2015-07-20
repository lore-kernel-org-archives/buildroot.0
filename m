From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Jul 2015 21:18:25 +0300
Subject: [Buildroot] [PATCH] package/cython: new host package
In-Reply-To: <1437414949-16978-1-git-send-email-romain.naour@openwide.fr>
References: <1437414949-16978-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150720181825.GQ13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Jul 20, 2015 at 07:55:49PM +0200, Romain Naour wrote:
> Some phyton packages may use the Cython compiler.
> At least, one package (libplist) in Buildroot can use it.

Do you intend to post a patch adding cython support to libplit? Without that 
this patch just adds dead code.

> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/cython/cython.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 package/cython/cython.mk
> 
> diff --git a/package/cython/cython.mk b/package/cython/cython.mk
> new file mode 100644
> index 0000000..b730774
> --- /dev/null
> +++ b/package/cython/cython.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# cython
> +#
> +################################################################################
> +
> +CYTHON_VERSION = 0.22.1
> +CYTHON_SOURCE = Cython-$(CYTHON_VERSION).tar.gz

A .hash file is missing.

> +CYTHON_SITE = http://cython.org/release/
> +# Cython can also use setuptools
> +CYTHON_SETUP_TYPE = distutils
> +CYTHON_LICENSE = Apache-2.0
> +CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
> +
> +$(eval $(host-python-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
