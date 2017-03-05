From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 5 Mar 2017 18:37:58 +0200
Subject: [Buildroot] [PATCH 1/9] package/lensfun: new package
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305163758.wasshg7tnjfmdnmq@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sun, Mar 05, 2017 at 04:09:56PM +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>

[...]

> diff --git a/package/lensfun/Config.in b/package/lensfun/Config.in
> new file mode 100644
> index 0000000..3095238
> --- /dev/null
> +++ b/package/lensfun/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_LENSFUN
> +	bool "lensfun"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2

Missing 'select BR2_PACKAGE_LIBGLIB2'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
