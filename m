From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 09:22:17 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: install missing
 firmware files for rtlwifi
In-Reply-To: <1515367214-4788-1-git-send-email-rom.reignier@gmail.com> (Romain
 Reignier's message of "Mon, 8 Jan 2018 00:20:14 +0100")
References: <1515367214-4788-1-git-send-email-rom.reignier@gmail.com>
Message-ID: <87k1wiqkli.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Reignier <rom.reignier@gmail.com> writes:

 > All the rtlwifi firmware files were not installed, so added the
 > missing ones.

 > Signed-off-by: Romain Reignier <rom.reignier@gmail.com>
 > ---
 >  package/linux-firmware/linux-firmware.mk | 15 ++++++++++++---
 >  1 file changed, 12 insertions(+), 3 deletions(-)

 > diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
 > index b636f79..93d3a34 100644
 > --- a/package/linux-firmware/linux-firmware.mk
 > +++ b/package/linux-firmware/linux-firmware.mk
 > @@ -70,7 +70,9 @@ LINUX_FIRMWARE_FILES += \
 >  	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin \
 >  	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin \
 >  	rtlwifi/rtl8192cufw_A.bin \
 > -	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin
 > +	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin \
 > +	rtlwifi/rtl8192eefw.bin rtlwifi/rtl8192eu_ap_wowlan.bin \
 > +	rtlwifi/rtl8192eu_nic.bin rtlwifi/rtl8192eu_wowlan.bin

Committed, thanks.

Wouldn't it make more sense to rework this with wildcards to not have
such issues in the future?

E.G. rtlwifi/rtl81*.bin

-- 
Bye, Peter Korsgaard
