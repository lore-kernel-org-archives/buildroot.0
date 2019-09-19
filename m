From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 21:51:01 +0200
Subject: [Buildroot] [PATCH 1/1] arch/riscv: set the default float ABI
 based on ISA extensions
In-Reply-To: <20190919154036.23245-1-mark.corbin@embecosm.com>
References: <20190919154036.23245-1-mark.corbin@embecosm.com>
Message-ID: <20190919215101.6c2944d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Thu, 19 Sep 2019 16:40:35 +0100
Mark Corbin <mark.corbin@embecosm.com> wrote:

> This patch sets the default floating point ABI based on the ISA
> extensions that have been selected rather than defaulting to soft
> float.
> 
> For 64-bit:
> 
> ISA 'D' selects  lp64d
> ISA 'F' selects  lp64f
> Otherwise select lp64
> 
> For 32-bit:
> 
> ISA 'D' selects  ilp32d
> ISA 'F' selects  ilp32f
> Otherwise select ilp32
> 
> This change was proposed by Palmer Dabbelt at SiFive.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/Config.in.riscv | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks. However, I'm wondering: does it really makes
sense to offer a choice of the ABI ? Would there be a reason for a user
to use lp64 if he has the D ISA for example ? It would seem logical to
simply use lp64d as soon as you have the D ISA.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
