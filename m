From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 08:51:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-opcua-asyncio : new
 package
In-Reply-To: <20200904143301.6657-3-jugurtha.belkalem@smile.fr>
References: <20200904143301.6657-1-jugurtha.belkalem@smile.fr>
 <20200904143301.6657-3-jugurtha.belkalem@smile.fr>
Message-ID: <20200907085157.13c404d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks, I've applied to master, with a few changes. See below.

On Fri,  4 Sep 2020 16:33:01 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
> new file mode 100644
> index 0000000000..6dee004b9b
> --- /dev/null
> +++ b/package/python-opcua-asyncio/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
> +	bool "python-opcua-asyncio"
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_DATEUTIL #runtime
> +	select BR2_PACKAGE_PYTHON_PYTZ #runtime
> +	select BR2_PACKAGE_PYTHON_LXML #runtime
> +	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY #runtime
> +	select BR2_PACKAGE_PYTHON_AIOFILES #runtime

In general, we like to have such lists alphabetically sorted. Also we
usually have a space after the # that marks the start of a comment.

> +sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
> +sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  COPYING

This license file hash was incorrect. Did you test "make legal-info"
with this package enabled ?

> +PYTHON_OPCUA_ASYNCIO_VERSION = 0.8.4
> +PYTHON_OPCUA_ASYNCIO_SOURCE = opcua-asyncio-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
> +PYTHON_OPCUA_ASYNCIO_SITE = $(call github,FreeOpcUa,opcua-asyncio,$(PYTHON_OPCUA_ASYNCIO_VERSION))
> +PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
> +PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0

The license really is LGPL-3.0+, as indicated in the setup.py file, so
I fixed that as well.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
