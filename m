From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:05:23 +0200
Subject: [Buildroot] [PATCH 1/4] configs/acmesystems_aria_g25: update
 default configuration for both 128MB and 256MB version
In-Reply-To: <20190811145856.27420-1-biagio.hkr@gmail.com>
References: <20190811145856.27420-1-biagio.hkr@gmail.com>
Message-ID: <20190811220523.29056873@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Biagio!

On Sun, 11 Aug 2019 16:58:53 +0200
Biagio Montaruli <biagio.hkr@gmail.com> wrote:

> * Bump Linux version to 4.19
> * Use default 'genimage' post-image script (support/scripts/genimage.sh)
>   to build sdcard.img
> * Bump AT91bootstrap version to 3.8.13
> 
> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
> ---
>  configs/acmesystems_aria_g25_128mb_defconfig | 10 ++++++----
>  configs/acmesystems_aria_g25_256mb_defconfig | 10 ++++++----
>  2 files changed, 12 insertions(+), 8 deletions(-)

Thanks a lot for providing these patches so quickly! I have applied
your series. However, I had to do two changes:

 - Squash patches 1 & 2 together, and patches 3 & 4 together. Indeed,
   your patch 1 updates to AT91bootstrap 3.8.13, but only your patch 2
   changes the genimage.cfg to take into account the change of the
   at91bootstrap image. So patch 1 is not independent of patch 2,
   breaking bisectability.

 - Your commit logs forgot the references to the build failures that
   the patches are fixing.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
