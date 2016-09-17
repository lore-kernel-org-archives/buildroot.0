From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Sep 2016 11:04:21 +0200
Subject: [Buildroot] [PATCH] linux-firmware: bump version
In-Reply-To: <02eb48ef-5659-9364-a55c-6f9c17ca0a82@je-eigen-domein.nl> (Floris
 Bos's message of "Fri, 16 Sep 2016 20:11:17 +0200")
References: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
 <87poo4dilz.fsf@dell.be.48ers.dk>
 <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar>
 <02eb48ef-5659-9364-a55c-6f9c17ca0a82@je-eigen-domein.nl>
Message-ID: <87intuc2y2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 > On 09/16/2016 07:54 PM, Gustavo Zacarias wrote:
 >> On 2016-09-15 17:16, Peter Korsgaard wrote:
 >> 
 >>> Committed, thanks.
 >>> 
 >>> Will you send a patch to add BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX to
 >>> the rpi3 defconfig?
 >> 
 >> Hi.
 >> Well, without some $WiFi package (hostapd, wpa_supplicant,
 >> wireless-tools) just copying the firmware serves no purpose, though
 >> it can be done for completeness.
 >> That being said, i lack a rpi3.

 > And unless that changed recently, just the .bin the patch added
 > wouldn't be sufficient for Pi 3.
 > Also need:
 > https://github.com/RPi-Distro/firmware-nonfree/blob/master/brcm80211/brcm/brcmfmac43430-sdio.txt

Hmm, perhaps. Do you have a rpi 3 to test on? The linux-firmware commit
doesn't mention anything about it:

http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/commit/?id=c4c07a8d1128d50a5c2885ceea1abbebaa82f820

But the kernel does reference the .txt file as well:

drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:BRCMF_FW_NVRAM_DEF(43430, "brcmfmac43430-sdio.bin", "brcmfmac43430-sdio.txt");

-- 
Bye, Peter Korsgaard
