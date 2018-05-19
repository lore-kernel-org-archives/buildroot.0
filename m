From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 14:29:14 +0200
Subject: [Buildroot] [PATCH] imx_usb_loader: Allow target build
In-Reply-To: <1526462165-1544-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1526462165-1544-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <20180519142914.22ffe1b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 May 2018 11:16:05 +0200, Vincent Prince wrote:
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>

Could you give some details on the use case for having a target package
for the imx_usb_loader ? Are you building a system with Buildroot that
itself is responsible for loading a bootloader over USB to a separate
i.MX6 target ? If not, what is your use case ?

> diff --git a/package/imx-usb-loader/Config.in b/package/imx-usb-loader/Config.in
> new file mode 100644
> index 0000000..41585e2
> --- /dev/null
> +++ b/package/imx-usb-loader/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_IMX_USB_LOADER
> +	bool "imx-usb-loader"
> +	depends on BR2_arm

Why do you have this dependency ? If your use case is as explained
above to build a Buildroot system that itself will be responsible for
loading over USB the bootloader of a separate i.MX6 device, then this
system may be running on something else than an ARM platform.

> +    select BR2_PACKAGE_LIBUSB

Indentation is wrong for this line, it should be indented with one tab.
I can fix this up when applying once the use case is clearer.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
