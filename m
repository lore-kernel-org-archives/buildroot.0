From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 Dec 2014 12:39:53 +0100
Subject: [Buildroot] [PATCH] lighttpd: disable static build
In-Reply-To: <fc38f617245821399908d9f8f0a64a8fcdf3b164.1418124326.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 9 Dec 2014 13:25:26 +0200")
References: <fc38f617245821399908d9f8f0a64a8fcdf3b164.1418124326.git.baruch@tkos.co.il>
Message-ID: <874mt5t5km.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > lighttpd modules support code requires shared libraries support.
 > The scons based build system seems to be support static link of modules, but
 > we currently don't use scons for lighttpd.

 > Fixes:
 > http://autobuild.buildroot.net/results/39c/39c027bf6b76a0f9c15a184f449dadacfaefe980/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

> ---
 >  package/lighttpd/Config.in | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
 > index a5abf7ea0850..f0e1c7f22f99 100644
 > --- a/package/lighttpd/Config.in
 > +++ b/package/lighttpd/Config.in
 > @@ -1,6 +1,7 @@
 >  config BR2_PACKAGE_LIGHTTPD
 >  	bool "lighttpd"
 >  	depends on BR2_USE_MMU # fork()
 > +	depends on !BR2_PREFER_STATIC_LIB
 >  	help
 >  	  lighttpd a secure, fast, compliant and very flexible web-server
 >  	  which has been optimized for high-performance environments. It
 > @@ -12,6 +13,10 @@ config BR2_PACKAGE_LIGHTTPD
 
 >  	  http://www.lighttpd.net/
 
 > +comment "lighttpd needs a toolchain w/ dynamic library"
 > +	depends on BR2_USE_MMU
 > +	depends on BR2_PREFER_STATIC_LIB
 > +
 >  if BR2_PACKAGE_LIGHTTPD
 >
 >  config BR2_PACKAGE_LIGHTTPD_OPENSSL

With the comment here the suboptions will no longer get correctly
indented. I've moved it to the top of the file and committed, thanks.

-- 
Bye, Peter Korsgaard
