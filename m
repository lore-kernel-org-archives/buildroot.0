From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 21:54:51 +0100
Subject: [Buildroot] [PATCH 1/1] exempi: fix libiconv dependency
In-Reply-To: <20190116214618.7467-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Jan 2019 22:46:18 +0100")
References: <20190116214618.7467-1-fontaine.fabrice@gmail.com>
Message-ID: <87munvxd5w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a77a891683ae9a135dc31be1b419061922d0e1ba

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/exempi/Config.in | 1 +
 >  package/exempi/exempi.mk | 3 ++-
 >  2 files changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/exempi/Config.in b/package/exempi/Config.in
 > index ed71e0fb12..c9af219a20 100644
 > --- a/package/exempi/Config.in
 > +++ b/package/exempi/Config.in
 > @@ -4,6 +4,7 @@ config BR2_PACKAGE_EXEMPI
 >  	depends on BR2_INSTALL_LIBSTDCPP
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	select BR2_PACKAGE_EXPAT
 > +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 >  	select BR2_PACKAGE_ZLIB
 >  	help
 >  	  Exempi is an implementation of XMP (Extensible Metadata
 > diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
 > index e7b297ffe1..600ac3a1f2 100644
 > --- a/package/exempi/exempi.mk
 > +++ b/package/exempi/exempi.mk
 > @@ -9,7 +9,8 @@ EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
 >  EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 >  EXEMPI_INSTALL_STAGING = YES
 >  EXEMPI_CONF_OPTS = --disable-unittest
 > -EXEMPI_DEPENDENCIES = host-pkgconf expat zlib
 > +EXEMPI_DEPENDENCIES = host-pkgconf expat zlib \
 > +	$(if $(BR2_PACKAGE_LIBICONV), libiconv)

Committed after removing the extra space before libiconv, thanks.

-- 
Bye, Peter Korsgaard
