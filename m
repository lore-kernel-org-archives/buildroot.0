From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 21:19:22 +0200
Subject: [Buildroot] [PATCH v3 3/5] package/gdb: switch to 8.0 as the
 default version
In-Reply-To: <20180624135310.16514-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 24 Jun 2018 15:53:08 +0200")
References: <20180624135310.16514-1-thomas.petazzoni@bootlin.com>
 <20180624135310.16514-4-thomas.petazzoni@bootlin.com>
Message-ID: <871scwf0w5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From: Romain Naour <romain.naour@gmail.com>
 > 8.1 is around, 8.0 has already seen a point release, so it's time to
 > make 8.0 the default version for gdb.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  package/gdb/Config.in.host | 15 +++++++++------
 >  1 file changed, 9 insertions(+), 6 deletions(-)

 > diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
 > index 333da6bad2..41016f6ccd 100644
 > --- a/package/gdb/Config.in.host
 > +++ b/package/gdb/Config.in.host
 > @@ -45,7 +45,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 >  choice
 >  	prompt "GDB debugger Version"
 > -	default BR2_GDB_VERSION_7_11
 > +	default BR2_GDB_VERSION_8_0
 >  	depends on !BR2_arc
 >  	help
 >  	  Select the version of gdb you wish to use.
 > @@ -75,14 +75,17 @@ endif
 
 >  # Tells whether the currently selected gdb version requires C++11
 >  # support in the toolchain. When host-gdb is not enabled, the target
 > -# gdb built is 7.11, which doesn't require C++11 support. So it's only
 > -# if host-gdb is built, with the version set to 8.0 or 8.1 that C++11
 > -# support is needed in the toolchain to build gdb for the target.
 > +# gdb built is 8.0, which requires C++11 support, which is why
 > +# BR2_PACKAGE_GDB_NEEDS_CXX11 is 'y' when BR2_PACKAGE_HOST_GDB is not
 > +# enabled. When host-gdb is built, with the version set to 8.0 or 8.1
 > +# that C++11 support is needed in the toolchain to build gdb for the

s/that/then/

Committed, thanks.

-- 
Bye, Peter Korsgaard
