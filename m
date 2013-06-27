From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 21:33:19 +0200
Subject: [Buildroot] [PATCH v2] package/libdvbsi: new package
In-Reply-To: <1372001433-4328-1-git-send-email-c.schoenert@gmail.com> (Carsten
 Schoenert's message of "Sun, 23 Jun 2013 17:30:33 +0200")
References: <1372001433-4328-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <87obar1h8g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> libdvbsi++ is a C++ library for parsing DVB SI sections and providing
 Carsten> the output in C++ objects. It's usefull in any case you need prepared
 Carsten> and preselected DVB SI data from the raw stream.

 Carsten> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> ---
 Carsten> Changes in v2:
 Carsten> 	- reworking 'Config.in' after suggestions from Thomas Petazzoni
 Carsten> 	- fixed LIBDVBSI_SITE for correct download URL mentioned by Yann Morin

 Carsten>  package/Config.in            |    1 +
 Carsten>  package/libdvbsi/Config.in   |   14 ++++++++++++++
 Carsten>  package/libdvbsi/libdvbsi.mk |   17 +++++++++++++++++
 Carsten>  3 files changed, 32 insertions(+)
 Carsten>  create mode 100644 package/libdvbsi/Config.in
 Carsten>  create mode 100644 package/libdvbsi/libdvbsi.mk

 Carsten> diff --git a/package/Config.in b/package/Config.in
 Carsten> index 0eb6a9c..dfc4584 100644
 Carsten> --- a/package/Config.in
 Carsten> +++ b/package/Config.in
 Carsten> @@ -513,6 +513,7 @@ source "package/json-javascript/Config.in"
 Carsten>  endmenu
 
 Carsten>  menu "Multimedia"
 Carsten> +source "package/libdvbsi/Config.in"
 Carsten>  source "package/libdvdread/Config.in"
 Carsten>  source "package/libdvdnav/Config.in"
 Carsten>  source "package/libebml/Config.in"
 Carsten> diff --git a/package/libdvbsi/Config.in b/package/libdvbsi/Config.in
 Carsten> new file mode 100644
 Carsten> index 0000000..7e7d433
 Carsten> --- /dev/null
 Carsten> +++ b/package/libdvbsi/Config.in
 Carsten> @@ -0,0 +1,14 @@
 Carsten> +config BR2_PACKAGE_LIBDVBSI
 Carsten> +	bool "libdvbsi"
 Carsten> +	depends on BR2_INSTALL_LIBSTDCPP
 Carsten> +	depends on BR2_USE_WCHAR
 Carsten> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Carsten> +	help
 Carsten> +	  C++ parsing library for Service Information (SI) in DVB systems.
 Carsten> +	  With libdvbsi++ you can convert raw DVB service information to
 Carsten> +	  a set of C++ objects, removing the need to parse data manually.
 Carsten> +
 Carsten> +	  http://www.saftware.de/
 Carsten> +
 Carsten> +comment "libdvbsi++ requires a toolchain with C++, WCHAR and threads support"
 Carsten> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 Carsten> diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
 Carsten> new file mode 100644
 Carsten> index 0000000..ee22c21
 Carsten> --- /dev/null
 Carsten> +++ b/package/libdvbsi/libdvbsi.mk
 Carsten> @@ -0,0 +1,17 @@
 Carsten> +################################################################################
 Carsten> +#
 Carsten> +# libdvbsi++
 Carsten> +#
 Carsten> +################################################################################
 Carsten> +
 Carsten> +LIBDVBSI_VERSION = 0.3.6
 Carsten> +LIBDVBSI_SOURCE = libdvbsi++-$(LIBDVBSI_VERSION).tar.bz2
 Carsten> +LIBDVBSI_SITE = http://www.saftware.de/libdvbsi++
 Carsten> +LIBDVBSI_INSTALL_STAGING = YES
 Carsten> +LIBDVBSI_LICENSE = LGPLv2.1
 Carsten> +LIBDVBSI_LICENSE_FILE = COPYING

The variable must be called <pkg>_LICENSE_FILES. Other than that it
looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
