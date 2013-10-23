From: Sergey Alyoshin <alyoshin.s@gmail.com>
Date: Wed, 23 Oct 2013 16:47:36 +0400
Subject: [Buildroot] [PATCH 2/2] kobs-ng: test kernel version for
	redefines
In-Reply-To: <CAAXf6LU7amhD6DwXWCB9ArpSuGwiJaEonL8fPhZA84GN6SSnxw@mail.gmail.com>
References: <1382518620-26320-1-git-send-email-alyoshin.s@gmail.com>
 <1382518620-26320-2-git-send-email-alyoshin.s@gmail.com>
 <CAAXf6LU7amhD6DwXWCB9ArpSuGwiJaEonL8fPhZA84GN6SSnxw@mail.gmail.com>
Message-ID: <CAOxVtSTxv=ng4OQOptEepSCMKVh0sKOCgQV73P+71gy0uNQj7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 23, 2013 at 1:44 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Since you're changing a patch written by Paul Henson, I think you
> should add your Signed-off-by: line also after his, inside the patch.
> Otherwise it would seem that Paul Henson wrote your changes.

I will add it.

>> @@ -56,16 +56,15 @@ diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.c kobs-ng-3.0.35-4.0.0/src/mtd.c
>>  diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.h kobs-ng-3.0.35-4.0.0/src/mtd.h
>>  --- kobs-ng-3.0.35-4.0.0-orig/src/mtd.h        2012-12-17 22:37:40.000000000 -0800
>>  +++ kobs-ng-3.0.35-4.0.0/src/mtd.h     2013-07-28 19:33:57.000000000 -0700
>> -@@ -31,6 +31,14 @@
>> +@@ -31,6 +31,13 @@
>>   #include "BootControlBlocks.h"
>>   #include "rom_nand_hamming_code_ecc.h"
>>
>>  +// Newer kernel headers renamed define
>> -+#ifndef MTD_MODE_NORMAL
>> -+#define MTD_MODE_NORMAL MTD_FILE_MODE_NORMAL
>> -+#endif
>> -+#ifndef MTD_MODE_RAW
>> -+#define MTD_MODE_RAW MTD_FILE_MODE_RAW
>> ++#include <linux/version.h>
>> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 1, 0)
>
> Are you sure about this check?
> If I look at the Free Electrons LXR, linux 3.1 still used
> MTD_MODE_NORMAL, while 3.2 has MTD_FILE_MODE_NORMAL.
> http://lxr.free-electrons.com/source/include/mtd/mtd-abi.h?v=3.1
>
> I haven't checked the versions in between (3.1.1, 3.1.2, etc.).
> Could you verify what is the right check?

My mistake, git commit beb133fc165e1289c858d8f952b982b7d0b313cd is from 3.2.0,
not in any 3.1.x

Updated patch will be follow.
