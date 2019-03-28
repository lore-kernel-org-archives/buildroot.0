From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:54:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/openldap: don't patch libtool
In-Reply-To: <20190328172937.11268-1-fontaine.fabrice@gmail.com>
References: <20190328172937.11268-1-fontaine.fabrice@gmail.com>
Message-ID: <20190328185416.01eb56c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 28 Mar 2019 18:29:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openldap uses its own libtool, static build with atomic fails with our
> patches since February 6th 2019 on:
> 
> /bin/sh ../../libtool --mode=link /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os   -static  -static   -o idtest idtest.o liblber.la ../../libraries/liblutil/liblutil.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lz -pthread -latomic -lcrypto -lz -pthread -latomic
> 
> /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -static -o etest etest.o -pthread -pthread ./.libs/liblber.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib ../../libraries/liblutil/liblutil.a -lssl -lcrypto -lz -pthread /home/buildroot/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/5.4.0/../../../../or1k-buildroot-linux-uclibc/lib//libatomic.so
> 
> To fix this error, set OPENLDAP_LIBTOOL_PATCH to NO

Do you understand why openldap is specifically affected ? I'm a bit
worried about "randomly" disabling libtool patching.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
