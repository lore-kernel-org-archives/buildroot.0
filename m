From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 11:23:30 +0200
Subject: [Buildroot] how to make the Buildroot embedded linux file
 system persistence?
In-Reply-To: <5417F84B.8050705@yahoo.com>
References: <5417F84B.8050705@yahoo.com>
Message-ID: <20140916112330.40118c9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Amir,

On Tue, 16 Sep 2014 13:13:55 +0430, Amir wrote:

> I have built an embedded linux using buildroot. after generating 
> rootfs.tar file system, I have tested the embedded linux and figured out 
> that every change I made to the linux is not taking place after reboot.
> 
> my question is: how to enable buildroot linux to have a persistence file 
> system and can save changes?
> 
> I have generated: rootfs.tar , rootfs.cpio , bzImage of kernel.

Which one are you using? If you've generated a rootfs.cpio, maybe
you've enabled the initramfs option, which as its name suggest is a
filesystem in RAM, which explains why your changes disappear after a
reboot.

Use a filesystem stored on persistent storage, such as a SD card, eMMC,
NAND flash or USB key.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
