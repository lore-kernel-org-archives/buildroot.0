From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:22:04 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-piexif : new package
In-Reply-To: <20200901143731.2916-3-jugurtha.belkalem@smile.fr>
References: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
 <20200901143731.2916-3-jugurtha.belkalem@smile.fr>
Message-ID: <20200905232204.35d56f14@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Sep 2020 16:37:30 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> diff --git a/package/python-piexif/Config.in b/package/python-piexif/Config.in
> new file mode 100644
> index 0000000000..aad42cbaeb
> --- /dev/null
> +++ b/package/python-piexif/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_PIEXIF
> +	bool "python-piexif"
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_PILLOW

Looking at the code, I didn't really see where pillow is mandatory.
Apparently, you can pass images opened to pillow, but you don't have
to. So I dropped this "select". Of course, if that's incorrect, let me
know, and we can fix it.

> +	help
> +	  To simplify exif manipulations with Python.
> +	  Writing, reading, and more? Piexif is pure Python.
> +	  To everywhere with Python.

This description (from their github) is not super useful, I've instead
taken the description from their documentation, which is a bit more
sensible.

> +sha256	c9d2e27b56e1c47bb99ffac43d61077019dc54015d5e34d0e84411cce3d1bbde  LICENSE.txt

This hash was incorrect and didn't match the actual license file.

I fixed those issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
