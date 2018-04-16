From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 14:52:28 +0200
Subject: [Buildroot] [PATCH] linux-firmware: support paths with subdirs
 in LINUX_FIRMWARE_DIRS
In-Reply-To: <20180415202245.8720-1-thomas.petazzoni@bootlin.com>
References: <20180415202245.8720-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180416145228.708ac9b0@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 22:22:45 +0200, Thomas Petazzoni wrote:
> Following commit cdb7876f63a253254b86637aaac8b255a426b60a
> ("linux-firmware: add Qualcomm video accelerator and GPU firmware
> options"), LINUX_FIRMWARE_DIRS can now contain entries with subdirs,
> such as "qcom/venus-1.8". Such entries are currently not supported by
> the logic in LINUX_FIRMWARE_INSTALL_DIRS.
> 
> Indeed the current logic consists in:
> 
>  - Removing the destination directory
>  - Copying to the destination directory
> 
> Unfortunately, the last step fails if a component of the path leading
> to the destination directory does not exist. To overcome this, we
> simply add the appropriate mkdir before the copy.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/54cbca90742faf486e59d95b95a0b0494e47b385/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/linux-firmware/linux-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
