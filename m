From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 00:19:40 +0200
Subject: [Buildroot] [PATCH 2/3] systemd-bootchart: New package
In-Reply-To: <1467409950-9628-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409950-9628-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467409950-9628-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702001940.229d423f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 23:52:29 +0200, Maxime Hadjinlian wrote:

> +config BR2_PACKAGE_SYSTEMD_BOOTCHART
> +	bool "systemd-bootchart"
> +	depends on BR2_INIT_SYSTEMD
> +	depends on BR2_USE_WCHAR # util-linux
> +	depends on !BR2_STATIC_LIBS # kmod
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> +	depends on BR2_USE_MMU # dbus

You have lots of "depends on" that refer to util-linux/kmod/dbus, but
you don't select any of those packages. This looks suspicious.

> diff --git a/package/systemd-bootchart/system-bootchart.hash b/package/systemd-bootchart/system-bootchart.hash
> new file mode 100644
> index 0000000..d411ae7
> --- /dev/null
> +++ b/package/systemd-bootchart/system-bootchart.hash
> @@ -0,0 +1,3 @@
> +# sha256 locally computed
> +sha256 8cfea4f604c00289394a4429f934e19f80dceafbe0ae1846e00997f70d81a20f systemd-bootchart-230.tar.xz
> +

Unnecessary empty line.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
