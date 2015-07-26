From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:48:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] ltp-testsuite: support building with
 toolchains without native RPC
In-Reply-To: <1437936194-8826-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437936194-8826-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150726214820.15090354@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 26 Jul 2015 20:43:14 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ltp-testsuite needs RPC, but this could also be provided by libtirpc.
> 
> The dependency of libtirpc on
> !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 does not need to be
> propagated, because it is always satisfied: ltp-testsuite depends on
> BR2_USE_MMU which is always unset for Blackfin targets.
> 
> Since musl toolchains never have RPC support, this change would now allow
> building of ltp-testsuite on musl toolchains. Unfortunately, ltp-testsuite
> does not build yet with musl, so a specific check on musl is added.
> This is deemed more conceptually correct than checking on glibc||uclibc.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
> 
> ---
>  package/ltp-testsuite/Config.in        |  7 ++++---
>  package/ltp-testsuite/ltp-testsuite.mk | 15 +++++++++++++--
>  2 files changed, 17 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
