From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Mar 2013 13:08:24 +0100
Subject: [Buildroot] [PATCHv5] Added package HPLIP for printing to HP
	printers
In-Reply-To: <1363676117-5103-1-git-send-email-olivier.schonken@gmail.com>
 (Olivier Schonken's message of "Tue, 19 Mar 2013 08:55:16 +0200")
References: <1362243769-8714-1-git-send-email-olivier.schonken@gmail.com>
 <1363676117-5103-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <87ehfbwq13.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 Olivier> HPLIP (Hewlett-Packard Linux Imaging & Printing) is an HP-developed solution
 Olivier> for printing, scanning, and faxing with HP inkjet and laser based printers
 Olivier> in Linux.

 Olivier> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 Olivier> ---
 Olivier> Changelog:
 Olivier> The --includedir=$(STAGING_DIR)/usr/include is unfortunately necessary even
 Olivier> with the modified Makefile.am for a succesful build.
 Olivier> Fixed a jpeg and dbus dependencies, Thanks for pointing out the dbus
 Olivier> dependency Baruch.
 Olivier> Added Licensing information
 Olivier> Updated version to most recent 3.13.3
 Olivier> Fixed download site link (Trailing slash was breaking it)
 Olivier> Removed trailing whitespaces
 Olivier> Added check for C++ enabled compiler in Config.in
 Olivier> Updated hplip-fix-make.patch for newer version
 Olivier>  package/Config.in                  |    1 +
 Olivier>  package/hplip/Config.in            |   17 +++++++++
 Olivier>  package/hplip/hplip-fix-make.patch |   74 ++++++++++++++++++++++++++++++++++++
 Olivier>  package/hplip/hplip.mk             |   53 ++++++++++++++++++++++++++
 Olivier>  4 files changed, 145 insertions(+)
 Olivier>  create mode 100644 package/hplip/Config.in
 Olivier>  create mode 100644 package/hplip/hplip-fix-make.patch
 Olivier>  create mode 100644 package/hplip/hplip.mk

 Olivier> diff --git a/package/Config.in b/package/Config.in
 Olivier> index a65054c..24caba0 100644
 Olivier> --- a/package/Config.in
 Olivier> +++ b/package/Config.in
 Olivier> @@ -632,6 +632,7 @@ source "package/connman/Config.in"
 Olivier>  source "package/ctorrent/Config.in"
 Olivier>  source "package/conntrack-tools/Config.in"
 Olivier>  source "package/cups/Config.in"
 Olivier> +source "package/hplip/Config.in"
 Olivier>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Olivier>  source "package/dhcp/Config.in"
 Olivier>  endif
 Olivier> diff --git a/package/hplip/Config.in b/package/hplip/Config.in
 Olivier> new file mode 100644
 Olivier> index 0000000..551e9c4
 Olivier> --- /dev/null
 Olivier> +++ b/package/hplip/Config.in
 Olivier> @@ -0,0 +1,17 @@
 Olivier> +config BR2_PACKAGE_HPLIP
 Olivier> +	bool "hplip"
 Olivier> +	depends on BR2_PACKAGE_CUPS
 Olivier> +	select BR2_PACKAGE_LIBUSB
 Olivier> +	select BR2_PACKAGE_JPEG
 Olivier> +	help
 Olivier> +	  HP Linux Imaging and Printing (HPLIP)
 Olivier> +	  HPLIP is an HP-developed solution for printing, scanning, and faxing
 Olivier> +	  with HP inkjet and laser based printers in Linux. The HPLIP project
 Olivier> +	  provides printing support for 2,211 printer models, including
 Olivier> +	  Deskjet, Officejet, Photosmart, PSC (Print Scan Copy), Business
 Olivier> +	  Inkjet, LaserJet, Edgeline MFP, and LaserJet MFP.
 Olivier> +  

You have some trailing spaces here.

Committed with that fixed, thanks!

-- 
Bye, Peter Korsgaard
