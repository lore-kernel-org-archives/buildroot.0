From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 26 Jan 2010 15:23:18 +0000
Subject: [Buildroot] Where is mtd/mtd-user.h supposed to come from?
In-Reply-To: <hi5mi4$ngt$1@ger.gmane.org>
References: <hi55gi$ol6$1@ger.gmane.org> <hi5mi4$ngt$1@ger.gmane.org>
Message-ID: <4B5F08E6.9030301@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/2010 22:17, Grant Edwards wrote:
> On 2010-01-07, Grant Edwards<grant.b.edwards@gmail.com>  wrote:
>
>
>> The build of uboot's fw_env target tool is failing because
>> there is no mtd/mtd-user.h file.
>>
> Manually copying the mtd directory from the kernel headers into
> the toolchain /usr/include directory allows mtd stuff to build.
> I don't know how to get buildroot to do that when it's building
> a toolchain.
>
>

Rather belatedly I realise that I am seeing the same problem. When the 
kernel headers are installed I get mtd-user.h in 
toolchain/linux/include. Also when I build mtd-utils the header is in 
build/mtd_orig/include. However it does not get copied in 
staging/usr/include so any apps I write that use the header fail to compile.

I have previously fixed this my adding a rule that copies the headers 
from build/mtd_orig/include when the mtd package is built.

Is this a good way to do this? Why aren't all the kernel headers made 
available in staging/usr/include? How would anyone else fix this?

Thanks
Will
