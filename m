From: Kevin Tomary <kevin.tomary@hotmail.com>
Date: Tue, 10 Nov 2020 23:22:30 +0000
Subject: [Buildroot] WiFi-Problem STM32MP157C-DK2
Message-ID: <AM9PR10MB4563302E866A6B542E93CC3F82E90@AM9PR10MB4563.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello



Blocked ... I did everything to activate wifi but still nothing



Activated Broadcom FullMAC WLAN driver as module ( <M>)

Activated SDIO bus interface support for FullMAC driver

Activated wpa_supplicant dhcp etc ...



for the driver I

1- git clone git://github.com/murata-wireless/cyw-fmac-fw.git;protocol=https;nobranch=1;name=murata;destsuffix=murata<http://github.com/murata-wireless/cyw-fmac-fw.git;protocol=https;nobranch=1;name=murata;destsuffix=murata?fbclid=IwAR3JvX0p3DMqa0gAvlv_n7tDARn2J2h_o-bzy5nL5kBrm5MY_6DxFr8BdDw>

2- git checkout -b 8d87950bfad28c65926695b7357bd8995b60016a

3- got the .txt file from: https://github.com/STMicroelectronics/meta-st-stm32mp/blob/dunfell/recipes-kernel/linux-firmware/linux-firmware/brcmfmac43430-sdio.txt?fbclid=IwAR1KtSo4XzA8mV_tbL9ERkdBMduSwtbBed66_5tMDpq5D_wpFy69FSClC_s

4- copied files to ~/buildroot/output/target/lib/firmware/brcm where I have


brcmfmac43430-sdio.bin       brcmfmac43430-sdio.txt
brcmfmac43430-sdio.clm_blob



my brcm directory on my target device (STM32MP157C-DK2) also includes them


When I boot I get these errors


Could not read interface wlan0 flags: No such device

nl80211: Driver does not support authentication/association or connect commands
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
Could not read interface wlan0 flags: No such device
wlan0: Failed to initialize driver interface
FAIL
Starting dhcpcd...
no interfaces have a carrier
forked to background, child pid 171
Starting sshd: OK
Starting DHCP server: FAIL

Best Regards
Kevin



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201110/b618835f/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Wifi-STM32MP157C.zip
Type: application/x-zip-compressed
Size: 47375 bytes
Desc: Wifi-STM32MP157C.zip
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201110/b618835f/attachment-0001.bin>
