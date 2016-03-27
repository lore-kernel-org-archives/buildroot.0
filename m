From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sun, 27 Mar 2016 03:51:08 +0200
Subject: [Buildroot] [PATCH v4 1/3] python-ptyprocess: new package
In-Reply-To: <1459042284-6684-2-git-send-email-viktorin@rehivetech.com>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160327035108.436088b2@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Mar 2016 03:31:22 +0200
Jan Viktorin <viktorin@rehivetech.com> wrote:

> v4
> * bump to 0.5.1
> * source https://pypi.python.org/pypi/ptyprocess
> * added hash file
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---

[...]

> diff --git a/package/python-ptyprocess/python-ptyprocess.hash b/package/python-ptyprocess/python-ptyprocess.hash
> new file mode 100644
> index 0000000..3973414
> --- /dev/null
> +++ b/package/python-ptyprocess/python-ptyprocess.hash
> @@ -0,0 +1,4 @@
> +# got from https://pypi.python.org
> +md5sum	94e537122914cc9ec9c1eadcd36e73a1 ptyprocess-0.5.1.tar.gz
> +# computed manually
> +sha256sum 0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6  ptyprocess-0.5.1.tar.gz

Should be md5 and sha256 (without sum)...

> diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
> new file mode 100644
> index 0000000..74b1217
> --- /dev/null
> +++ b/package/python-ptyprocess/python-ptyprocess.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-ptyprocess
> +#
> +################################################################################
> +
> +PYTHON_PTYPROCESS_VERSION = 0.5.1
> +PYTHON_PTYPROCESS_SITE = https://pypi.python.org/pypi/ptyprocess

The URL should be https://pypi.python.org/packages/source/p/ptyprocess.

It seems I accidently didn't test the very last version, sorry. Now, it seems to work.

> +PYTHON_PTYPROCESS_SOURCE = ptyprocess-$(PYTHON_PTYPROCESS_VERSION).tar.gz
> +PYTHON_PTYPROCESS_LICENSE = ISC
> +PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
> +PYTHON_PTYPROCESS_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
