From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 22:39:33 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain-external: CodeSourcery
 PowerPC: Revert the removal of CS PowerPC 2011.03
In-Reply-To: <1451164306-30008-1-git-send-email-romain.naour@gmail.com>
References: <1451164306-30008-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20151230223933.36d53c35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 26 Dec 2015 22:11:46 +0100, Romain Naour wrote:
> As reported by Yann E. MORIN [1], the latest CS PowerPC toolchain (2012.03)
> requires a PPC CPU with SPE, which is basically two variants, 8540 (e500v1) and
> 8548 (e500v2) in Buildroot. All other PPC CPU can't use that toolchain.
> 
> Keep CS PowerPC 2011.03 as latest available version and add a second Kconfig
> symbol for the CS PowerPC 2012.03 since it's verry specific to one CPU type
> (e500v2).
> 
> Previously it was possible to select the CS 2012.03 with a powerpc 8540 (e500v1)
> CPU but the sysroot provided by the toolchain only support the 8548 (e500v2)
> variant. Allow to select CS 2012.03 only with BR2_powerpc_8548.
> 
> Also re-add the previous CS toolchain handling for pixman and liquid-dsp.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-December/148308.html
> 
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: Add a second Kconfig symbol for the CS PowerPC 2012.03 since it's verry specific
>     to one CPU type (e500v2)
> ---
>  package/liquid-dsp/Config.in                       |  3 ++
>  package/pixman/pixman.mk                           |  5 +++
>  toolchain/toolchain-external/Config.in             | 42 +++++++++++++++++++---
>  .../toolchain-external/toolchain-external.hash     |  1 +
>  toolchain/toolchain-external/toolchain-external.mk |  5 ++-
>  5 files changed, 51 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
