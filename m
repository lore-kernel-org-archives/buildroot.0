From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:39:01 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add missing
 qstrip
In-Reply-To: <DM6PR01MB584983C3A449D028309B3DACF3180@DM6PR01MB5849.prod.exchangelabs.com>
 (Francois Gervais's message of "Tue, 11 Feb 2020 20:22:00 +0000")
References: <DM6PR01MB584983C3A449D028309B3DACF3180@DM6PR01MB5849.prod.exchangelabs.com>
Message-ID: <87v9ochhq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gervais," == Gervais, Francois <FGervais@distech-controls.com> writes:

 > Add missing qstrip wrapping to the new
 > BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS option.

 > Signed-off-by: Francois Gervais <fgervais@distech-controls.com>

Committed, thanks.

Notice that something in your mailer has corrupted the patch by
converting tabs to spaces. Consider using git send-email / a different
mail server in the future.

 > ---
 >  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > index bf1ac46cf6..34737018aa 100644
 > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > @@ -140,7 +140,7 @@ endef
 >  endif

 >  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
 > -       $(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS)
 > +       $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))

 >  define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 >         $(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 > -- 
 > 2.20.1
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
