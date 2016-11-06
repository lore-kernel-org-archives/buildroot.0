From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:02:25 +0100
Subject: [Buildroot] [PATCH v2] package/qemu: disable Qemu user-land
 emulation for musl toolchains
In-Reply-To: <1478448288-17885-1-git-send-email-romain.naour@gmail.com>
References: <1478448288-17885-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161106230225.429f66e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 17:04:48 +0100, Romain Naour wrote:
> Like for cyclictest (rt-test)[1], linux-user/syscall.c use the
> definition of the "struct sigevent" from Glibc/uClibc which doesn't
> build with musl libc.
> 
> So, disable Qemu user-land emulation for musl toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b27/b277e668d9e22b624416bf46f6ccba802acd257e
> 
> [1] 43bffa59e7359610c8f00038ddd97795c0ca35e1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
> v2: add a comment for BR2_TOOLCHAIN_USES_MUSL case (Arnout)
> ---
>  package/qemu/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
