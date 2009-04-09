From: Mike Sander <msander@cogeco.ca>
Date: Thu, 09 Apr 2009 10:15:31 -0400
Subject: [Buildroot] losetup /dev/loop0: No such device or address
In-Reply-To: <1239285149472382500@schweigstill.de>
References: <49DDFA04.8040904@cogeco.ca> <1239285149472382500@schweigstill.de>
Message-ID: <49DE0303.3070103@cogeco.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas Schweigstill wrote:
> Hello!
>
> Mike Sander  wrote:
>   
>> When I execute "losetup /dev/loop0 /mnt/flash/backing_file.vfat" i get 
>> the error "losetup /dev/loop0: No such device or address". 
>>     
>
>   
>> [...]
>>     
>
>   
>> /dev/loop0 definitely exists and appears to be correctly defined (I think).
>>     
>
> It just means that the device file exists which is independend of the kernel
> handler for block device (7,x).
>
> So you should check your Linux kernel configuration. Loopback device
> support has to be enabled in .config:
>
> CONFIG_BLK_DEV_LOOP=y
>   
Andreas, that was what I was missing. 
thanks.
> And in /sys/block also some entries have to be present, normally
> /sys/block/loop0 to /sys/block/loop7.
>
> Regards
> Andreas Schweigstill
>
>   
