From: psnsilva <psnsilva.stuff+nabble@gmail.com>
Date: Fri, 6 Jun 2014 06:46:28 -0700 (PDT)
Subject: [Buildroot] Check root file system at boot time
In-Reply-To: <20140605192113.GE3553@free.fr>
References: <1401897756168-71600.post@n4.nabble.com>
 <20140604170914.GA3325@free.fr> <1401963933710-71653.post@n4.nabble.com>
 <20140605192113.GE3553@free.fr>
Message-ID: <1402062388810-71727.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Analysing dmesg I have the following:
*[    2.035620] EXT4-fs (mmcblk0p2): INFO: recovery required on readonly
filesystem*
*[    2.042939] EXT4-fs (mmcblk0p2): write access will be enabled during
recovery*
[    2.113153] usb 1-1: new high-speed USB device number 2 using dwc_otg
[    2.119785] Indeed it is in host mode hprt0 = 00001101
[    2.333461] usb 1-1: New USB device found, idVendor=0424, idProduct=9514
[    2.341438] usb 1-1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    2.349484] hub 1-1:1.0: USB hub found
[    2.353421] hub 1-1:1.0: 5 ports detected
[    2.633280] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
*[    2.698021] EXT4-fs (mmcblk0p2): recovery complete*
*[    2.713363] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data
mode. Opts: (null)*
[    2.721530] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    2.729450] devtmpfs: mounted
[    2.732899] Freeing unused kernel memory: 136K (c0570000 - c0592000)
[    2.753632] usb 1-1.1: New USB device found, idVendor=0424,
idProduct=ec00
[    2.760523] usb 1-1.1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    2.771391] smsc95xx v1.0.4
*[    2.837447] EXT4-fs (mmcblk0p2): warning: maximal mount count reached,
running e2fsck is recommended*
[    2.846996] smsc95xx 1-1.1:1.0 eth0: register 'smsc95xx' at
usb-bcm2708_usb-1.1, smsc95xx USB 2.0 Ethernet, b8:27:eb:be:e9:89
[    2.861325] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered

So, as far I understood, despite the warning "maximal mount count reached,
running e2fsck is recommended", the SD card checking is actuality happening
(recovery complete)... Is it?



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Check-root-file-system-at-boot-time-tp71600p71727.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
