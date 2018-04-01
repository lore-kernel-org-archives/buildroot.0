From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:10:09 +0200
Subject: [Buildroot] [PATCH v2 16/37] check-package: enable for
 toolchain/
In-Reply-To: <20180401050850.5701-17-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-17-ricardo.martincoski@gmail.com>
Message-ID: <20180401091009.3c80a574@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:29 -0300, Ricardo Martincoski wrote:
> The toolchain directory can benefit from this script to prevent common
> mistakes when submitting patches.
> 
> In order to accomplish this:
> Do not ignore anymore files from the toolchain/ directory.
> Ignore this symbol:
>  - BR_LIBC: defined by the buildroot toolchain, used by gcc-final.mk.
> 
> Ignore toolchain/toolchain-external/pkg-toolchain-external.mk as it
> declares a package infra and not a package itself.
> Ignore toolchain/helpers.mk as it contains only helper functions.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1 -> v2:
>   - rebase after toolchain-common.in was merged to Config.in;
>   - remove spurious info from commit log (I first created the series
>     changing the check-package and then fixing the package files; when I
>     rebased to allow partial apply of the series, the info "do not
>     ignore this symbol" became obsolete since it is fixed in a previous
>     patch);
> ---
>  utils/check-package             | 3 +++
>  utils/checkpackagelib/lib_mk.py | 1 +
>  2 files changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
