From: alex n <alexvm22@gmail.com>
Date: Thu, 22 Mar 2012 21:57:29 +0300
Subject: [Buildroot] bluez-utils 4.98 Configuring: error: D-Bus library
	is required
In-Reply-To: <20120322182019.GA3380@tarshish>
References: <CABpopuEqL7s31pZj9Qfj0v7pp1hYzfxYX8NazSKkOew6JK6NDw@mail.gmail.com>
 <4F6B03EB.1010502@visionsystems.de>
 <CABpopuEsZ1_YG1MHVZeLMp2M9wrhfu9sH+uJWiOO++=fWLA64g@mail.gmail.com>
 <20120322182019.GA3380@tarshish>
Message-ID: <CABpopuGHvAL1pFPxqsHS9MV-ANXsV1BXXAiDs84zUP1KC05WWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/3/22, Baruch Siach <baruch@tkos.co.il>:
>> >>> bluez_utils 4.98 Building
>> ....
>> src/main.c:36:26: error: sys/signalfd.h: No such file or directory
>>   CC     src/bluetoothd-rfkill.o
>> src/main.c: In function 'signal_handler':
>> src/main.c:261: error: storage size of 'si' isn't known
>> make[2]: *** [src/bluetoothd-main.o] Error 1
>> ....
>> make[1]: Leaving directory
>> `/mnt/SK/ASNEE/BT/buildroot-2012.02/output/build/bluez_utils-4.98'
>> make: ***
>> [/mnt/SK/ASNEE/BT/buildroot-2012.02/output/build/bluez_utils-4.98/.stamp_built]
>> Error 2
>>
>> How can I fix the error?
>
> The signalfd() system call is only available since kernel version 2.6.22.
> Your
> toolchain seems to be based on older kernel headers. So you need to update
> to
> a newer toolchain.
>
> baruch

Hi Baruch,

You are right if I use arm-2009q1 instead arm-2007q1 bluez is compiled
without any error.s

Thanks,
Alex.
