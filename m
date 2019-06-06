From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Jun 2019 00:06:30 +0200
Subject: [Buildroot] [PATCH 2/3] package/gdb: switch to 8.2 as the
 default version
In-Reply-To: <20190605124016.13770-2-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 5 Jun 2019 14:40:15 +0200")
References: <20190605124016.13770-1-romain.naour@gmail.com>
 <20190605124016.13770-2-romain.naour@gmail.com>
Message-ID: <87r286cqs9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > 8.3 is around, 8.2 has already seen a point release, so it's time to
 > make 8.2 the default version for gdb.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 >  package/gdb/Config.in.host | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
 > index f9a67d18dd..a395016082 100644
 > --- a/package/gdb/Config.in.host
 > +++ b/package/gdb/Config.in.host
 > @@ -46,7 +46,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 >  choice
 >  	prompt "GDB debugger Version"
 > -	default BR2_GDB_VERSION_8_1
 > +	default BR2_GDB_VERSION_8_2
 >  	depends on !BR2_arc
 >  	depends on !BR2_csky
 >  	help

You forgot to also update the BR2_GDB_VERSION logic. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
