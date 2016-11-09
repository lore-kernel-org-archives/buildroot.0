From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:37:40 +0100
Subject: [Buildroot] [PATCH v3 1/2] MIPS: add support for XBurst cores
In-Reply-To: <20161109161658.53527-1-Vincent.Riera@imgtec.com>
References: <20161109161658.53527-1-Vincent.Riera@imgtec.com>
Message-ID: <20161109213740.3438b5d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 16:16:57 +0000, Vicente Olivert Riera wrote:
> The Ingenic XBurst is a MIPS32R2 microprocessor.
> 
> It has a bug in the FPU that can generate incorrect results in certain
> cases. The problem shows up when you have several fused madd
> instructions in sequence with dependant operands.
> 
> Using the -mno-fused-madd option prevents gcc from emitting these
> instructions. This patch adds changes to the toolchain wrapper to use
> that option.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3:
>  - Improve commit log and add help section. (Suggested by Arnout)
> Changes v1 -> v2:
>  - Do not add -mmxu to the wrapper.
> ---
>  arch/Config.in.mips            | 14 ++++++++++++++
>  toolchain/toolchain-wrapper.c  |  3 +++
>  toolchain/toolchain-wrapper.mk |  5 +++++
>  3 files changed, 22 insertions(+)

I've applied both patches to master. Even though it's adding a new
architecture entry, it's really a bug fix needed for the
ci20_defconfig, which is why I've chosen to apply this to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
