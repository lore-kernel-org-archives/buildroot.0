From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 21:55:07 +0100
Subject: [Buildroot] [PATCH 06/14] libmodplug: new package
In-Reply-To: <1389549208-19078-7-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 12 Jan 2014 18:53:20 +0100")
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389549208-19078-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <878uuht178.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > MOD music file decoder.
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  package/Config.in                |  1 +
 >  package/libmodplug/Config.in     | 10 ++++++++++
 >  package/libmodplug/libmodplug.mk | 12 ++++++++++++
 >  3 files changed, 23 insertions(+)
 >  create mode 100644 package/libmodplug/Config.in
 >  create mode 100644 package/libmodplug/libmodplug.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index d50c5ec..836dc7e 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -452,6 +452,7 @@ source "package/libcuefile/Config.in"
 >  source "package/libid3tag/Config.in"
 >  source "package/liblo/Config.in"
 >  source "package/libmad/Config.in"
 > +source "package/libmodplug/Config.in"
 >  source "package/libmpd/Config.in"
 >  source "package/libreplaygain/Config.in"
 >  source "package/libsamplerate/Config.in"
 > diff --git a/package/libmodplug/Config.in b/package/libmodplug/Config.in
 > new file mode 100644
 > index 0000000..976a08b
 > --- /dev/null
 > +++ b/package/libmodplug/Config.in
 > @@ -0,0 +1,10 @@
 > +config BR2_PACKAGE_LIBMODPLUG
 > +	bool "libmodplug"
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	help
 > +	  MOD music file decoder
 > +
 > +	  http://modplug-xmms.sourceforge.net/
 > +
 > +comment "libmodplug requires C++ support in toolchain"
 > +	depends on !BR2_INSTALL_LIBSTDCPP

We've standardized on '<foo> needs a toolchain w/ C++' now.

 > diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
 > new file mode 100644
 > index 0000000..14df808
 > --- /dev/null
 > +++ b/package/libmodplug/libmodplug.mk
 > @@ -0,0 +1,12 @@
 > +#############################################################

80 char #'s.

 > +#
 > +# libmodplug
 > +#
 > +#############################################################
 > +
 > +LIBMODPLUG_VERSION = 0.8.7
 > +LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
 > +LIBMODPLUG_INSTALL_STAGING = YES
 > +LIBMODPLUG_LICENSE = Public Domain

You forgot _LICENSE_FILES.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
