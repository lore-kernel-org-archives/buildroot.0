From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Wed, 21 Oct 2009 16:31:19 +0200
Subject: [Buildroot] building toolchain fails - more details
In-Reply-To: <mailman.7.1256126402.21246.buildroot@busybox.net>
References: <mailman.7.1256126402.21246.buildroot@busybox.net>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67013CED64@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


Korsgaard> Sagaert> arm-linux-gcc   pointing to executable ccache   ???
Korsgaard>You have presumably enabled ccache support then.

Yes,correct... BUT please ... Read on.

............
 
 Sagaert>  [7m>>> autoconf 2.64 Configuring [27m

Korsgaard> This is autoconfig for the target - A pretty uncommon thing
to build.


I agree on that one, BUT : The autoconfig is not selected for the target
(Yes it is NOT enabled, double checked it !)

While looking to the the output/build directory it seems that it is  ->
autoconf-2.64-host.

Looking into the config.log into this directory gives me.

<< autoconf-2.64-host - config.log snip >>

  $ ./configure --prefix=/buildhome/20091021/buildroot/output/host/usr
--sysconfdir=/buildhome/20091021/buildroot/output/host/etc
--disable-static

## --------- ##
## Platform. ##
## --------- ##

hostname = bmslin10538
uname -m = i686
uname -r = 2.6.28-15-generic
uname -s = Linux
uname -v = #52-Ubuntu SMP Wed Sep 9 10:49:34 UTC 2009

/usr/bin/uname -p = unknown
/bin/uname -X     = unknown

/bin/arch              = unknown
/usr/bin/arch -k       = unknown
/usr/convex/getsysinfo = unknown
/usr/bin/hostinfo      = unknown
/bin/machine           = unknown
/usr/bin/oslevel       = unknown
/bin/universe          = unknown

PATH: /buildhome/20091021/buildroot/output/host/bin
PATH: /buildhome/20091021/buildroot/output/host/usr/bin
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games


## ----------- ##
## Core tests. ##
## ----------- ##

configure:1746: checking for a BSD-compatible install
configure:1814: result: /usr/bin/install -c
configure:1825: checking whether build environment is sane
configure:1875: result: yes
configure:2016: checking for a thread-safe mkdir -p
configure:2055: result: /bin/mkdir -p
configure:2068: checking for gawk
configure:2084: found /usr/bin/gawk
configure:2095: result: gawk
configure:2106: checking whether make sets $(MAKE)
configure:2128: result: yes
configure:2232: checking whether /bin/sh -n is known to work
configure:2251: result: no
configure:2255: checking for characters that cannot appear in file names
configure:2275: result: none
configure:2281: checking whether directories can have trailing spaces
configure:2295: result: yes
configure:2307: checking for expr
configure:2325: found /usr/bin/expr
configure:2337: result: /usr/bin/expr
configure:2356: checking for GNU M4 that supports accurate traces
configure:2391: error: no acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended


<< end config.log - snip >>




How to simulate?Just type 

A) 'make at91sam9g20dfc_defconfig' (press enter a couple of times....) {
but at91sam9260dfc_defconfig has same problem)
B) make menuconfig 
	-> kernel -> kernel binary format -> image format : zimage  (so
you can uncheck uboot)
      -> Target Filesystem options -> de-select 'uboot'. (has nothing to
do with this prob but has some other issue's)
	-> pakage selcetion - > de-select 'at'

C) make .. .. Wait .... Until.... The error bails out. 

al/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games AR="/usr/bin/ar"
AS="/usr/bin/as" LD="/usr/bin/ld
-L/buildhome/20091021/buildroot/output/host/lib
-L/buildhome/20091021/buildroot/output/host/usr/lib" NM="/usr/bin/nm"
CC="/usr/bin/gcc -I/buildhome/20091021/buildroot/output/host/include
-I/buildhome/20091021/buildroot/output/host/usr/include"
GCC="/usr/bin/gcc -I/buildhome/20091021/buildroot/output/host/include
-I/buildhome/20091021/buildroot/output/host/usr/include"
CXX="/usr/bin/g++ -I/buildhome/20091021/buildroot/output/host/include
-I/buildhome/20091021/buildroot/output/host/usr/include"
CPP="/usr/bin/cpp -I/buildhome/20091021/buildroot/output/host/include
-I/buildhome/20091021/buildroot/output/host/usr/include"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
FC_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/buildhome/20091021/buildroot/output/host/include
-I/buildhome/20091021/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/buildhome/20091021/buildroot/output/host/include
-I/buildhome/20091021/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/buildhome/20091021/buildroot/output/host/lib
-L/buildhome/20091021/buildroot/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_dir/us
r/bin/arm-linux-uclibc-ar"
AS_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_dir/us
r/bin/arm-linux-uclibc-as"
CC_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_dir/us
r/bin/arm-linux-uclibc-gcc"
LD_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_dir/us
r/bin/arm-linux-uclibc-ld"
NM_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_dir/us
r/bin/arm-linux-uclibc-nm"
RANLIB_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_di
r/usr/bin/arm-linux-uclibc-ranlib"
STRIP_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_dir
/usr/bin/arm-linux-uclibc-strip"
OBJCOPY_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_d
ir/usr/bin/arm-linux-uclibc-objcopy"
OBJDUMP_FOR_TARGET="/buildhome/20091021/buildroot/output/build/staging_d
ir/usr/bin/arm-linux-uclibc-objdump"
DEFAULT_ASSEMBLER="/buildhome/20091021/buildroot/output/build/staging_di
r/usr/bin/arm-linux-uclibc-as"
DEFAULT_LINKER="/buildhome/20091021/buildroot/output/build/staging_dir/u
sr/bin/arm-linux-uclibc-ld"
ORIGINAL_AS_FOR_TARGET="/buildhome/20091021/buildroot/output/build/stagi
ng_dir/usr/bin/arm-linux-uclibc-as"
ORIGINAL_LD_FOR_TARGET="/buildhome/20091021/buildroot/output/build/stagi
ng_dir/usr/bin/arm-linux-uclibc-ld"
ORIGINAL_NM_FOR_TARGET="/buildhome/20091021/buildroot/output/build/stagi
ng_dir/usr/bin/arm-linux-uclibc-nm"
ORIGINAL_OBJDUMP_FOR_TARGET="/buildhome/20091021/buildroot/output/build/
staging_dir/usr/bin/arm-linux-uclibc-objdump"
PKG_CONFIG="/buildhome/20091021/buildroot/output/host/usr/bin/pkg-config
"
PKG_CONFIG_LIBDIR="/buildhome/20091021/buildroot/output/host/usr/lib/pkg
config" \
	
CFLAGS="-I/buildhome/20091021/buildroot/output/host/include
-I/buildhome/20091021/buildroot/output/host/usr/include" \
		LDFLAGS="-L/buildhome/20091021/buildroot/output/host/lib
-L/buildhome/20091021/buildroot/output/host/usr/lib" \
		./configure  \
		--prefix="/buildhome/20091021/buildroot/output/host/usr"
\
	
--sysconfdir="/buildhome/20091021/buildroot/output/host/etc" \
		--disable-static \
	)
configure: WARNING: unrecognized options: --disable-static
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether /bin/sh -n is known to work... no
checking for characters that cannot appear in file names... none
checking whether directories can have trailing spaces... yes
checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... configure: error:
no acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended
make: ***
[/buildhome/20091021/buildroot/output/stamps/host_autoconf_configured]
Error 1



Regards,
Noel.
