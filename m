From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 12:05:36 +0200
Subject: [Buildroot] [PATCH] package/polkit: needs glibc
In-Reply-To: <20180805084619.13182-1-yann.morin.1998@free.fr>
References: <20180805084619.13182-1-yann.morin.1998@free.fr>
Message-ID: <20180805120536.52eb662d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Aug 2018 10:46:19 +0200, Yann E. MORIN wrote:
> The recent bump of polkit introduced a version that now unconditionally
> uses glibc-specific functions from the getnetgrent() familly, which are
> not available on musl or uClibc-ng.
> 
> Hide away polkit when the C library is not glibc.
> 
> Propagate the dependency to packages that select polkit: udisks and
> systemd. For systemd, add a comment.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/d78/d783e6db60b187aa591f4b0150c590ab3aa5252f/ (musl)
>     http://autobuild.buildroot.org/results/ba5/ba5da960c70c765bee753a79b9ad2c10967d05d6/ (uclibc)
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Marek Belisko <marek.belisko@open-nandra.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Artem Panfilov <apanfilov@spectracom.com>
> ---
>  package/polkit/Config.in  | 5 +++--
>  package/systemd/Config.in | 4 ++++
>  package/udisks/Config.in  | 6 +++---
>  3 files changed, 10 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
