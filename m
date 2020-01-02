From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:24:03 +0100
Subject: [Buildroot] [PATCH] support/autobuilder: fix riscv toolchains
In-Reply-To: <20200101213132.6267-1-yann.morin.1998@free.fr>
References: <20200101213132.6267-1-yann.morin.1998@free.fr>
Message-ID: <20200102092403.15cd824a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  1 Jan 2020 22:31:32 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> In commit aee39cbf27e (arch/riscv: set the default float ABI based on
> ISA extensions), the default ABI changed, so the config fragments used
> by the autobuilders were adapated accordingly, in commit f89871e81085
> (support/config-fragments: fix br-riscv{32,64} toolchain fragments).
> 
> But now, we need to revert again, because the newer toolchains are now
> using the default ABI again.
> 
> We do not really do a revert, though, because the original change was
> right, and a revert would mean it was not.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/b59/b593267fb9fc9a002b977e049b2a5389dbaded30/ (riscv32)
>     http://autobuild.buildroot.org/results/b42/b42a4b22b29f47d5c85be119b310f1dfb61112a1/ (riscv64)
>     ... and so many others on various packages...
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  support/config-fragments/autobuild/br-riscv32.config | 1 -
>  support/config-fragments/autobuild/br-riscv64.config | 1 -
>  2 files changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
