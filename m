From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:21:40 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/libtextstyle: new package
In-Reply-To: <20200421170744.1891915-1-aduskett@gmail.com>
References: <20200421170744.1891915-1-aduskett@gmail.com>
Message-ID: <20200421222140.0ce8dd07@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 10:07:42 -0700
aduskett at gmail.com wrote:

> diff --git a/package/libtextstyle/Config.in b/package/libtextstyle/Config.in
> new file mode 100644
> index 0000000000..6858be5bf6
> --- /dev/null
> +++ b/package/libtextstyle/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBTEXTSTYLE
> +	bool "libtextstyle"
> +	depends on BR2_USE_WCHAR

We don't need a target variant of libtextstyle, at least as far as I
could test when looking at the v2 of your series. Indeed, libtextstyle
is needed to build gettext-tools, but not to build gettext-runtime.

So you can drop the target variant of libtextstyle entirely, make
libtextstyle a host-only package, and of course in gettext-gnu, only
use host-libtextstyle for the host-gettext-gnu.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
