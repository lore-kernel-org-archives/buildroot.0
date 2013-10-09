From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 17:36:02 +0200
Subject: [Buildroot] Booting problem for Beaglebone
In-Reply-To: <52557301.8090808@univ-st-etienne.fr>
References: <52551F22.9090801@univ-st-etienne.fr>
 <20131009135501.7a2df2f7@skate>
 <52557301.8090808@univ-st-etienne.fr>
Message-ID: <20131009173602.3e9371d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear AUBERT alain,

On Wed, 09 Oct 2013 17:15:13 +0200, AUBERT alain wrote:

> We have already done all steps of the building as you indicated in your mail
> 
> The 2 partitions are visible in Uboot with correct pararmeters.
> We have done fatls mmc 0:1 and ext2ls mmc 0:2 to see the contents
> 
> Moreover, we have done the same operation with buildroot 2012.05 and the 
> beaglebone board works fine
> 
> It seems that the problem comes from the use of Flattened devices tree 
> in the new version of buildroot
> 
> You can find the bootlog in the attached file

I am not following closely the BeagleBone kernels, but from the boot
log it seems like the MMC card is not detected. Several possibilities:

 * The MMC support is not enabled in the kernel configuration, or the
   proper MMC driver.

 * The MMC device is not described in the Device Tree and/or the
   support for MMC on this platform is not available.

The version of the kernel being displayed is just 3.8.11, which
indicates a mainline kernel (which doesn't support MMC on AM335x, as
far as I know). However, our beaglebone_defconfig uses a TI custom
kernel, which I believe, should show probably show a different kernel
version than just 3.8.11.

Can you send us your Buildroot .config file?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
