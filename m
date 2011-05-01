From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 1 May 2011 18:45:57 +0200
Subject: [Buildroot] [PATCH 2/2] package: add openocd support
In-Reply-To: <87r58iv1d1.fsf@macbook.be.48ers.dk>
References: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
	<1304170969-30138-2-git-send-email-plagnioj@jcrosoft.com>
	<87r58iv1d1.fsf@macbook.be.48ers.dk>
Message-ID: <20110501164557.GF1212@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18:20 Sun 01 May     , Peter Korsgaard wrote:
> >>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> 
>  Jean-Christophe> with only usb option that depend only on libusb for now on
>  Jean-Christophe> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>  Jean-Christophe> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
>  Jean-Christophe> Cc: Patrice Vilchez <patrice.vilchez@atmel.com>
>  Jean-Christophe> ---
>  Jean-Christophe>  package/Config.in          |    1 +
>  Jean-Christophe>  package/openocd/Config.in  |   85 ++++++++++++++++++++++++++++++++++++++++++++
>  Jean-Christophe>  package/openocd/openocd.mk |   50 ++++++++++++++++++++++++++
>  Jean-Christophe>  3 files changed, 136 insertions(+), 0 deletions(-)
>  Jean-Christophe>  create mode 100644 package/openocd/Config.in
>  Jean-Christophe>  create mode 100644 package/openocd/openocd.mk
> 
>  Jean-Christophe> diff --git a/package/Config.in b/package/Config.in
>  Jean-Christophe> index cd89892..4f24595 100644
>  Jean-Christophe> --- a/package/Config.in
>  Jean-Christophe> +++ b/package/Config.in
>  Jean-Christophe> @@ -362,6 +362,7 @@ endmenu
>  
>  Jean-Christophe>  menu "Miscellaneous"
>  Jean-Christophe>  source "package/shared-mime-info/Config.in"
>  Jean-Christophe> +source "package/openocd/Config.in"
> 
> I would think 'hardware handling' would be a better location. Don't
> forget sort alphabetically.
> 
>  Jean-Christophe>  menu "Networking applications"
>  Jean-Christophe> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
>  Jean-Christophe> new file mode 100644
>  Jean-Christophe> index 0000000..3efa3e7
>  Jean-Christophe> --- /dev/null
>  Jean-Christophe> +++ b/package/openocd/Config.in
>  Jean-Christophe> @@ -0,0 +1,85 @@
>  Jean-Christophe> +menuconfig BR2_PACKAGE_OPENOCD
>  Jean-Christophe> +	bool "OpenOCD"
>  Jean-Christophe> +	select BR2_PACKAGE_LIBUSB
>  Jean-Christophe> +	select BR2_PACKAGE_LIBUSB_COMPAT
>  Jean-Christophe> +	select BR2_PACKAGE_JIMTCL
>  Jean-Christophe> +	help
>  Jean-Christophe> +	  OpenOCD - Open On-Chip Debugger
>  Jean-Christophe> +
>  Jean-Christophe> +	  http://openocd.berlios.de/web/
>  Jean-Christophe> +
>  Jean-Christophe> +if BR2_PACKAGE_OPENOCD
>  Jean-Christophe> +
>  Jean-Christophe> +choice
>  Jean-Christophe> +	prompt "OPENOCD Git"
>  Jean-Christophe> +	default BR2_TARGET_OPENOCD_GIT
>  Jean-Christophe> +	help
>  Jean-Christophe> +	  Select the specific OpenOCD Git you want to use
> 
> Again, do we really need the version / git location options?
as explain on jimtcl,
I do use it every day due to network issue and help for development
So I wish to keep it
> 
>  Jean-Christophe> +config BR2_PACKAGE_OPENOCD_ETM
>  Jean-Christophe> +	bool "OpenOCD+trace ETM capture hardware"
>  Jean-Christophe> +	help
>  Jean-Christophe> +	  OpenOCD+trace ETM capture hardware for some prototype
> 
> That help text could use some work I think.
Copy paste from ./configure
> 
> -- 
> Bye, Peter Korsgaard
