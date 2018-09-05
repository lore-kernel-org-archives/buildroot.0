From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:48:37 +0200
Subject: [Buildroot] [PATCH 3/4] configs: bpi-m64: Use Mainline ARM ATF
In-Reply-To: <5ab06b35-1627-5669-6fc8-1f8ecbedabb7@arm.com>
References: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
 <1535963172-6664-3-git-send-email-jagan@amarulasolutions.com>
 <5ab06b35-1627-5669-6fc8-1f8ecbedabb7@arm.com>
Message-ID: <20180905234837.395a8e2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Sep 2018 10:06:40 +0100, Andre Przywara wrote:
> Hi,
> 
> On 03/09/18 09:26, Jagan Teki wrote:
> > Use Mainline ARM ATF for bananapi-m64 board instead
> > Andre's github.  
> 
> Have you tested it? The mainline ATF is not feature-complete yet, so in
> comparison to the old port you are missing the PMIC setup. This breaks
> power off and, more importantly, Ethernet support in U-Boot. I have some
> code to introduce proper (even better) PMIC support, just didn't come
> around to clean it up and post it.
> Meanwhile I would suggest to stick to the old port - actually this was
> the reason I didn't advertise this more widely yet.

So I guess this comment also applied to the Orangepi One Plus patch
(PATCH 2/4) in this series, since it also uses mainline ATF:

+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="cffb00342897ed73a2bb9fc7a1860102bd927f2e"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y

I've marked patches 2 to 4 in this series as Changes Requested.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
