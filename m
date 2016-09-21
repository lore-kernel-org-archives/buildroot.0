From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 09:40:08 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
In-Reply-To: <20160918193045.15a33be3@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 18 Sep 2016 19:30:45 +0200")
References: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
 <20160918193045.15a33be3@free-electrons.com>
Message-ID: <87fuotya3r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 15 Aug 2016 13:51:22 +0200, Lothar Felten wrote:
 >> This patch adds a target config for the ti am335x-evm based on the AM335x CPU.
 >> It also supports the beaglebone and beagleboneblack.

 > How can it support also the BeagleBone and BeagleBoneBlack when the
 > U-Boot is configured with:

 > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"

 > I.e, isn't U-Boot consequently only working on the arm335x_evm
 > platform? Or is the am335x_evm U-Boot configuration also usable for
 > BeagleBone/BeagleBoneBlack?

I believe so, yes. It afaik detects the board variant based on the
content of an i2c eeprom.

 > It seems that it's the case thanks to:

 > CONFIG_OF_LIST="am335x-evm am335x-bone am335x-boneblack am335x-evmsk am335x-bonegreen am335x-icev2"

 > in the U-Boot configuration. Can you confirm?

 > If that's the case, then is the name of the defconfig really properly
 > chosen? Should we remove beaglebone_defconfig in favor of a common
 > defconfig for all am335x configurations?

 > I'd say, either we name the defconfig am335x_evm_defconfig, and it
 > should support only this board, or we name it am335x_defconfig and it
 > supports multiple boards and replaces other AM335x defconfigs we
 > already have.

Well, it is only for the ti/circuitco boards, not any other boards with
a am335x.

I still think naming the defconfig beaglebone_defconfig makes it easier
to find for newcomers, even though it could also be used on the TI
evm. People are also much more likely to have one of the beaglebone
variants than the evm.

-- 
Bye, Peter Korsgaard
