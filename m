From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 23:12:40 +0200
Subject: [Buildroot] [PATCH v2] arp-scan: new package
In-Reply-To: <20170405101410.27980-1-arnout@mind.be>
References: <20170405101410.27980-1-arnout@mind.be>
Message-ID: <20170405231240.4290eb09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Apr 2017 12:14:10 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> On the br-arm-cortex-m4-full toolchain, the build fails with a
> segmentation fault in elf2flt, so add an exception for ARM FLAT
> toolchains. Other FLAT toolchains (e.g. br-m68k-5208-full) work fine.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I tried to debug the elf2flt segfault but elf2flt isn't exactly the
> most low-entry-bar source code...

Applied to master, thanks. However, I've dropped the elf2flt
related exception, since it really isn't a bug with this package, but a
bug with binutils/elf2flt, which we encounter with other packages as
well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
