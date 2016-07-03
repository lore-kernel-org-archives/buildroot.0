From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 19:08:35 +0200
Subject: [Buildroot] [PATCH 2/3] libnatpmp: New package
In-Reply-To: <1467497893-16126-2-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 3 Jul 2016 00:18:12 +0200")
References: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
 <1467497893-16126-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <874m86r6ng.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/Config.in                |  1 +
 >  package/libnatpmp/Config.in      | 16 ++++++++++++++++
 >  package/libnatpmp/libnatpmp.hash |  2 ++
 >  package/libnatpmp/libnatpmp.mk   | 31 +++++++++++++++++++++++++++++++
 >  4 files changed, 50 insertions(+)
 >  create mode 100644 package/libnatpmp/Config.in
 >  create mode 100644 package/libnatpmp/libnatpmp.hash
 >  create mode 100644 package/libnatpmp/libnatpmp.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index cfa26ee..9b062c4 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1182,6 +1182,7 @@ menu "Networking"
 >  	source "package/libminiupnpc/Config.in"
 >  	source "package/libmnl/Config.in"
 >  	source "package/libmodbus/Config.in"
 > +	source "package/libnatpmp/Config.in"
 >  	source "package/libndp/Config.in"
 >  	source "package/libnet/Config.in"
 >  	source "package/libnetfilter_acct/Config.in"
 > diff --git a/package/libnatpmp/Config.in b/package/libnatpmp/Config.in
 > new file mode 100644
 > index 0000000..9de0b74
 > --- /dev/null
 > +++ b/package/libnatpmp/Config.in
 > @@ -0,0 +1,16 @@
 > +config BR2_PACKAGE_LIBNATPMP
 > +	bool "libnatpmp"
 > +	depends on !BR2_BINFMT_FLAT
 > +	depends on !BR2_STATIC_LIBS
 > +	help
 > +	  libnatpmp is an attempt to make a portable and fully compliant
 > +	  implementation of the NAT-PMP protocol for the client side. It
 > +	  is based on non blocking sockets and all calls of the API are
 > +	  asynchronous. It is therefore very easy to integrate the
 > +	  NAT-PMP code to any event driven code.
 > +
 > +	  http://miniupnp.free.fr/libnatpmp.html
 > +
 > +comment "libnatpmp needs a toolchain dynamic library"

Again missing a w/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
