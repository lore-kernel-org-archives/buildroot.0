From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 12:30:15 +0200
Subject: [Buildroot] [PATCH 1/3] libminiupnpc: New package
In-Reply-To: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 3 Jul 2016 00:18:11 +0200")
References: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87h9c7ypxk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/Config.in                      |  1 +
 >  package/libminiupnpc/Config.in         | 20 ++++++++++++++++++++
 >  package/libminiupnpc/libminiupnpc.hash |  2 ++
 >  package/libminiupnpc/libminiupnpc.mk   | 14 ++++++++++++++
 >  4 files changed, 37 insertions(+)
 >  create mode 100644 package/libminiupnpc/Config.in
 >  create mode 100644 package/libminiupnpc/libminiupnpc.hash
 >  create mode 100644 package/libminiupnpc/libminiupnpc.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index d55fa69..cfa26ee 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1179,6 +1179,7 @@ menu "Networking"
 >  	source "package/libmbus/Config.in"
 >  	source "package/libmemcached/Config.in"
 >  	source "package/libmicrohttpd/Config.in"
 > +	source "package/libminiupnpc/Config.in"
 >  	source "package/libmnl/Config.in"
 >  	source "package/libmodbus/Config.in"
 >  	source "package/libndp/Config.in"
 > diff --git a/package/libminiupnpc/Config.in b/package/libminiupnpc/Config.in
 > new file mode 100644
 > index 0000000..9c6459c
 > --- /dev/null
 > +++ b/package/libminiupnpc/Config.in
 > @@ -0,0 +1,20 @@
 > +config BR2_PACKAGE_LIBMINIUPNPC
 > +	bool "libminiupnpc"
 > +	depends on !BR2_BINFMT_FLAT
 > +	depends on !BR2_STATIC_LIBS
 > +	help
 > +	  The UPnP protocol is supported by most home adsl/cable routers
 > +	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project is
 > +	  to bring a free software solution to support the "Internet
 > +	  Gateway Device" part of the protocol.
 > +
 > +	  Miniupnpc aims at the simplest library possible, with the
 > +	  smallest footprint and no dependencies to other libraries such
 > +	  as XML parsers or HTTP implementations. All the code is pure
 > +	  ANSI C.
 > +
 > +	  http://miniupnp.free.fr
 > +
 > +comment "libminiupnpc needs a toolchain dynamic library"

w/ missing.

Committed, thanks.

-- 
Bye, Peter Korsgaard
