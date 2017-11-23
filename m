From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:15:44 +0100
Subject: [Buildroot] [PATCH v6 1/1] package/waylandpp: new package
In-Reply-To: <20171122183420.4544-1-bernd.kuhls@t-online.de>
References: <20171122183420.4544-1-bernd.kuhls@t-online.de>
Message-ID: <20171123221544.775472da@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Nov 2017 19:34:20 +0100, Bernd Kuhls wrote:

> diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
> new file mode 100644
> index 0000000000..726653421c
> --- /dev/null
> +++ b/package/waylandpp/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_WAYLANDPP
> +	bool "waylandpp"
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND

It is quite surprising that it needs libegl unconditionally, while
Wayland does not. But that's indeed what upstream requires, so...

> +	depends on BR2_HOST_GCC_AT_LEAST_4_9
> +	depends on !BR2_STATIC_LIBS # wayland
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> +	select BR2_PACKAGE_WAYLAND

I've use a "depends on BR2_PACKAGE_WAYLAND" instead, because it's
obvious if you want Wayland C++ bindings that you need to enable
wayland first. Thanks to this I've dropped the thread and !static
dependencies.

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
