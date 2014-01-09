From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 13:36:43 +0100
Subject: [Buildroot] [PATCH] rt-tests: disable for architectures not
	supporting NPTL
In-Reply-To: <2a175498f9ed0528e619f3a0124836eb72729bc3.1389256828.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 9 Jan 2014 10:40:28 +0200")
References: <2a175498f9ed0528e619f3a0124836eb72729bc3.1389256828.git.baruch@tkos.co.il>
Message-ID: <87ppo1e3hg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/8aa/8aaa4b56a53241b7342fede568fbc72a7656cc38/.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/rt-tests/Config.in | 7 +++----
 >  1 file changed, 3 insertions(+), 4 deletions(-)

 > diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
 > index 36c111b..f467ee2 100644
 > --- a/package/rt-tests/Config.in
 > +++ b/package/rt-tests/Config.in
 > @@ -1,9 +1,8 @@
 >  config BR2_PACKAGE_RT_TESTS
 >  	bool "rt-tests"
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 > -	# Too old uClibc, does not provide priority-inheritance
 > -	# mutexes
 > -	depends on !BR2_avr32
 > +	# uClibc does not provide priority-inheritance mutex (NPTL)
 > +	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc

So shouldn't we depend on !BR2_PTHREADS && !BR2_PTHREADS_OLD instead? What
happens if you configure uClibc on E.G. ARM to use pthreads-old?

-- 
Bye, Peter Korsgaard
