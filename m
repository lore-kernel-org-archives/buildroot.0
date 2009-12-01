From: Joachim Pihl <jpihl@nevion.com>
Date: Tue, 1 Dec 2009 09:57:40 +0100
Subject: [Buildroot] More build trouble (2009.11-rc1)
In-Reply-To: <200911300812.04214.minimod@morethan.org>
References: <op.u37m8yxayqa4qb@jap-lappis>
	<200911300812.04214.minimod@morethan.org>
Message-ID: <op.u384iejxyqa4qb@jap-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Nov 2009 15:12:01 +0100, Michael S. Zick <minimod@morethan.org>  
wrote:

> Buildroot maintainers;
>
> Please promote this one on your triage list,
> I will be needing gd in my system also (mips, not arm).
>
> Mike
>>
>> /opt/xscale-toolchain/usr/bin/arm-linux-uclibcgnueabi-gcc -Os -pipe -Os
>> -I/opt/xscale-toolchain/usr/include -I/opt/xscale-toolchain/include
>> --sysroot=/opt/xscale-toolchain/ -isysroot /opt/xscale-toolchain
>> -mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float -o
>> .libs/gdparttopng gdparttopng.o  -L/opt/xscale-toolchain/usr/lib
>> -L/usr/lib ./.libs/libgd.so /opt/xscale-toolchain/usr/lib/libpng12.so
>> -L/opt/xscale-toolchain/lib -lz -lm -Wl,--rpath
>> -Wl,/opt/xscale-toolchain/usr/lib
>> ./.libs/libgd.so: undefined reference to `__isoc99_sscanf'

This updated makefile seems to fix the problem. Defining _GNU_SOURCE to  
avoid redirection of sscanf to __isoc99_sscanf. It may not be The Right  
Thing (TM), but at least it seems to work.


-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libgd.mk
Type: application/octet-stream
Size: 2565 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091201/316de68b/attachment.obj>
