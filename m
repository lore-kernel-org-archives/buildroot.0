From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 19:11:31 +0100
Subject: [Buildroot] [git commit] Added package HPLIP for printing to HP
 printers
In-Reply-To: <20130319121031.EF25A9B19C@busybox.osuosl.org>
References: <20130319121031.EF25A9B19C@busybox.osuosl.org>
Message-ID: <20130320191131.2fb8a9f5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 19 Mar 2013 13:07:39 +0100, Peter Korsgaard wrote:

> diff --git a/package/Config.in b/package/Config.in
> index fec5020..e12228f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -640,6 +640,7 @@ source "package/connman/Config.in"
>  source "package/ctorrent/Config.in"
>  source "package/conntrack-tools/Config.in"
>  source "package/cups/Config.in"
> +source "package/hplip/Config.in"

This breaks the rule of sorting alphabetically the packages. I know it
has been made to avoid the submenu related to Printing stuff... but
since Olivier is contributing more printing-related packages, maybe the
submenu was a better option?

> diff --git a/package/hplip/Config.in b/package/hplip/Config.in
> new file mode 100644
> index 0000000..5bcd63b
> --- /dev/null
> +++ b/package/hplip/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_HPLIP
> +	bool "hplip"
> +	depends on BR2_PACKAGE_CUPS
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_JPEG

Missing 'depends on BR2_INSTALL_LIBSTDCPP' ...

> +	help
> +	  HP Linux Imaging and Printing (HPLIP)
> +	  HPLIP is an HP-developed solution for printing, scanning, and faxing
> +	  with HP inkjet and laser based printers in Linux. The HPLIP project
> +	  provides printing support for 2,211 printer models, including
> +	  Deskjet, Officejet, Photosmart, PSC (Print Scan Copy), Business
> +	  Inkjet, LaserJet, Edgeline MFP, and LaserJet MFP.
> +
> +	  http://hplipopensource.com/
> +
> +comment "hplip requires a toolchain with C++ support enabled"
> +	depends on !BR2_INSTALL_LIBSTDCPP

... since we're doing the opposite check here :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
