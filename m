From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 25 Aug 2007 15:46:15 +0300 (EEST)
Subject: [Buildroot] building tiny-x or x11R7 with latest snapshot
In-Reply-To: <12306984.post@talk.nabble.com>
References: <022b01c7e35f$9df9f1b0$2600a8c0@engineering5>
	<0ad801c7e382$8bb6dfe0$dcc4af0a@atmel.com>
	<12306984.post@talk.nabble.com>
Message-ID: <39814.127.0.0.1.1188045975.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I managed to build cairo, pango and gtk2 but with dependency on DirectFB - I need
to modify flags to configure and dependencies. TinyX is buildable but seems only
gtk-1.2 run on top of it. Xorg-7.2 and X11-R6 are not buildable and require a lot of hands work.

BR,
Ivan

>
> Hi Ulf,
>
>   If we cant build either Tinyx or Xorg or X11 then how else can we build
> cairo,pango,gtk and other stuff. i am trying to build a decent toolchain
> with all library for arm926ejs but i see that most of these are not
> supported for am926ejs
>
>   Is there any possibilities that i can build just cairo pango gtk2 without
> the need for x softwares. Once i build all this later can we integrate these
> with x softwares.
>
> Regards
> Gururaja
>
>
>
> Ulf Samuelsson-2 wrote:
>>
>>>I receive errors if I want to build either tiny-x or the full X11R7.  has
>>> anyone else had these?  Is this something in the environment?
>>>
>>>
>>>
>>> I have a snapshot from a couple of months ago and I can build tiny-x
>>> without
>>> a problem on it.
>>>
>>>
>>>
>>> X11R7:
>> [snip]
>>
>>>
>>>
>>> tiny-x:
>>>
>>> making imake with BOOTSTRAPCFLAGS= in config/imake
>>>
>>> /home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
>>> c-gcc -Os -pipe
>>> -I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
>>> -I/home/christopher/sb/buildroot/build_arm/staging_dir/include
>>> -mtune=arm920t -o ccimake  -O -I../../include
>>> -I../../imports/x11/include/X11 ccimake.c
>>>
>>
>> As you can see from above, you are compiling ccimage.c using the ARM cross
>> compiler.
>>
>>> /home/christopher/sb/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclib
>>> c-gcc -Os -pipe
>>> -I/home/christopher/sb/buildroot/build_arm/staging_dir/usr/include
>>> -I/home/christopher/sb/buildroot/build_arm/staging_dir/include
>>> -mtune=arm920t -c  -O -I../../include -I../../imports/x11/include/X11
>>> `./ccimake` imake.c
>>>
>>> /bin/sh: ./ccimake: cannot execute binary file
>>
>> And now you try to run the ARM binary on your PC.
>>
>>>
>> [snip]
>>> ./config/imake/imake -I./config/cf  -s ./config/makedepend/Makefile.proto
>>> -f
>>> ./config/makedepend/Imakefile -DTOPDIR=../.. -DCURDIR=./config/makedepend
>>>
>>> ./config/imake/imake: ./config/imake/imake: cannot execute binary file
>>>
>>
>> I have seen the same problem, tinyx simply does not build.
>> Xorg does not build either, and x11r7 is still work in progress.
>>
>>
>>
>> Best Regards
>> Ulf Samuelsson
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>>
>
> --
> View this message in context:
> http://www.nabble.com/building-tiny-x-or-x11R7-with-latest-snapshot-tf4301002.html#a12306984
> Sent from the BuildRoot mailing list archive at Nabble.com.
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
