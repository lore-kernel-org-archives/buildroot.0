From: alex n <alexvm22@gmail.com>
Date: Thu, 22 Mar 2012 20:54:29 +0300
Subject: [Buildroot] bluez-utils 4.98 Configuring: error: D-Bus library
	is required
In-Reply-To: <4F6B03EB.1010502@visionsystems.de>
References: <CABpopuEqL7s31pZj9Qfj0v7pp1hYzfxYX8NazSKkOew6JK6NDw@mail.gmail.com>
 <4F6B03EB.1010502@visionsystems.de>
Message-ID: <CABpopuEsZ1_YG1MHVZeLMp2M9wrhfu9sH+uJWiOO++=fWLA64g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/3/22, Yegor Yefremov <yegor_sub1@visionsystems.de>:
> Am 21.03.2012 21:23, schrieb alex n:
>> Hi,
>>
>> I'm trying to compile bluez-utils but I get "error: D-Bus library is
>> required" while it configure. D-Bus checked in menuconfig and compiled
>> into /output/build/dbus-1.4.16 succesfully.
>> So how can I fix this error?
>>
>> Buildroot - 2012.02.
>
> Have no problems with compiling bluez-utils. Have you tried make clean;
> make? What architecture you're compiling for? What toolchain?
>

Thanks, make clean & make solved the problem but I met next error:

>>> bluez_utils 4.98 Building
....
src/main.c:36:26: error: sys/signalfd.h: No such file or directory
  CC     src/bluetoothd-rfkill.o
src/main.c: In function 'signal_handler':
src/main.c:261: error: storage size of 'si' isn't known
make[2]: *** [src/bluetoothd-main.o] Error 1
....
make[1]: Leaving directory
`/mnt/SK/ASNEE/BT/buildroot-2012.02/output/build/bluez_utils-4.98'
make: *** [/mnt/SK/ASNEE/BT/buildroot-2012.02/output/build/bluez_utils-4.98/.stamp_built]
Error 2

How can I fix the error?

Thanks,
Alex.
