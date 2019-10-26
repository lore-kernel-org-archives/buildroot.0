From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:30:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/bmap-tools: new package
In-Reply-To: <20191026144101.30599-1-nicolas.carrier@orolia.com>
References: <20191026144101.30599-1-nicolas.carrier@orolia.com>
Message-ID: <20191026193050.16ecf3dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Sat, 26 Oct 2019 14:41:18 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
> new file mode 100644
> index 0000000000..63301f2558
> --- /dev/null
> +++ b/package/bmap-tools/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_BMAP_TOOLS
> +	bool "bmap-tools"
> +	depends on BR2_PACKAGE_PYTHON3 || \
> +		BR2_PACKAGE_PYTHON

For some packages like this, we also do a simple select, because it's
not obvious you need Python.

> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS

Do you really need setuptools on the target? This seems odd.


> +BMAP_TOOLS_VERSION = v3.5

The "v" should be in BMAP_TOOLS_SITE, not BMAP_TOOLS_VERSION.

> +BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,$(BMAP_TOOLS_VERSION))
> +BMAP_TOOLS_LICENSE = GPLv2

Should be GPL-2.0

> +BMAP_TOOLS_LICENSE_FILES = COPYING
> +BMAP_TOOLS_SETUP_TYPE = setuptools
> +BMAP_TOOLS_DEPENDENCIES = \
> +	python-setuptools

Why do you need python-setuptools on the target, and be a build time
dependency ? BMAP_TOOLS_SETUP_TYPE = setuptools already says that this
package needs setuptools on the host for its build/installation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
