From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:19:35 +0200
Subject: [Buildroot] [PATCH] toolchain/internal: not aailable for a few
 mips cores
In-Reply-To: <20170817202647.26738-1-yann.morin.1998@free.fr>
References: <20170817202647.26738-1-yann.morin.1998@free.fr>
Message-ID: <20170829231935.71e6bb85@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Aug 2017 22:26:47 +0200, Yann E. MORIN wrote:
> Commit 1b974425 (MIPS: add support for M6201 cores) xplained that the
> new core was not supported by upstream gcc, and as of gcc-8-trunk that's
> stil lthe case.
> 
> Ditto for 3cfbeb83 (MIPS: add support for P6600 cores).
> 
> This means that we currently elect to build an internal tolchain for
> those cores, yet we have no suitable gcc version.
> 
> Disable the internal backend in this case.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/Config.in.host | 7 +------
>  toolchain/Config.in        | 2 ++
>  2 files changed, 3 insertions(+), 6 deletions(-)

Applied to master, after fixing a number of typos here and there :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
