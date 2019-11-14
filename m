From: no-one-you-know <octomp@protonmail.com>
Date: Thu, 14 Nov 2019 15:28:31 +0000
Subject: [Buildroot] USB on rock64
Message-ID: <Jrdyl_Hac9BdPOhYDWt4FafgynThsUwezL988o5hous9u1y2phHJn7RMUehQbousCfsFYXHqbVjj4ZHFSvj2GApa6f2ZNcnkUFIkzlcb5io=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hopefully it's OK to send generic questions here.
I've built an image (glibc/systemv/eudev) for my Rock64 and according to the announcement on this mailing list USB should be working.

And according to dmesg and lsusb, it is (as far as I can tell):

# dmesg|grep -i usb
[    0.214216] usbcore: registered new interface driver usbfs
[    0.214315] usbcore: registered new interface driver hub
[    0.214416] usbcore: registered new device driver usb
[    0.370304] dwc2 ff580000.usb: ff580000.usb supply vusb_d not found, using dummy regulator
[    0.371105] dwc2 ff580000.usb: Linked as a consumer to regulator.0
[    0.371660] dwc2 ff580000.usb: ff580000.usb supply vusb_a not found, using dummy regulator
[    0.385485] dwc2 ff580000.usb: DWC OTG Controller
[    0.385935] dwc2 ff580000.usb: new USB bus registered, assigned bus number 1
[    0.386593] dwc2 ff580000.usb: irq 26, io mem 0xff580000
[    0.387932] hub 1-0:1.0: USB hub found
[    0.389294] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.393296] ehci-platform ff5c0000.usb: EHCI Host Controller
[    0.393846] ehci-platform ff5c0000.usb: new USB bus registered, assigned bus number 2
[    0.394921] ehci-platform ff5c0000.usb: irq 27, io mem 0xff5c0000
[    0.409477] ehci-platform ff5c0000.usb: USB 2.0 started, EHCI 1.00
[    0.410839] hub 2-0:1.0: USB hub found
[    0.412098] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.414038] ohci-platform ff5d0000.usb: Generic Platform OHCI controller
[    0.414655] ohci-platform ff5d0000.usb: new USB bus registered, assigned bus number 3
[    0.415676] ohci-platform ff5d0000.usb: irq 28, io mem 0xff5d0000
[    0.478393] hub 3-0:1.0: USB hub found
[    0.480137] usbcore: registered new interface driver usb-storage
[    0.590386] usbcore: registered new interface driver usbhid
[    0.590882] usbhid: USB HID core driver

# lsusb
Bus 003 Device 001: ID 1d6b:0001
Bus 002 Device 001: ID 1d6b:0002
Bus 001 Device 001: ID 1d6b:0002

But when I plug a USB flash drive in, nothing is detected.  Both lsusb and re-running dmesg show no change - like nothing is there

Is this something I've left out of the 'target packages' selection?  How can I troubleshoot this further?

Thanks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191114/c56431c6/attachment.html>
