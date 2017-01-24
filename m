From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:36:32 +1300
Subject: [Buildroot] [PATCH v2 1/2] bctoolbox: new package
In-Reply-To: <20170122210021.9463-1-joerg.krause@embedded.rocks>
References: <20170122210021.9463-1-joerg.krause@embedded.rocks>
Message-ID: <20170124223632.2d264e8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jan 2017 22:00:20 +0100, J?rg Krause wrote:

> diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
> new file mode 100644
> index 000000000..ee0757856
> --- /dev/null
> +++ b/package/bctoolbox/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_BCTOOLBOX
> +	bool "bctoolbox"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

BR2_INSTALL_LIBSTDCPP dependency was missing here: there is some C++
code in this library. So I've added that.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +BCTOOLBOX_CONF_OPTS += \
> +	-DENABLE_SHARED=OFF -DENABLE_STATIC=ON

Those two lines could have been on the same line, it's about 60-62
characters long, it definitely fits in the 80 characters limit. So I've
fixed the three occurrences of this.

Applied with those fixes, as well as a follow-up commit that adds you
to the DEVELOPERS file for this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
