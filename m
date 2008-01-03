From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 03 Jan 2008 19:55:04 +0200
Subject: [Buildroot] Build error
In-Reply-To: <477D0F57.9050204@carallon.com>
References: <476A7DA6.7000102@carallon.com> <476A9199.4080900@promwad.com>
	<476BF768.3050201@carallon.com>
	<40135.127.0.0.1.1198453846.squirrel@localhost>
	<477D0F57.9050204@carallon.com>
Message-ID: <477D2178.80801@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

I have not used initramfs, usually qtopia and other large stuff (X.org / GTK ) is run
from jffs2 filesystem on flash, e.g rootfs is not in RAM but in flash.

Have you tried to adjust these kernel settings:
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=1
CONFIG_BLK_DEV_RAM_SIZE=14000
CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024

?

Regards,
Ivan


Will Wagner wrote:
> Ivan,
> 
> Thanks for your help. Think I have worked out the problem. Appeared to 
> have too large a rootfs so that the initramfs being built was very 
> large. Have worked round it for now by reducing the size of the rootfs 
> (qtopia4 was copying some unneeded files).
> 
> Any idea what the size limit is for a rootfs used with initramfs?
> 
> Thanks,
> 
> Will.
> 
> Ivan Kuten wrote:
>>> Thanks for the hint.
>>>
>>> I have compiled both with and without qtopia4 and got the verbose log. I
>>> can not see any difference on what is on the command line between the
>>> two versions.
>>>
>> Will,
>>
>> I can suggest as workaround to set BR2_KERNEL_none=y
>> and build kernel outside a buildroot tree and see if it working this way.
>>
>> Regards,
>> Ivan
> 


-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
