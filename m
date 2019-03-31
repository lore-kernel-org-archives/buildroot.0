From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 21:15:55 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/openldap: fix static linking wih atomics
In-Reply-To: <20190331160009.1538-1-fontaine.fabrice@gmail.com>
References: <20190331160009.1538-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331211555.3ec6dc4e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 18:00:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openldap uses its own libtool, static build with atomic fails with our
> patches since February 6th 2019 on:
> 
> /bin/sh ../../libtool --mode=link /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os   -static  -static   -o idtest idtest.o liblber.la ../../libraries/liblutil/liblutil.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lz -pthread -latomic -lcrypto -lz -pthread -latomic
> 
> /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -static -o etest etest.o -pthread -pthread ./.libs/liblber.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib ../../libraries/liblutil/liblutil.a -lssl -lcrypto -lz -pthread /home/buildroot/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/5.4.0/../../../../or1k-buildroot-linux-uclibc/lib//libatomic.so
> 
> To fix this error, revert the openldap commit that raises this issue
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ab4f85fd21cacfaef6b0b43a38da6a4a1d32ecb6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Don't set OPENLDAP_LIBTOOL_PATCH=NO and drop upstream patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
