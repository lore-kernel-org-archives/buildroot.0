From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 23:50:45 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/python-esptool: new package
In-Reply-To: <20191107170504.1327891-2-b.bilas@grinn-global.com>
References: <20191107170504.1327891-1-b.bilas@grinn-global.com>
 <20191107170504.1327891-2-b.bilas@grinn-global.com>
Message-ID: <20191107235045.667813a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

On Thu,  7 Nov 2019 18:05:04 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index e9f5345520..49440930fc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -259,6 +259,7 @@ N:	Bartosz Bilas <b.bilas@grinn-global.com>
>  F:	package/qt5/qt5scxml/
>  F:	package/qt5/qt5webview/
>  F:	package/python-pyaes
> +F:	package/python-esptool

Alphabetic ordering + final /.


> diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
> new file mode 100644
> index 0000000000..10066797a7
> --- /dev/null
> +++ b/package/python-esptool/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_ESPTOOL
> +	bool "python-esptool"
> +	select BR2_PACKAGE_PYTHON_SERIAL # runtime
> +	select BR2_PACKAGE_PYTHON_PYAES # runtime
> +	select BR2_PACKAGE_PYTHON_ECDSA # runtime

Alphabetic ordering.

> +PYTHON_ESPTOOL_LICENSE = GNU General Public License v2 or later (GPLv2+)

The proper way to describe this is just:

PYTHON_ESPTOOL_LICENSE = GPL-2.0+

Applied to next with those different issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
