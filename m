From: lemonoje <lemonoje@gmail.com>
Date: Fri, 12 May 2017 07:45:42 -0700 (PDT)
Subject: [Buildroot] Altera SoC Buildroot external toolchain
	incompatible error
In-Reply-To: <1494598560669-164820.post@n4.nabble.com>
References: <1494532269551-164744.post@n4.nabble.com>
 <20170511221419.1e5e9baf@free-electrons.com>
 <1494533969065-164751.post@n4.nabble.com>
 <20170511225147.7466e9ff@free-electrons.com>
 <1494535599131-164758.post@n4.nabble.com>
 <20170511232316.693f8e6c@free-electrons.com>
 <1494594693346-164814.post@n4.nabble.com>
 <20170512155205.526ea00c@free-electrons.com>
 <1494598560669-164820.post@n4.nabble.com>
Message-ID: <1494600342392-164824.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, removing the entire BR directory, re-clone, and re-checkout fixed the
error.  Previous failures must have mucked something up!  
Now it builds for about 10 minutes and gets to compiling in valgrind
(recommended by Rocketboards materials)  and that portion fails with:

*
Toolchain wrapper executing:
   
'/sf/ArriaX/ltsi_4_1_33/gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc'
    '--sysroot'
   
'/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/ARM-buildroot-linux-gnueabihf/sysroot'
    '-mabi=aapcs-linux'
    '-mfpu=neon'
    '-marm'
    '-mfloat-abi=hard'
    '-mcpu=cortex-a9'
    '--version'
ok (6.2.1)
checking build system type... x86_64-pc-linux-gnu
checking host system type... Invalid configuration
`ARM-buildroot-linux-gnueabihf': machine `ARM-buildroot' not recognized
configure: error: /bin/sh ./config.sub ARM-buildroot-linux-gnueabihf failed
package/pkg-generic.mk:206: recipe for target
'/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/valgrind-3.12.0/.stamp_configured'
failed
make: ***
[/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/valgrind-3.12.0/.stamp_configured]
Error 1*






--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Altera-SoC-Buildroot-external-toolchain-incompatible-error-tp164744p164824.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
