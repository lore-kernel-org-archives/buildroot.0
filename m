From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:24:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-tqdm: new package
In-Reply-To: <20191103160158.16864-2-aussedat.louis@gmail.com>
References: <20191103160158.16864-1-aussedat.louis@gmail.com>
 <20191103160158.16864-2-aussedat.louis@gmail.com>
Message-ID: <20191104222423.4e957996@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis,

Thanks for your contribution.

On Sun,  3 Nov 2019 17:01:58 +0100
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> diff --git a/package/python-tqdm/Config.in b/package/python-tqdm/Config.in
> new file mode 100644
> index 0000000000..52978331dc
> --- /dev/null
> +++ b/package/python-tqdm/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_TQDM
> +	bool "python-tqdm"
> +	depends on BR2_PACKAGE_PYTHON3

According to PKG-INFO, both Python 2.x and Python 3.x are supported, so
I dropped this depends on.

> +PYTHON_TQDM_VERSION = 4.37.0
> +PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
> +PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/cc/7b/5878d4e1b01a2eb802f78ea277f2385072681cabefc8fb4fbdee28dd1869
> +PYTHON_TQDM_SETUP_TYPE = setuptools
> +PYTHON_TQDM_LICENSE = MPL-2.0

Parts are also under MIT, so I changed to:

PYTHON_TQDM_LICENSE = MPL-2.0, MIT

> +PYTHON_TQDM_LICENSE_FILES = LICENSE

The file is actually named LICENCE, not LICENSE, so I fixed that up.
You could have seen that by running "make legal-info" with a Buildroot
configuration that had your package enabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
