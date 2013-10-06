From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 18:38:07 +0200
Subject: [Buildroot] [PATCH V2 2/3] i.MX6: Use canonical site for
 Freescale packages
In-Reply-To: <1381073624-27739-2-git-send-email-eric.nelson@boundarydevices.com>
References: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381073624-27739-2-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20131006183807.3a87ff12@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Sun,  6 Oct 2013 08:33:43 -0700, Eric Nelson wrote:
> -# No official download site from freescale, just this mirror
> -FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
> +FREESCALE_IMX_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
> +#FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source

Please don't keep this as a comment.

Also, this patch actually does two things: renaming the variable, and
change the site from download.ossystems.com.br to freescale.com. I
believe the switch to freescale.com does not work if you don't also
bump the version at the same time, so I'd suggest that:

 * this patch only renames the variable from IMX_MIRROR_SITE to
   IMX_SITE, but does not change its value

 * the change from ossystems.com.br to freescale.com is done in the
   following patch that bumps the version.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
