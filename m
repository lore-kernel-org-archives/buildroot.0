From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:14:34 +0100
Subject: [Buildroot] [PATCH] toolchain/buildroot: glibc does not always
 have native RPC
In-Reply-To: <20201229211030.3325582-1-yann.morin.1998@free.fr>
References: <20201229211030.3325582-1-yann.morin.1998@free.fr>
Message-ID: <20201229221434.1528aa27@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Dec 2020 22:10:30 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Starting with glibc-2.32, the RPC code has been removed from
> glibc [0], and it is not possible anymore to enable it, even
> with the --enable-obsolete-rpc configure option (which was
> also removed).
> 
> riscv32 and arc both use a glibc 2.32+ so do not forecfully
> enable native RPC for them.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
