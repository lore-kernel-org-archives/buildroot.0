From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 21:39:38 +0200
Subject: [Buildroot] [PATCH 04/16 v3] core: introduce an intermediate
 rule before the configurators
In-Reply-To: <22c8e4df35485da3ab9dd836465e4892305c7073.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <22c8e4df35485da3ab9dd836465e4892305c7073.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827213938.13e89622@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:24 +0200, Yann E. MORIN wrote:
> Currently, all configurators depend on generating the out-of-tree
> Makefile wrapper.
> 
> In an upcoming patch, we'll need to also generate a kconfig fragment,
> so it will have to kick in before we run the configurators.
> 
> Introduce a new intermediate "prepare-kconfig" rule, so we can
> commonalise the dependencies of the configurators. Move the dependency
> on the Makefile wrapper to that new intermediate rule.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  Makefile | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)

Applied to next, after marking the new prepare-kconfig target as PHONY.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
