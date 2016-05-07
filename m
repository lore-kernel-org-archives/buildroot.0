From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 7 May 2016 21:45:14 +0300
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <20160507144313.4e7112af@free-electrons.com>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
 <20160507144313.4e7112af@free-electrons.com>
Message-ID: <20160507184514.GA2419@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Christian,

On Sat, May 07, 2016 at 02:43:13PM +0200, Thomas Petazzoni wrote:
> Applied to master, thanks. However, I've noticed that on my machine,
> host-go-bootstrap doesn't build:
> 
> net/rpc/jsonrpc
> # cmd/pprof
> /home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
> /home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
> runtime/cgo(.text): unexpected relocation type 298
> runtime/cgo(.text): unexpected relocation type 298
> # cmd/go
> /home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
> /home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/pkg/linux_amd64/runtime/cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
> runtime/cgo(.text): unexpected relocation type 298
> runtime/cgo(.text): unexpected relocation type 298
> package/pkg-generic.mk:195: recipe for target '/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/.stamp_built' failed
> make[1]: *** [/home/thomas/projets/buildroot/output/build/host-go-bootstrap-1.4.2/.stamp_built] Error 2
> Makefile:36: recipe for target '_all' failed
> make: *** [_all] Error 2

Seems to be fixed in 1.5.2. See 
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=807136.

> You should be able to reproduce with the following defconfig:

You'll most likely also need a relatively recent host binutils to reproduce.

baruch

> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.02-3-g762b7c9.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_FLANNEL=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Could you look into this?

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
