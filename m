From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:21:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5webview: new package
In-Reply-To: <20191006121331.11015-2-bernd.kuhls@t-online.de>
References: <20191006121331.11015-1-bernd.kuhls@t-online.de>
 <20191006121331.11015-2-bernd.kuhls@t-online.de>
Message-ID: <20191007222151.6dca437b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 14:13:31 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> From: Bartosz Bilas <b.bilas@grinn-global.com>
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> [Bernd: bump version to 5.12.5]
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks Bernd for picking up the patch from Bartosz.

> diff --git a/package/qt5/qt5webview/Config.in b/package/qt5/qt5webview/Config.in
> new file mode 100644
> index 0000000000..d76061ceba
> --- /dev/null
> +++ b/package/qt5/qt5webview/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_QT5WEBVIEW
> +	bool "qt5webview"
> +	depends on BR2_PACKAGE_QT5WEBENGINE
> +	select BR2_PACKAGE_QT5BASE

This select was not needed, because whenever BR2_PACKAGE_QT5 is
enabled, it selects BR2_PACKAGE_QT5BASE. And if BR2_PACKAGE_QT5 is not
enabled, you can't even see BR2_PACKAGE_QT5WEBVIEW.

> diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
> new file mode 100644
> index 0000000000..4e0103de8c
> --- /dev/null
> +++ b/package/qt5/qt5webview/qt5webview.mk
> @@ -0,0 +1,55 @@
> +################################################################################
> +#
> +# qt5webwiev

qt5webview

Applied after fixing those small issues.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
