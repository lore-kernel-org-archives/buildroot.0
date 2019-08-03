From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 15:30:11 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/boost: remove gcc bug 85180
 dependency for boost-fiber option
In-Reply-To: <20190626125900.48230-5-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
 <20190626125900.48230-5-giulio.benetti@micronovasrl.com>
Message-ID: <20190803153011.41c35ce3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jun 2019 14:58:57 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dependency is already satisfied because
> BR2_PACKAGE_BOOST_FIBER depends on
> BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS that doesn't contain
> BR2_microblaze and BR2_TOOLCHAIN_HAS_GCC_BUG_85180 depends right on
> BR2_microblaze. So let's remove 'depends on
> BR2_TOOLCHAIN_HAS_GCC_BUG_85180'.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> V1->V2:
> * don't allow building boost context since it's not supported for
>   Microblaze
> ---
>  package/boost/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
