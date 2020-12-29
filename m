From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 29 Dec 2020 22:06:00 +0100
Subject: [Buildroot] [PATCH 1/2] libtirpc: remove NIS patch
In-Reply-To: <20201229204658.GX1680670@scaer>
References: <20201202184954.19808-1-petr.vorel@gmail.com>
 <20201229204658.GX1680670@scaer>
Message-ID: <20201229210600.GC2801@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

...
> > Testing with test-pkg shows the only failure for br-riscv32:
> > RPC support not available in C library, please disable
> > BR2_TOOLCHAIN_EXTERNAL_INET_RPC

> > But test fails with the same error even when this patch is kept.

> Indeed, the risc32 case is special: it uses a glibc more recent than
> 2.32. In glibc 2.32, RPC support was entirely removed, so it is not
> unexpected that we do have RPC-relacted issues for riscv32.

I wonder if there is some package which is not yet ported to libtirpc and
requires Sun-RPC. Suppose yes, otherwise there wouldn't be that check, but I
haven't find any.

FYI openSUSE has been using libtirpc as a drop-in replacement for quite long
time. Maybe that could be a solution for Buildroot as well.

openSUSE change libtirpc.pc.in [1] in rpm spec file before build [1]:
sed -i -e 's|${includedir}/tirpc|${includedir}|g' libtirpc.pc.in

[1] https://build.opensuse.org/package/view_file/openSUSE:Factory/libtirpc/libtirpc.spec?expand=1

> Regards,
> Yann E. MORIN.

Kind regards,
Petr
