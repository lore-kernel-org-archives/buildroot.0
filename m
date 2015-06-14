From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:17:25 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/libtirpc: does not build
 with musl libc
In-Reply-To: <a13a154a08aa3fd09400a2b1ae3571544a86f3db.1434292018.git.yann.morin.1998@free.fr>
References: <cover.1434292018.git.yann.morin.1998@free.fr>
 <a13a154a08aa3fd09400a2b1ae3571544a86f3db.1434292018.git.yann.morin.1998@free.fr>
Message-ID: <20150614231725.6865e1a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 14 Jun 2015 16:29:06 +0200, Yann E. MORIN wrote:
> Previously-packaged libtirpc version, 0.2.4, did not build with musl on
> ARM (see build failures, below) because of missing header sys/cdefs.h
> 
> Newly-packaged version, 0.3.1, does not build on musl, on ARM for the
> same reason as 0.2.4, and on whatever the architecture (ARM included)
> because of the extra-missing header sys/queue.h .

At
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=libtirpc-musl-fix,
I have a patch that makes libtirpc 0.2.4 build fine with musl.
Unfortunately, it breaks glibc build :)

I think the patch set can be simplified on top of libtirpc 0.3.1,
because:

 * the cdefs.h issue is fixed upstream already:
   http://git.linux-nfs.org/?p=cel/libtirpc.git;a=commit;h=7228a9482b92ff0305f7e7ccd0276c638bee1884

 * the IPPORT_RESERVED issue is also fixed upstream:
   http://git.linux-nfs.org/?p=cel/libtirpc.git;a=commit;h=4d3263ca3b64de8acdcaf71d36bfb0eda06b8710

So maybe that leaves only the sys/queue.h issue, for which my patch
contains a proposal.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
