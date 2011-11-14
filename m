From: =?UTF-8?Q?Jaroslav_Jir=C3=A1sek?= <jirasek@sauron.cz>
Date: Mon, 14 Nov 2011 23:29:46 +0100
Subject: [Buildroot] compile under buildroot
In-Reply-To: <CAAXf6LXQ3aVY2iEqfmD8E4AH-kiKJJXBFJa6Q9reYngSZ=_OjA@mail.gmail.com>
References: <B4FA196829E44A5AB99055A1E2166936@ch3mikPC>
 <CAAXf6LXQ3aVY2iEqfmD8E4AH-kiKJJXBFJa6Q9reYngSZ=_OjA@mail.gmail.com>
Message-ID: <b8c0f5683123f8187c9dc946bc9800a6@sauron.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Yes, I have enabled this options.

 The file "stubs.h" is nowhere in buildroot, but
 "/usr/lib/gcc/x86_64-unknown-linux-uclibc/4.3.6/include-fixed/features.h"
 point to this. From googling, it seems that this file is part from 
 glibc.

 Jarda


 On Mon, 14 Nov 2011 08:30:50 +0100, Thomas De Schampheleire wrote:
> Hi,
>
> 2011/11/13 Jaroslav Jir?sek <jirasek@sauron.cz>:
>> Hi, I build buildroot with all development tools, under CentOS 6.
>> Buildroot I unpack and chroot to this.
>>
>> Now I want compile something (for example busybox)
>> All attemps ends with this error:
>>
>> In file included from /usr/include/sys/types.h:27,
>> ???????????????? from scripts/basic/fixdep.c:105:
>> 
>> /usr/lib/gcc/x86_64-unknown-linux-uclibc/4.3.6/include-fixed/features.h:361:23:
>> error: gnu/stubs.h: No such file or directory
>
> Just taking a stab at it, but did you enable BR2_HAVE_DEVFILES ? It's
> under 'Build options, "development files in target filesystem".
>
>>
>> How can I solve this?
>>
>> Thank you Jarda
>
> Best regards,
> Thomas
