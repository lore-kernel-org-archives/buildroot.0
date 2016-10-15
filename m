From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 22:59:28 +0200
Subject: [Buildroot] [PATCH] configs/lego_ev3: bump kernel to 4.4 series
In-Reply-To: <20161015165155.20004-1-vincent.stehle@laposte.net>
References: <d7af770a-9e6e-abfc-d034-1bb301c716e5@mind.be>
 <20161015165155.20004-1-vincent.stehle@laposte.net>
Message-ID: <20161015225928.4551f99a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 18:51:55 +0200, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
> Bump kernel revision used by lego_ev3_defconfig to the latest tag from
> ev3dev, as suggested by Peter. This is a 4.4 series kernel, which has the
> added benefit of not necessitating a specific gcc to boot.
> 
> We need a patch to create an empty drivers/lego/Kconfig file for the build
> to succeed though, as the ev3dev kernel normally expects a drivers tree to
> be checked out there.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Suggested-by: Peter Korsgaard <peter@korsgaard.com>

I've applied your patch to master, thanks!

One comment below, though.

>  Prepare your SDcard
>  ===================
>  
>  The following ?SD card layout is recommended:
>  
> -- First partition formated with a FAT filesystem, containing the uImage.
> +- First partition formatted with a FAT filesystem, containing the uImage.
>  - Second partition formatted as ext2 or ext3, containing the root filesystem.
>  
>  Create the SDcard partition table

It would be nice to use genimage here to automatically create a
complete SD card image.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
