From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Nov 2018 17:40:08 +0100
Subject: [Buildroot] [PATCH next 4/5]
 configs/solidrun_macchiatobin_mainline: bump kernel and U-Boot
In-Reply-To: <2ef4e9d2b5fff465da879d99e412437ea7109b66.1542720610.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 20 Nov 2018 15:30:09 +0200")
References: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
 <2ef4e9d2b5fff465da879d99e412437ea7109b66.1542720610.git.baruch@tkos.co.il>
Message-ID: <87h8g9m5g7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Bump U-Boot to version 2018.11. This version supports autodetection of
 > SD/eMMC boot source, so we can now enable environment load from SD card.
 > Add a U-Boot kconfig fragment that sets SD/eMMC as environment load/save
 > device. This avoids stale environment values from the SPI flash. That in
 > turn, allows to use the more convenient distro boot which is enabled in
 > the default environment.

 > Bump kernel to version 4.19.2. This version enables
 > CONFIG_PHY_MVEBU_CP110_COMPHY in the arm64 defconfig, so remove it from
 > the kernel kconfig fragment. Enable support for SFP modules detection
 > and configuration. Leave the PHY drivers for now to keep them built into
 > the kernel. The kernel defconfig builds these drivers as modules. But
 > that does not work as expected in the default configuration.

 > Cc: Sergey Matyukevich <geomatsi@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
