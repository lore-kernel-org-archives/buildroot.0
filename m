From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 21 Apr 2016 18:19:49 +0200
Subject: [Buildroot] [RPi3] Trying to test WiFi On Raspberr Pi 3
Message-ID: <CALtfCQYZXSFWSv8m5y+BkwKx-iOPrgYpZypvmtk_i2MLZebeiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'm trying to check the broadcom WiFi module BCM43438 of the RPi3B. By
default the package:

Target Package --> Hardware handling  ---> Firmware  ---> linux-firmware
---> Ethernet firmware  ---> Broadcom BRCM bcm43xxx

It's not selected. But when I select this package, I've got this error:

# dmesg | grep brcm
[    7.127904] brcmfmac: brcmf_sdio_drivestrengthinit: No SDIO Drive
strength init done for chip 43430 rev 1 pmurev 24
[    7.145814] usbcore: registered new interface driver brcmfmac
[    7.162030] brcmfmac_sdio mmc1:0001:1: Direct firmware load for
brcm/brcmfmac43430-sdio.bin failed with error -2
[    8.186873] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50
[    9.215286] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50

So I noticed that the binary brcmfmac43430-sdio.bin and
brcmfmac43430-sdio.txt it isn't copy by the linux-firmware package to
/lib/firmware/brcm folder, so I've tried to copy the files
brcmfmac43430-sdio.* manually  to /lib/firmware/brcm (I should be a great
idea to add this files to the linux-firmaware package) and now I didn't get
any error:

[    7.101997] brcmfmac: brcmf_sdio_drivestrengthinit: No SDIO Drive
strength init done for chip 43430 rev 1 pmurev 24
[    7.120006] usbcore: registered new interface driver brcmfmac
[    8.165326] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50
[    9.195054] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50
[   10.217086] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50

But I can see the wlan0 device. I list the folder :

# ls  /sys/class/net/
eth0  lo

And the wlan0 doesn't appear.

I've tried this command:

# iw dev wlan0 set
command failed: No such device (-19)

Does anyone know how can I solve this problem?


Best regards.

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160421/77bb7dac/attachment.html>
