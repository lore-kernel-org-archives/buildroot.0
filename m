From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 00:09:08 +0200
Subject: [Buildroot] [PATCH] package/uhd: new package
In-Reply-To: <20200824120246.23111-1-gwenj@trabucayre.com>
References: <20200824120246.23111-1-gwenj@trabucayre.com>
Message-ID: <20200829000908.0eee915b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 14:02:46 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Thanks, I've applied to next. Two nits below.

> +config BR2_PACKAGE_UHD
> +	bool "uhd"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_USE_MMU # use fork()
> +	depends on BR2_USE_WCHAR # boost
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_CHRONO
> +	select BR2_PACKAGE_BOOST_DATE_TIME
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	select BR2_PACKAGE_BOOST_REGEX
> +	select BR2_PACKAGE_BOOST_SERIALIZATION
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_THREAD
> +	select BR2_PACKAGE_BOOST_ATOMIC

Alphabetic ordering was not perfect here :-)

> +UHD_LICENSE_FILES = LICENSE.md output/LICENSE

output/LICENSE does not exist, it is host/LICENSE

I fixed those small nits when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
