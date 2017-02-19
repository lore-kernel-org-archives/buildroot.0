From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:23:15 +0100
Subject: [Buildroot] [PATCH next] board: add support for nexbox a95x
In-Reply-To: <20170217163310.6929-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 17 Feb 2017 17:33:10 +0100")
References: <20170217163310.6929-1-peter@korsgaard.com>
Message-ID: <874lzprfak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Nexbox A95X is a low cost Android STB based around an Amlogic s905(x) SoC
 > (quad A53), 8/16GB eMMC and 1/2GB RAM.

 > Both the s905 (gxbb) and s905x (gxl) variant is supported.

 > This defconfig uses mainline Linux.  As the mainline support for s905 is
 > quite young, use the latest release candidate.  There is currently no
 > support for this board in U-Boot or sources available for the vendor U-Boot,
 > so the defconfig doesn't build a u-boot and instead uses the existing U-Boot
 > available in the eMMC.  This also means that we need to wrap the kernel as
 > uImage, which isn't suppported for aarch64.  Instead this is done in the
 > post-build script.

 > Mainline aarch64 defconfig builds most drivers modular, so add mdev for
 > module autoloading.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to next after explicitly setting BR2_cortex_a53=y in the
defconfig.

-- 
Bye, Peter Korsgaard
