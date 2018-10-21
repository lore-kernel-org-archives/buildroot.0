From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 11:03:33 +0200
Subject: [Buildroot] [V2 PATCH 1/1] Odroid XU4: Hardkernel new board
 support
In-Reply-To: <1518713437-2163-1-git-send-email-pct@crookies.net>
References: <20180215105112.70b2e028@windsurf.lan>
 <1518713437-2163-1-git-send-email-pct@crookies.net>
Message-ID: <20181021110333.66837e4b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 17:50:37 +0100, Pierre CROKAERT wrote:
> This patch provides support for the board Odroid XU4
> This version is using a recent 4.14 kernel released by Hardkernel,
> and the current u-boot 2017.05 also from Hardkernel.
> The support was implemented based on comments about Andi's patch (https://patchwork.ozlabs.org/patch/640695/).
> 
> Signed-off-by: Pierre CROKAERT <pct@crookies.net>
> ---
> I made all the modifications we discussed.
> I have also changed the kernel branch to use the latest branch maintained by Hardkernel.
> This patch also includes to replacement of boot.cmd by boot.ini.
> I think it is a better start to support the OdroidXU4 board.

I have applied to master, with the following changes:

    [Thomas:
     - Update DEVELOPERS file
     - Update .gitlab-ci.yml file
     - Simplify the boot.ini script
     - Add missing BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14 option
     - Add BR2_PACKAGE_HOST_DOSFSTOOLS and BR2_PACKAGE_HOST_MTOOLS since a
       VFAT filesystem is generated
     - Keep the default root filesystem size, since it is sufficient.
     - Reduce the size of the VFAT filesystem]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
