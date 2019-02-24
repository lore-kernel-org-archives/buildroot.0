From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 21:39:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: link with libatomic
 when needed
In-Reply-To: <20190216081905.21631-1-bernd.kuhls@t-online.de>
References: <20190216081905.21631-1-bernd.kuhls@t-online.de>
Message-ID: <20190224213942.3a035d63@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Feb 2019 09:19:05 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Configure check for OpenSSL fails:
> 
> /accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): In function `CRYPTO_atomic_add':
> threads_pthread.c:(.text+0x1dc): undefined reference to `__atomic_is_lock_free'
> threads_pthread.c:(.text+0x1f4): undefined reference to `__atomic_fetch_add_4'
> 
> Fixes
> http://autobuild.buildroot.net/results/cae8da81adff3ba493154e0ba8b21d90367f82eb/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/clamav/clamav.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I would still prefer a solution based on pkg-config for such problems
(especially since clamav is already using pkg-config to find some other
libraries), but OK, let's do this for now, it's the least invasive
solution.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
