From: Ludger Keilig <buildroot@invalid-domain.net>
Date: Fri, 21 May 2010 11:09:15 +0200
Subject: [Buildroot] buildroot-2010.05-rc2, problem with binutils-2.20.1
In-Reply-To: <1274422785.5719.8.camel@bernd-desktop>
References: <1274422785.5719.8.camel@bernd-desktop>
Message-ID: <4BF64DBB.9030805@invalid-domain.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> I tried buildroot-2010.05-rc2:
> make at91rm9200df_defconfig
> make menuconfig
> make
> 
> buildroot terminates with:
> 
> checking for zlib.h... yes
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_union?:checking linker --as-needed support...
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:151: warning: implicit declaration of function ?free?
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_replace_key_data?:
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error: ?LONG_MIN? undeclared (first use in this function)
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error: (Each undeclared identifier is reported only once
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error: for each function it appears in.)
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_delete_node?:
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:261: error: ?LONG_MIN? undeclared (first use in this function)
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:265: warning: implicit declaration of function ?abort?
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:265: warning: incompatible implicit declaration of built-in function ?abort?
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_consolidate?:
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:368: warning: implicit declaration of function ?memset?
> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:368: warning: incompatible implicit declaration of built-in function ?memset?

Seems to be the same as in bug #1789.

For me, it helped to revert the patch introduced in commit
6b939d40f6a29a43277566adc9d4312d49cb3abf.
No, I don't like this, but at least it seems to work.


Ciao, Ludger
