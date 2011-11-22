From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Tue, 22 Nov 2011 11:28:46 +0100
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <20111121210817.5eddecc0@skate>
References: <4ECA36CB.5010803@neotion.com> <1321879312.2085.18.camel@sven>
 <20111121134405.02151918@skate> <4ECA8C28.1020306@neotion.com>
 <20111121210817.5eddecc0@skate>
Message-ID: <4ECB795E.90607@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/21/2011 09:08 PM, Thomas Petazzoni wrote:

>> I enabled mdev with loading firmware support and added a S30mdev file
>> in init.d with mount -t tmpfs -o size=64k,mode=0755 tmpfs /dev
>>         echo /sbin/mdev > /proc/sys/kernel/hotplug
>>         mdev -s
> 
> All these steps are done automatically by Buildroot, if you select
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV.
> 

Oh that's right, I enabled mdev in busybox but didn't noticed that it appeared also in buildroot's menu. Thanks :)
Note: I had to enable initramfs

>> The "irq 7: nobody cared" error is still there though. It was not
>> related after all. Any idea about that ?
> 
> Buggy driver or hardware. Find out which device corresponds to IRQ 7,
> and then if a driver is supposed to manage this device or not.
> 

uhci_hcd 0000:00:1d.2: PCI INT C -> Link[LNKC] -> GSI 7 (level, low) -> IRQ 7
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1d.2: irq 7, io base 0x0000f040

there are 4 of them, 2 of which use IRQ 11 and the last one IRQ 10.

The UHCI driver is selected in linux's configuration.

regards,

-- 
Emmanuel
