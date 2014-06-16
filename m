From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2014 09:49:21 +0200
Subject: [Buildroot] [git commit] toolchain-external: add CodeSourcery
	PowerPC 2012.03
In-Reply-To: <20140614170507.DAC829CFE5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 14 Jun 2014 19:04:50 +0200")
References: <20140614170507.DAC829CFE5@busybox.osuosl.org>
Message-ID: <87zjhdb8fy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=20d4ba91c5ed42b07c1e82b2095c0cc312deb0c7
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > However, this toolchain is only usable for e500v2 with the SPE ABI.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
 > ---
 >  toolchain/toolchain-external/Config.in             |   19 +++++++++++++++++++
 >  toolchain/toolchain-external/toolchain-external.mk |    3 +++
 >  2 files changed, 22 insertions(+), 0 deletions(-)

 > diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
 > index 6f3c75e..d369f9c 100644
 > --- a/toolchain/toolchain-external/Config.in
 > +++ b/toolchain/toolchain-external/Config.in
 > @@ -416,6 +416,24 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 >  	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
 >  	  glibc 2.17, gdb 7.4.50 and kernel headers 3.7.0.
 
 > +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
 > +	bool "Sourcery CodeBench PowerPC 2012.03"
 > +	depends on BR2_powerpc
 > +	depends on BR2_powerpc_SPE
 > +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 > +	depends on !BR2_PREFER_STATIC_LIB
 > +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 > +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 > +	select BR2_INSTALL_LIBSTDCPP
 > +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 > +	help
 > +	  Sourcery CodeBench toolchain for the PowerPC architecture,
 > +	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
 > +	  glibc 2.15, gdb 7.2.50 and kernel headers 3.2.10. It has
 > +	  support for the following variants:
 > +	    - e500v2 glibc, SPE, 32 bits

Should it then not depend on BR2_powerpc_8548?

-- 
Bye, Peter Korsgaard
