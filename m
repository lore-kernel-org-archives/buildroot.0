From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 16:40:00 +0200
Subject: [Buildroot] [PATCH v6 1/4] infra: add support for MIPS NaN
In-Reply-To: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
References: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
Message-ID: <20170716164000.415ca6f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Jun 2017 16:17:10 +0100, Vicente Olivert Riera wrote:
> MIPS supports two different NaN encodings, legacy and 2008. Information
> about MIPS NaN encodings can be found here:
> 
>   https://sourceware.org/binutils/docs/as/MIPS-NaN-Encodings.html
> 
> NaN legacy is the only option available for R2 cores and older.
> NaN 2008 is the only option available for R6 cores.
> R5 cores can have either NaN legacy or NaN 2008, depending on the
> implementation. So, if the user selects a generic R5 target architecture
> variant, we show a choice menu with both options available. For well
> known R5 cores we directly select the NaN enconding they use.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v4 -> v6:
>  - Nothing
> Changes v3 -> v4:
>  - Do not have a default list for NAN options. Instead, select them from
>    the BR2_MIPS_CPU_* options. (Arnout)
>  - uclibc/Config.in: use the new NAN options from arch/Config.in.mips
> Changes v2 -> v3:
>  - Nothing
> Changes v1 -> v2:
>  - Define config symbol in arch/Config.in
>  - Change string "NAN" to "NaN"
> ---
>  arch/Config.in                                     |  3 ++
>  arch/Config.in.mips                                | 36 ++++++++++++++++++++++
>  package/gcc/gcc.mk                                 |  7 +++++
>  package/uclibc/Config.in                           |  4 +--
>  .../toolchain-external/pkg-toolchain-external.mk   |  5 +++
>  toolchain/toolchain-wrapper.c                      |  3 ++
>  6 files changed, 56 insertions(+), 2 deletions(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
