From: Kevin Golding <kevin@kgolding.co.uk>
Date: Fri, 18 Sep 2015 12:07:04 +0100
Subject: [Buildroot] Olimex A20 Micro - freezing during boot up
In-Reply-To: <55FB4085.4020107@mind.be>
References: <55F9808D.1020809@kgolding.co.uk> <55FB4085.4020107@mind.be>
Message-ID: <55FBF058.3000100@kgolding.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for the reply. You were right about the hardware, I got a 
second board and it boots up without those errors so my first board must 
have a fault on it.

Many thanks,

Kevin Golding


On 17/09/2015 23:36, Arnout Vandecappelle wrote:
> On 16-09-15 16:45, Kevin Golding wrote:
>> Hello,
>>
>> I've created a system based on the olimex_a20_olinuxino_micro_defconfig
>   When you say "based on", do you mean "equal to"? If not, go back to the
> defconfig and check if that works. Don't hold your breath, though - see below.
>
>
>> and I'm
>> seeing it freeze at around 1.2 seconds during the boot up.
>>
>> I'm a little worried about some of the errors during the boot such as "Failed to
>> set core voltage! Can't set CPU frequency"
>   This is potentially harmful.
>
>> "*** Warning - bad CRC, using default environment"
>   This is quite harmless: U-Boot tries to read the environment from flash, but
> it's not there (yet) because you never saved it.
>
>> but as a complete newbie I'm not sure how important they are!
>>
>> I've copied the serial capture below, and I would love to get my hands of
>> someone's working equivalent to compare against, or any suggestions/advice?
>>
>> Thanks,
>>
>> Kevin
>>
>> --------------------------- Serial capture below -------------------------------
>>
>> U-Boot SPL 2015.04 (Sep 16 2015 - 09:57:21)
>> DRAM: 1024 MiB
>> Failed to set core voltage! Can't set CPU frequency
>>
>>
> [snip]
>> [    1.073035] axp20x 0-0034: AXP20x variant AXP209 found
>> [    1.078689] axp20x 0-0034: Failed to set masks in 0x40: -6
>> [    1.084264] axp20x 0-0034: failed to add irq chip: -6
>   This looks potentially problematic. The AXP is the PMIC, i.e. the thing that
> regulates the voltages to your CPU. If that thing is not working correctly,
> things go very bad.
>
>> [    1.092777] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16 sec,
>> nowayout=0)
>> [    1.101056] Driver 'mmcblk' needs updating - please use bus_type methods
>> [    1.108745] sunxi-mmc 1c0f000.mmc: No vqmmc regulator found
>> [    1.114990] sunxi-mmc 1c0f000.mmc: Got CD GPIO
>> [    1.150750] sunxi-mmc 1c0f000.mmc: base:0xf00b8000 irq:27
>> [    1.157146] sunxi-mmc 1c12000.mmc: No vqmmc regulator found
>> [    1.163483] sunxi-mmc 1c12000.mmc: Got CD GPIO
>> [    1.200758] sunxi-mmc 1c12000.mmc: base:0xf00bc000 irq:28
>> [    1.208924] usbcore: registered new interface driver usbhid
>> [    1.214589] usbhid: USB HID core driver
>> [    1.220243] TCP: cubic registered
>> [    1.223677] NET: Registered protocol family 17
>> [    1.228168] mmc0: host does not support reading read-only switch, assuming
>> write-e
>   It's even stopping in the middle of a printk...
>
>   Smells to me like a hardware issue: insufficient current or possibly even
> overheating. Do you have another board to test?
>
>   Regards,
>   Arnout
>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150918/28e05cc3/attachment.html>
