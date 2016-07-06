From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 14:48:57 +0200
Subject: [Buildroot] [PATCH] support/apply-patches: re-instate set -e
In-Reply-To: <1467740163-10650-1-git-send-email-yann.morin.1998@free.fr>
References: <1467740163-10650-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160706144857.2c91cf52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 19:36:03 +0200, Yann E. MORIN wrote:
> As reported by S?bastien Szymanski [1], the apply-patches script
> doesn't stop if a tar command can't extract an archive.
> 
> Use "set -e" to exit immediately if a command return an error.
> 
> Be sure to ignore any expected error: when we check if a patch to be
> applied has the same basename as an already applied patch, the grep
> would fail when no such patch was already applied. We should not fail
> in this case.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Tested with:
>     make defconfig
>     make allyespackageconfig
>     [remove luainterpreter to avoid multiple providers for
>      luainterpreter; disable qemu-user; disable tar rootfs]
>     make source
>     make $(make -s show-targets |sed -r -e 's/ |$/-patch /g')
> ---
>  support/scripts/apply-patches.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
