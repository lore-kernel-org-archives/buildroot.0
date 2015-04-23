From: Santhosh Ramani <srcoolz@gmail.com>
Date: Wed, 22 Apr 2015 22:44:56 -0500
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <CADKZYYJrtTdn_47NCJumggetKmoHt7sAbk5-a9X_zHrMVJdYHA@mail.gmail.com>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
 <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
 <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
 <20150418143654.021fa104@free-electrons.com>
 <CADKZYYJrtTdn_47NCJumggetKmoHt7sAbk5-a9X_zHrMVJdYHA@mail.gmail.com>
Message-ID: <CADKZYYLdSRXNoRp6OPaYDuAi16fB93Rwj-NTHmi=JiBTsYgaKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

This is the output I get from the udevadm monitor

# udevadm monitor
monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

KERNEL[4574.108256] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1 (usb)
KERNEL[4574.114729] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0
(usb)
KERNEL[4574.116502] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4
(scsi)
KERNEL[4574.116755] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/scsi_host/host4
(scsi_host)
UDEV  [4574.128129] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1 (usb)
UDEV  [4574.134332] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0
(usb)
UDEV  [4574.136982] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4
(scsi)
UDEV  [4574.141432] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/scsi_host/host4
(scsi_host)
KERNEL[4575.112353] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0
(scsi)
KERNEL[4575.114159] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0
(scsi)
KERNEL[4575.115028] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/scsi_disk/4:0:0:0
(scsi_disk)
KERNEL[4575.119508] add      /devices/virtual/bdi/8:0 (bdi)
KERNEL[4575.126051] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/scsi_device/4:0:0:0
(scsi_device)
KERNEL[4575.132346] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/block/sda
(block)
KERNEL[4575.132908] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/block/sda/sda1
(block)
UDEV  [4575.137353] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0
(scsi)
UDEV  [4575.145704] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0
(scsi)
UDEV  [4575.155363] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/scsi_disk/4:0:0:0
(scsi_disk)
UDEV  [4575.159306] add      /devices/virtual/bdi/8:0 (bdi)
UDEV  [4575.171496] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/scsi_device/4:0:0:0
(scsi_device)
UDEV  [4575.427571] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/block/sda
(block)
UDEV  [4576.767773] add
/devices/ocp.2/47400000.usb/47401400.usb/musb-hdrc.0.auto/usb1/1-1/1-1:1.0/host4/target4:0:0/4:0:0:0/block/sda/sda1
(block)

Thank you
Regards

Santhosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150422/bb8a1f96/attachment.html>
