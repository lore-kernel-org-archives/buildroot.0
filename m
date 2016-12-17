From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:26:45 +0100
Subject: [Buildroot] [PATCH] toolchain: extend musl workaround for
 recent kernels
In-Reply-To: <a627480f04fdcc673a915a26eb690d7b854072a2.1481831300.git.baruch@tkos.co.il>
References: <a627480f04fdcc673a915a26eb690d7b854072a2.1481831300.git.baruch@tkos.co.il>
Message-ID: <20161217152645.26b59a2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Dec 2016 21:48:20 +0200, Baruch Siach wrote:
> Kernels v4.7 and newer[1] require the __USE_MISC macro for libc-compat.h
> suppressions to be effective. musl does not define this macros, so add an
> unconditional definition of __USE_MISC to libc-compat.h.
> 
> In addition, since musl define IFF_LOWER_UP and friends as macros (instead of
> enums), define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO to
> suppress the kernel corresponding definitions to avoid conflict.
> 
> Fixes (xl2tp):
> http://autobuild.buildroot.net/results/0b9/0b9384c4beaac85f3a17c3245c8a7418c2e2e296/
> http://autobuild.buildroot.net/results/657/657bc5687cf01aee38d32d45ba57fb62b2bd56d0/
> http://autobuild.buildroot.net/results/bcd/bcd81618de2f745a19c923c66d787b5182bb54aa/
> 
> [1] Since commit f0a3fdca79 (uapi glibc compat: fix compilation when
>     !__USE_MISC in glibc)
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  toolchain/toolchain/toolchain.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
