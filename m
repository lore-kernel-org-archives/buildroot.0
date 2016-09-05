From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 23:30:27 +0200
Subject: [Buildroot] [PATCH]     add new library: libpugixml
In-Reply-To: <20160904210846.1332-1-theo.debrouwere@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
Message-ID: <20160905233027.404898ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

This review is in addition to what Samuel Martin already said on the
same patch.

On Sun,  4 Sep 2016 23:08:46 +0200, Theo Debrouwere wrote:

> +LIBPUGIXML_VERSION = 1.7
> +LIBPUGIXML_SOURCE = pugixml-$(LIBPUGIXML_VERSION).tar.gz

Please use pugixml for the package name, since it's the upstream name.
Then you can drop this line as the value will be the default.

> +LIBPUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(LIBPUGIXML_VERSION)
> +LIBPUGIXML_LICENSE = MIT
> +LIBPUGIXML_LICENSE_FILES = docs/manual.html

Using an HTML file here is not really appropriate, as we concatenate
all license files into a big text file, so it's not really going to
look nice :/

The readme.txt is good enough as a license file.

> +LIBPUGIXML_INSTALL_STAGING = YES
> +
> +LIBPUGIXML_SUBDIR = scripts

Hum, why?

> +
> +# build libpugixml as a shared library
> +LIBPUGIXML_CONF_OPTS = -DBUILD_SHARED_LIBS=ON
> +
> +$(eval $(cmake-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
