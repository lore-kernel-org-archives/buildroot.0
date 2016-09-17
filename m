From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 17 Sep 2016 12:59:16 +0200
Subject: [Buildroot] [PATCH] linux-firmware: bump version
In-Reply-To: <87intuc2y2.fsf@dell.be.48ers.dk>
References: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
 <87poo4dilz.fsf@dell.be.48ers.dk>
 <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar>
 <02eb48ef-5659-9364-a55c-6f9c17ca0a82@je-eigen-domein.nl>
 <87intuc2y2.fsf@dell.be.48ers.dk>
Message-ID: <88a0238b-6ec3-d1d4-a8c7-6084ece071eb@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/2016 11:04 AM, Peter Korsgaard wrote:
>   > On 09/16/2016 07:54 PM, Gustavo Zacarias wrote:
>   >> On 2016-09-15 17:16, Peter Korsgaard wrote:
>   >>
>   >>> Committed, thanks.
>   >>>
>   >>> Will you send a patch to add BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX to
>   >>> the rpi3 defconfig?
>   >>
>   >> Hi.
>   >> Well, without some $WiFi package (hostapd, wpa_supplicant,
>   >> wireless-tools) just copying the firmware serves no purpose, though
>   >> it can be done for completeness.
>   >> That being said, i lack a rpi3.
>
>   > And unless that changed recently, just the .bin the patch added
>   > wouldn't be sufficient for Pi 3.
>   > Also need:
>   > https://github.com/RPi-Distro/firmware-nonfree/blob/master/brcm80211/brcm/brcmfmac43430-sdio.txt
>
> Hmm, perhaps. Do you have a rpi 3 to test on? The linux-firmware commit
> doesn't mention anything about it:
>
> http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/commit/?id=c4c07a8d1128d50a5c2885ceea1abbebaa82f820

==
[    6.785594] usbcore: registered new interface driver brcmfmac
[    6.786851] brcmfmac_sdio mmc1:0001:1: Direct firmware load for 
brcm/brcmfmac43430-sdio.txt failed with error -2
[    7.789831] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): 
clkctl 0x50
[    8.802492] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): 
clkctl 0x50
==

Again, maybe they changed things very recently in a newer kernel branch 
or something.
But it simply does not work with the standard rpi one unless you also 
have the .txt


Yours sincerely,

Floris Bos
