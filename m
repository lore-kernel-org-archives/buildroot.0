From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 24 Apr 2008 08:14:43 -0700
Subject: [Buildroot] Example .configs?
In-Reply-To: <46a136670804240759o3f60813dx20f5d44ee1f63edf@mail.gmail.com>
References: <1209041724.6819.3.camel@rhodan.rho>
	<46a136670804240756y200cf080vacf8d18372177e9a@mail.gmail.com>
	<46a136670804240759o3f60813dx20f5d44ee1f63edf@mail.gmail.com>
Message-ID: <326f33790804240814n15f862f2s9b3c64937ad04df0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

P,

If you find that you are missing packages and the build aborts, you will be
told which package you're missing. In many cases, the build will simply stop
and you can use an apt-get to obtain an appropriate package the build
process needs to complete. In other cases there is a variable stored within
a make file for a package that buildroot downloads itself (wget), which is
out of date. That is, the repository no longer holds that version, so you
can manually go in and change the .mk file to change that variable.

As for the kernel problem, I also did a make defconfig as well, however I
manually added in my drivers by looking up my embedded device's
specifications. John's suggestion is the best thing to follow in your case,
since you can find out what drivers to include using that advice.

Always know that you never have to "repeat"  a build process if one thing is
wrong with buildroot (package, bug, etc). There may always be a problem with
buildroot but your progress in the build process will always be saved so you
can continue it at a later time once you've fixed the bug or package
problem.

You might also look up packages online before installing them to understand
their dependencies, and manually get those packages as well. I should add
whenever you add a package don't forget to apt-get update.

On Thu, Apr 24, 2008 at 7:59 AM, John Voltz <john.voltz@gmail.com> wrote:

> I should also add that the project at http://code.google.com/p/buildroot<http://code.google.com/p/buildroot/wiki/BuildingonUbuntu>is a buildroot testing ground for those of us using the relatively new AVR32
> processors, so you may want to stick to the buildroot.uclibc.org project
> if you are not using AVR32.
>
> John
>
>
>
> On Thu, Apr 24, 2008 at 10:56 AM, John Voltz <john.voltz@gmail.com> wrote:
>
>> mdev is a part of busybox, therefore an option to the busybox config. Your
>> architecture determines where the busybox .config file is kept in the
>> buildroot tree. It will either use the default in package/busybox or
>> somewhere in target/device/your-arch
>>
>> There may also be defconfigs for your architecture in
>> target/device/your-arch, look in target/device/Atmel/atngw100 for an
>> example. atngw100_defconfig is the buildroot .config, then there are the
>> Linux kernel .configs, and the busybox .configs. Atmel keeps the uClibc
>> .config for that arch in target/device/Atmel/uClibc.config.avr32
>>
>> I wrote a wiki about using buildroot on Ubuntu that you might want to have
>> a look at too:
>> http://code.google.com/p/buildroot/wiki/BuildingonUbuntu
>>
>> John
>>
>>
>> On Thu, Apr 24, 2008 at 8:55 AM, p <pmeloy@shaw.ca> wrote:
>>
>>> I'm new to buildroot and fairly new to linux. I'm wondering if there are
>>> any example .configs or something resembling the kernel defconfigs for
>>> buildroot?
>>>
>>> I'm having trouble compiling in that I always seem to miss a dependency
>>> someplace. CHoose packages then find out near the end of a long compile
>>> that some package or other isn't present and it all aborts.
>>>
>>> I'm also wondering where mdev is in the configs? One selection said to
>>> make sure I added mdev but even a search of the .config doesn't show any
>>> mention of mdev, set or not.
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at uclibc.org
>>> http://busybox.net/mailman/listinfo/buildroot
>>>
>>
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/49eff816/attachment-0001.htm 
