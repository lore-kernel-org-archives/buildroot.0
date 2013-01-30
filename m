From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jan 2013 07:15:59 -0300
Subject: [Buildroot] can not open ttyUSB0
In-Reply-To: <5108E108.2020801@linkwisetech.com>
References: <mailman.83869.1359534753.32592.buildroot@busybox.net>
 <5108E108.2020801@linkwisetech.com>
Message-ID: <5108F2DF.7030805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/30/2013 05:59 AM, Adeel Nafis wrote:

> scsi 4:0:0:0: CD-ROM            HUAWEI   Mass Storage     2.31 PQ: 0
> ANSI: 2
> scsi 5:0:0:0: Direct-Access     HUAWEI   MMC Storage      2.31 PQ: 0
> ANSI: 2
> usb-storage: device scan complete
> sd 5:0:0:0: Attached scsi removable disk sda
> usb-storage: device scan complete
> 
> there is no symlink for /sys/class/tty/ttyUSB0, so I guess this
> indicates that there is a missing driver, but which one? I have also
> tried doing the following
> 
> modprobe usbserial vendor=0x12d1 product=0x1446
> 
> but it makes no difference.

Huawei modems usually require the "option" module in the kernel
(CONFIG_USB_SERIAL_OPTION). Do you have it enabled and loaded?
Regards.
