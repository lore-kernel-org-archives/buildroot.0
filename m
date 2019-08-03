From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 15:30:02 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/libnss: re-enable package on
 microblaze
In-Reply-To: <20190626125900.48230-3-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
 <20190626125900.48230-3-giulio.benetti@micronovasrl.com>
Message-ID: <20190803153002.767c2a91@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jun 2019 14:58:55 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x the build hangs due to bug 85862:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
> To avoid this, the libnss package has a !BR2_TOOLCHAIN_HAS_GCC_BUG_85862
> dependency. However, gcc bug 85862 only triggers when optimization is
> enabled, so we can work around the issue by passing -O0, which is what
> we do in other Buildroot packages to work around this bug.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> V1->V2:
> * use $() instead of ${}
> ---
>  package/libnss/Config.in | 4 ----
>  package/libnss/libnss.mk | 8 +++++++-
>  2 files changed, 7 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
