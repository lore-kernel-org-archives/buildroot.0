From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Thu, 22 Oct 2009 10:25:10 +0200
Subject: [Buildroot] building toolchain fails - more details (3)
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67013CEEA7@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


Just did the whole build again with today's GIT-buildroot, result ..
Does not build ( YET :-(, I just try to build on a daily basis the
active-buildroot on one of my build machines ).
FYI, I'm using the 'SAME'  system/machine for official '2009.08' builds
and this works. 


Peter > Noel> How to simulate?Just type 
Peter >
Peter > Noel> A) 'make at91sam9g20dfc_defconfig' (press enter a couple
of times....) {  Noel> but at91sam9260dfc_defconfig has same problem)
Noel> B) make menuconfig  -> kernel -> kernel binary format -> image
format : zimage  (so  Noel> you can uncheck uboot)  -> Target Filesystem
options -> de-select 'uboot'. (has nothing to  Noel> do with this prob
but has some other issue's)  -> pakage selcetion - > Peter > de-select
'at'
Peter > Still the same build error on M4.
Peter > 
Peter >  FYI, the above builds for me with latest git.


ldroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-objdump"
PKG_CONFIG="/buildhome/20091022/buildroot/output/host/usr/bin/pkg-config
"
PKG_CONFIG_LIBDIR="/buildhome/20091022/buildroot/output/host/usr/lib/pkg
config" \
	
CFLAGS="-I/buildhome/20091022/buildroot/output/host/include
-I/buildhome/20091022/buildroot/output/host/usr/include" \
		LDFLAGS="-L/buildhome/20091022/buildroot/output/host/lib
-L/buildhome/20091022/buildroot/output/host/usr/lib" \
		./configure  \
		--prefix="/buildhome/20091022/buildroot/output/host/usr"
\
	
--sysconfdir="/buildhome/20091022/buildroot/output/host/etc" \
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
[/buildhome/20091022/buildroot/output/stamps/host_autoconf_configured]
Error 1




Peter >  Noel> Looking into the config.log into this directory gives me.

Peter >  Noel> << autoconf-2.64-host - config.log snip >>

Peter >  Noel> configure:2356: checking for GNU M4 that supports
accurate traces
Peter >  Noel> configure:2391: error: no acceptable m4 could be found in
$PATH.
Peter >  Noel> GNU M4 1.4.6 or later is required; 1.4.13 is recommended

Peter > Strange as the host-autoconf package depends on host-m4. Don't
you have
Peter > a build/m4-1.4.9-host directory? On my system I get:


Yes I do have a build/m4-1.4.9-host .. 

This is the content of the /output/build dir:

/buildhome/20091022/buildroot/output/build$ ls
autoconf-2.64-host  busybox-1.13.4  ethtool-6       haserl-0.9.26
libevent-1.4.12   libtool-1.5.24-host  pkg-config-0.23-host
avahi-0.6.23        dbus-1.2.16     expat-2.0.1
l2tpd-0.70-pre20031121  liblockfile-1.08  linux-2.6.28.2
staging_dir
buildroot-config    dropbear-0.52   gettext-0.16.1  libdaemon-0.13
libpcap-0.9.8     m4-1.4.9-host        zlib-1.2.3



Regards Noel.
