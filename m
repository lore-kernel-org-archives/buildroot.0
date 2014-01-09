From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 14:15:27 +0100
Subject: [Buildroot] [PATCH] rt-tests: disable for architectures not
	supporting NPTL
In-Reply-To: <20140109130845.GV4659@sapphire.tkos.co.il> (Baruch Siach's
 message of "Thu, 9 Jan 2014 15:08:45 +0200")
References: <2a175498f9ed0528e619f3a0124836eb72729bc3.1389256828.git.baruch@tkos.co.il>
 <87ppo1e3hg.fsf@dell.be.48ers.dk>
 <20140109130845.GV4659@sapphire.tkos.co.il>
Message-ID: <87ha9de1ow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> So shouldn't we depend on !BR2_PTHREADS && !BR2_PTHREADS_OLD instead? What
 >> happens if you configure uClibc on E.G. ARM to use pthreads-old?

 > We could, but this doesn't solve the problem for external toolchains. This 
 > issue of packages that require NPTL keeps coming up, but no solution has been 
 > implemented yet.

 > This patch takes the minimal approach of disabling rt-tests for arches that 
 > are known not to have NPTL support at all.

Ok, then I think the nicest approach would be to depend on
!linuxthreads/old (for internal toolchains) and the explicit list of
archs where we know glibc/nptl aren't available (for external
toolchains).

If any of the archs we have blacklisted for nptl
(arc/avr32/bfin/extensa/x86_i386) support glibc (with the needed
functionality), then we could combine the arch list with
BR2_TOOLCHAIN_EXTERNAL_UCLIBC.

-- 
Bye, Peter Korsgaard
