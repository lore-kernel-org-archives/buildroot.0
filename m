From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 28 Feb 2012 16:32:34 +0100
Subject: [Buildroot] buildroot ncurses build problem
In-Reply-To: <749894859.1231630.1330441934340.JavaMail.root@zimbra22-e3.priv.proxad.net>
References: <CAAXf6LXn1Tdi9MLjqKEC1cGW+N4kU_YuiJD9xMVru1KVQNWcgA@mail.gmail.com>
 <749894859.1231630.1330441934340.JavaMail.root@zimbra22-e3.priv.proxad.net>
Message-ID: <CAAXf6LX=31pR9AXMSvmBZOkJBvWMyrxD76_KptKXsECk+HV5Sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Please send replies to the mailing list, and please don't top-post)

On Tue, Feb 28, 2012 at 4:12 PM,  <snarf77@free.fr> wrote:
> Thanks for answer Thomas,
>
> Of course I have started to compiled from my top level directory and the conclusion was the same. That's why I decided to do the make directly in ncurses as the result was immediate rather than re doing the full compile in order to trouble shoot. I promise I will avoid that in the future.
>
> Anyway the result is the same:
>> /bin/sh: -I../c++: not found
>> make: *** [../objects/cursesf.o] Error 127

It seems that the compiler is not correctly filled in (the variable is empty).

Can you check the value of CXX in output/build/host-ncurses-5.7/c++/Makefile ?

Do you have something specific set in your environment?

>
>
> I will attached the real log as soon as my machine will finish its current build but I'm 99% sure the error was the same.
>

Thanks,
Thomas



> ----- Mail original -----
> De: "Thomas De Schampheleire" <patrickdepinguin+buildroot@gmail.com>
> ?: snarf77 at free.fr
> Cc: buildroot at busybox.net
> Envoy?: Mardi 28 F?vrier 2012 15:43:29
> Objet: Re: [Buildroot] buildroot ncurses build problem
>
> Hi,
>
> On Tue, Feb 28, 2012 at 3:29 PM, ?<snarf77@free.fr> wrote:
>> Hi all,
>>
>> this my first post on this list so first of all hello to everybody.
>>
>> My wish is to create a real time kernel and a minimal rootfs for a atmel at91sam0g20ek eval board. Until now I did it the old way manually but I wanted to give a try to buildroot ti automate all the stuff.
>>
>> I downloaded buildroot and configure menuconfig simply with architecture = arm and target = arm926t and my first "make" was successful and the image is working fine. Good job guys !!
>>
>> But then each time I want to add a new package that depends on ncurses (in my case "nano" editor but this failed also even by simply selecting ncurses) I have my build failed in the ncurses directory with the following error:
>>
>> snarf77 at buildrootVM:~/Downloads/buildroot-2012.02-rc3/output/build/host-ncurses-5.7/c++$ make
>> cd ../objects; ? -I../c++ -I../include -I. -DHAVE_CONFIG_H -I. -I../include ?-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 ?-DNDEBUG -I/home/snarf77/Downloads/buildroot-2012.02-rc3/output/host/usr/include/ncurses -I/home/snarf77/Downloads/buildroot-2012.02-rc3/output/host/include -I/home/snarf77/Downloads/buildroot-2012.02-rc3/output/host/usr/include ?-c ../c++/cursesf.cc
>> /bin/sh: -I../c++: not found
>> make: *** [../objects/cursesf.o] Error 127
>
> Here you are running make from a build directory directly. This is not
> supported.
> You should run 'make' from the top-level buildroot directory, i.e.
> ~/Downloads/buildroot-2012.02-rc3
>
> Do you have the same problem then?
>
>>
>>
>> I'm runnning ubuntu 10.10 32bits and have installed libncurses5.7 if this matters.
>>
>> I have tried with buildroot 2011.11 and same issue so I guess it come either from my environment (ubuntu package missing ?) or from make option or buildroot configuration selection ???
>>
>> Many thanks in advance for your help as I'm stuck there..
>
> Best regards,
> Thomas
