From: Julien Olivain <ju.o@free.fr>
Date: Thu, 12 Nov 2020 12:07:54 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-backports: bump version
 to 5.8
In-Reply-To: <20201111214755.GB28486@pevik>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201111162208.362275-2-ju.o@free.fr> <20201111214755.GB28486@pevik>
Message-ID: <1f5c99ba70202243acf5d21dec213a4f@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

Thanks for the review!

On 11/11/2020 22:47, Petr Vorel wrote:
> Hi Julien,
> 
>> Attempting to compile this package with newer Kernel version (e.g. 
>> v5.4)
>> fails with message:
> 
>>    Generating local configuration database from kernel ...Kernel 
>> version parse failed!
> 
>> Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
>> rather old and beat the very purpose of having newer drivers in older
>> kernels.
> 
> ...
>> -LINUX_BACKPORTS_VERSION_MAJOR = 4.4.2
>> +LINUX_BACKPORTS_VERSION_MAJOR = 5.8
>>  LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
>>  LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
>>  LINUX_BACKPORTS_SITE = 
>> $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
> ...
> 
> Thanks for updating to the latest stable release.
> 
> I haven't found any info about minimal kernel version required.
> Looking briefly into the code, it still supports 3.0
> (LINUX_VERSION_IS_GEQ(3,0,0))
> => nothing has changed.

I initially though like you there was no change in the minimal kernel 
version.
Looking a bit deeper, it appear that the minimal Kernel requirement 
changed
from 3.0 to 3.10, in [1], introduced in backports tag v4.14-rc4-1.

I'll update the patch to add a note about that.

Best regards,

Julien.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/commit/?id=a0d05f9f9ca50ea8b1d60726fac6b54167257e76


> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> 
> Kind regards,
> Petr
