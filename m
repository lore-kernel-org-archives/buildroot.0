From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 10:53:03 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
In-Reply-To: <87fuotya3r.fsf@dell.be.48ers.dk>
References: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
 <20160918193045.15a33be3@free-electrons.com>
 <87fuotya3r.fsf@dell.be.48ers.dk>
Message-ID: <20160921105303.1832ad5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 09:40:08 +0200, Peter Korsgaard wrote:

>  > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"  
> 
>  > I.e, isn't U-Boot consequently only working on the arm335x_evm
>  > platform? Or is the am335x_evm U-Boot configuration also usable for
>  > BeagleBone/BeagleBoneBlack?  
> 
> I believe so, yes. It afaik detects the board variant based on the
> content of an i2c eeprom.

Hum, OK.

>  > It seems that it's the case thanks to:  
> 
>  > CONFIG_OF_LIST="am335x-evm am335x-bone am335x-boneblack am335x-evmsk am335x-bonegreen am335x-icev2"  
> 
>  > in the U-Boot configuration. Can you confirm?  
> 
>  > If that's the case, then is the name of the defconfig really properly
>  > chosen? Should we remove beaglebone_defconfig in favor of a common
>  > defconfig for all am335x configurations?  
> 
>  > I'd say, either we name the defconfig am335x_evm_defconfig, and it
>  > should support only this board, or we name it am335x_defconfig and it
>  > supports multiple boards and replaces other AM335x defconfigs we
>  > already have.  
> 
> Well, it is only for the ti/circuitco boards, not any other boards with
> a am335x.
> 
> I still think naming the defconfig beaglebone_defconfig makes it easier
> to find for newcomers, even though it could also be used on the TI
> evm. People are also much more likely to have one of the beaglebone
> variants than the evm.

So maybe it's easier to have separate beaglebone_defconfig (for just
the beaglebone) and am335x_evm_defconfig (for just the EVM), without
trying to have a defconfig that handles multiple boards.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
