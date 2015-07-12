From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 17:54:20 +0200
Subject: [Buildroot] [RFC 2/2] barebox: Add possibility to build also
 barebox xloader (MLO).
In-Reply-To: <1356217460-20232-3-git-send-email-marek.belisko@open-nandra.com>
References: <1356217460-20232-1-git-send-email-marek.belisko@open-nandra.com>
 <1356217460-20232-3-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20150712175420.674e1944@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Sun, 23 Dec 2012 00:04:20 +0100, Marek Belisko wrote:
> This add config option for user to select defconfig or custom xloader config.
> Barebox have xloader defconfig for:
> phycard_a_xl2_xload_defconfig
> pcm049_xload_defconfig
> archosg9_xload_defconfig
> phycard_a_l1_xload_defconfig
> omap3530_beagle_xload_defconfig
> panda_xload_defconfig
> 
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  boot/barebox/Config.in  |   28 ++++++++++++++++++++++++++++
>  boot/barebox/barebox.mk |   28 ++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)

This would be useful to have, but we would like to see a different
implementation. Our notes were:

   Allow a second Barebox build, to build the MLO/SPL. See
   http://patchwork.ozlabs.org/patch/207942/ and
   http://patchwork.ozlabs.org/patch/207943/. The proposed design is to
   have boot/barebox/ containing the common stuff, and then two
   separate packages boot/barebox-first/ and boot/barebox-second/
   (names to be chosen). There is only one version selection, but each
   package allows to define the configuration to be used. Design should
   be a little bit like package/gcc, where we have multiple gcc builds,
   but share a lot of common definitions between the packages.

Since no one has submitted anything in this direction since 2.5 years,
we will mark your patch as Rejected. Do not hesitate to work on this
topic again, and send new patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
