From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:18:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-pyalsa: new package
In-Reply-To: <20200104155902.10810-1-juju@cotds.org>
References: <20191231174019.19617-1-juju@cotds.org>
 <20200104155902.10810-1-juju@cotds.org>
Message-ID: <20200419221848.616e101f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 16:59:02 +0100
Julien Olivain <juju@cotds.org> wrote:

> Official ALSA Python binding, including hardware
> management, mixer and sequencer control.
> 
> http://www.alsa-project.org/
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>

Thanks, I've applied. There was however one significant issue, see
below.

> diff --git a/package/python-pyalsa/Config.in b/package/python-pyalsa/Config.in
> new file mode 100644
> index 0000000000..f379096058
> --- /dev/null
> +++ b/package/python-pyalsa/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYALSA
> +	bool "python-pyalsa"

You forgot to select BR2_PACKAGE_ALSA_LIB, and some of its sub-options,
which are needed for this package to build.

> +PYTHON_PYALSA_VERSION = 1.1.6
> +PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
> +PYTHON_PYALSA_SITE = ftp://ftp.alsa-project.org/pub/pyalsa
> +PYTHON_PYALSA_SETUP_TYPE = distutils
> +PYTHON_PYALSA_LICENSE = LGPL-2.1+

And you forgot to add "alsa-lib" to PYTHON_PYALSA_DEPENDENCIES.

I fixed these issues, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
