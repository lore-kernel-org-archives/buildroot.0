From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 10:47:04 +0100
Subject: [Buildroot] [PATCHv3] Added package HPLIP for printing to HP
 printers
In-Reply-To: <1363203368-19909-1-git-send-email-olivier.schonken@gmail.com>
References: <20130304084108.GB10626@sapphire.tkos.co.il>
 <1363203368-19909-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130315104704.1c268db3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Wed, 13 Mar 2013 21:36:08 +0200, Olivier Schonken wrote:
> HPLIP (Hewlett-Packard Linux Imaging & Printing) is an HP-developed solution
> for printing, scanning, and faxing with HP inkjet and laser based printers
> in Linux.
> 
> The --includedir=$(STAGING_DIR)/usr/include is unfortunately necessary even
> with the modified Makefile.am for a succesful build.
> 
> Created a menu for cups related components to be kept close together.
> 
> Fixed a jpeg and dbus dependencies, Thanks for pointing out the dbus 
> dependency Baruch.

The "changelog" shouldn't go in the commit log, but instead...

> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---

... here. Otherwise, it gets committed and kept in the project history,
which doesn't make much sense.

> new file mode 100644
> index 0000000..1bfac40
> --- /dev/null
> +++ b/package/hplip/hplip.mk
> @@ -0,0 +1,52 @@
> +#############################################################
> +#
> +# hplip
> +#
> +#############################################################
> +
> +HPLIP_VERSION = 3.12.11
> +HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip/
> +HPLIP_AUTORECONF = YES
> +HPLIP_DEPENDENCIES = cups libusb jpeg

You should add HPLIP_LICENSE and HPLIP_LICENSE_FILES here.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
