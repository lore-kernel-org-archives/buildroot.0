From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Dec 2013 11:50:40 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20131223095040.GE11794@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Mon, Dec 23, 2013 at 10:37:24AM +0100, Alexandre Belloni wrote:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

[...]

> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> new file mode 100644
> index 000000000000..f0a71125e2ad
> --- /dev/null
> +++ b/package/bluez5_utils/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_BLUEZ5_UTILS
> +	bool "bluez5-utils"
> +	depends on !BR2_avr32
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2

Why alsa-lib?

baruch

> +	depends on BR2_USE_MMU # dbus, libglib2
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  bluez utils
> +
> +	  http://www.kernel.org/pub/linux/bluetooth
> +
> +comment "bluez5-utils needs a toolchain w/ wchar, threads"
> +	depends on !BR2_avr32 && BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
