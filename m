From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 16:20:53 +0200
Subject: [Buildroot] [PATCH 1/2] pcsc-lite: new package
In-Reply-To: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <20120918162053.1155b90f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Rymarkiewicz,

On Tue, 18 Sep 2012 14:15:37 +0200, Waldemar Rymarkiewicz wrote:
> Middleware to access a smart card using SCard API (PC/SC).
> 
> http://pcsclite.alioth.debian.org/
> 
> Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
> ---
>  package/Config.in              |    1 +
>  package/pcsc-lite/Config.in    |    6 ++++++
>  package/pcsc-lite/pcsc-lite.mk |   13 +++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/pcsc-lite/Config.in
>  create mode 100644 package/pcsc-lite/pcsc-lite.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a4e0b2c..dcc84b6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -395,6 +395,7 @@ source "package/libusb/Config.in"
>  source "package/libusb-compat/Config.in"
>  source "package/libv4l/Config.in"
>  source "package/mtdev/Config.in"
> +source "package/pcsc-lite/Config.in"
>  endmenu
>  
>  menu "Javascript"
> diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
> new file mode 100644
> index 0000000..7c26427
> --- /dev/null
> +++ b/package/pcsc-lite/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PCSC_LITE
> +	bool "pcsc-lite"

Since you depend on libusb, you must add:

	select BR2_PACKAGE_LIBUSB
	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb

> +	help
> +	  Middleware to accesss smart card using SCard API (PC/SC).
> +
> +	  http://pcsclite.alioth.debian.org/

And here:

comment "pcsc-lite needs a toolchain with thread support"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
