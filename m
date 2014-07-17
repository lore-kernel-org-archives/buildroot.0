From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 23:29:08 +0200
Subject: [Buildroot] git binary diffs are not supported
In-Reply-To: <53C83C74.5040708@posteo.de>
References: <53C665B1.6050609@posteo.de>
 <20140716152504.4bd10dbb@free-electrons.com>
 <53C83C74.5040708@posteo.de>
Message-ID: <20140717232908.6afb203f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 17 Jul 2014 23:13:24 +0200, J?rg Krause wrote:

> I have a board with NAND flash which locates the root filesystem as 
> UBIFS. I tried to load the device driver of the wifi device as a module 
> at boot time. The driver tries to read the firmware binary from rootfs, 
> but unfortunately the builtin UBIFS driver is loaded after this.

Hu? If your wifi driver is built as a module, then surely it gets
loaded *after* the root filesystem has been mounted: kernel modules are
files, so you cannot load them before the root filesystem is mounted.

Can you show your kernel .config file, as well as the complete boot log
of your platform?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
