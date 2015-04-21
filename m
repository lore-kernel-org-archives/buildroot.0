From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 22:18:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: ccache compile
 fix
In-Reply-To: <1428678065-24673-1-git-send-email-rdkehn@yahoo.com>
References: <1428678065-24673-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150421221848.1fe976f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Fri, 10 Apr 2015 10:01:05 -0500, Doug Kehn wrote:
> cryptodev-linux fails to build when BR2_CCACHE=y.
> 
> >>> cryptodev-linux 1.7 Building
> /usr/bin/make -j5 -C /home/dkehn/buildroot/output/build/cryptodev-linux-1.7 HOSTCC="/home/dkehn/buildroot/output/host/usr/bin/ccache /usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/dkehn/buildroot/output/target CROSS_COMPILE="/home/dkehn/buildroot/output/host/usr/bin/ccache /home/dkehn/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-" DEPMOD=/home/dkehn/buildroot/output/host/sbin/depmod LOADADDR="0x82000000" KERNEL_DIR=/home/dkehn/buildroot/output/build/linux-2489c022b2932432606f897741a71b712e6dbe77
> make -C /home/dkehn/buildroot/output/build/linux-2489c022b2932432606f897741a71b712e6dbe77 SUBDIRS=`pwd` ARCH=arm CROSS_COMPILE=/home/dkehn/buildroot/output/host/usr/bin/ccache /home/dkehn/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf- modules
> make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
> make[3]: /home/dkehn/buildroot/output/host/usr/bin/ccachegcc: Command not found
> 
> Adding quotes around ${CROSS_COMPILE} KERNEL_MAKE_OPTS assignment in
> cryptodev-linux Makefile fixes compile error.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
>  package/cryptodev-linux/0002-fix-ccache-compile.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/cryptodev-linux/0002-fix-ccache-compile.patch

You forgot a description and SoB line in the patch itself, so I've
added these and committed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
