From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 17 Sep 2012 12:43:12 +0200
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <5055C935.3050108@ronetix.at>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
Message-ID: <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin,
Please, when you reply to an e-mail from a mailing list, hit
'Reply-all' instead of 'Reply'.

On Sun, Sep 16, 2012 at 2:42 PM, Martin Peevski <martin@ronetix.at> wrote:
> On 16/09/12 14:12, Thomas De Schampheleire wrote:
>
> Hi Martin,
>
> Op 16 sep. 2012 12:26 schreef "Martin Peevski" <martin@ronetix.at> het
> volgende:
>>
>>
>>
>>
>> -------- Original Message --------
>> Subject:
>> Re: [Buildroot] Basic questions about using BuildRoot
>> Date:
>> Sat, 15 Sep 2012 20:26:18 +0200
>> From:
>> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
>> To:
>> Martin Peevski <martin@ronetix.at>, buildroot <buildroot@busybox.net>
>>
>>
>> Hi Martin,
>>
>> Please keep the list in copy, and please don't top-post...
>>
>> Op 15 sep. 2012 20:17 schreef "Martin Peevski" <martin@ronetix.at> het
>> volgende:
>> >
>> >      Thank you very much for the fast response!
>> >
>> >      When i wrote the first letter the building was in progress. When it
>> > finish only the u-boot.bin was in the output/images/ directory. Neither a
>> > Kernel nor a File system was build. It was included in the menuconfig but
>> > was not build. Also i program the u-boot.bin in the target and it not work.
>> > Can you please help me again to resolve that problem?
>>
>> If the kernel is not built and there were no errors during the build
>> process, it must mean that your config is not ok.
>> Can you re-verify the .config file for e.g. the kernel settings?
>>
>> Note that I don't have specific experience with this board nor with uboot,
>> so I can't answer that question.
>> In general, I'd wonder whether you programmed the bootloader correctly,
>> what the errors were you encountered, if any, ...
>> Did you follow the procedure regarding configuration I outlined in my
>> first response? First defconfig, then make. Can you try with a clean
>> defconfig without any modifications?
>>
>> Best regards, Thomas
>>
>> >
>> >
>> >
>> >
>> >
>> > On 15/09/12 20:50, Thomas De Schampheleire wrote:
>> >>
>> >>
>> >> Op 15 sep. 2012 19:29 schreef "Martin Peevski" <martin@ronetix.at> het
>> >> volgende:
>> >> >
>> >> >      Hello, I'm new embedded Linux user and need a little help to
>> >> > build embedded Linux system with BuildRoot tool for AT91SAM9263 target. May
>> >> > questions are described below:
>> >> >
>> >> >      1. After system configuration is done with make menuconfig
>> >> > command, shall I execute only make command to build the entire embedded
>> >> > system? Or there is need to execute make at91sam9263ek_defconfig command
>> >> > prior or after the pure make command?
>> >>
>> >> If there is a defconfig for your board, you would start with 'make
>> >> xxx_defconfig' and then possibly 'make menuconfig' to tune the
>> >> configuration. The defconfig serves as a start that should work out of the
>> >> box.
>> >>
>> >> >
>> >> >      2. If I not make additional configuration with
>> >> > busybox-menuconfig or the corresponding command for configuration the Linux
>> >> > Kernel, shall the build system work on the target?
>> >>
>> >> If you started from a defconfig that corresponds to your board, then
>> >> yes it's supposed to work just like that.
>> >>
>> >> >
>> >> >      I will be thankful to any help!
>> >> >      With best regards, Martin Peevski.
>> >> >
>> >>
>> >> Best regards,
>> >> Thomas
>> >
>> >
>>
>>
>>
>>
>> Hi Tomas,
>> ok, I stop to top-post :)
>
> That's already good, now try to keep the list in copy as well, there may be
> people with more experience with your board...
>
>> It's a new day in Bulgaria and I try again to build running embedded Linux
>> with at91sam9263 again. In brief I do the following:
>>
>>     1. Run "make clean", "make distclean" to clean everything;
>>
>>     2. Following your advice in the last letter, I try only with "make
>> at91sam9263_defconfig" but the build stop because uClibc was not configured
>> for large files. Then I run "make menuconfig" and configure the uClibc for
>> large files. Also configure the following things:
>>         - Host utilities: host sam-ba was checked. I check also and host
>> u-boot tools.
>>         - Root file system: check ouput format for jffs2 format and
>> checked the option for Generetate file system summary.
>>         - Bootloader: uncheck the Bootstrap option and check only the
>> U-boot option.
>
> I don't know this board but are you sure you don't need this bootstrap?
> Since you're having trouble booting, I'd double check this...
>
>>         - Configure the Kernel to use the same version as the toolchain -
>> 3.x
>>
>>     3. Finally I build with make and the result was generated uImage,
>> rootfs.jffs2 and u-boot.bin. As expected. Then program first the u-boot file
>> on the target but still no life on the RS232 console. Nothing print.
>
> Has this board worked before? What was it running then?
>
>>
>>      Can you, please, help me again?
>>      Have a nica day!
>
> Best regards,
> Thomas
>
>
>
> Hi, TOmas
>
> The board is Ronetix bb9263 with modul? pm9263. It works fine with other
> already builded images for u-boot, Kernel, Root FS and without Bootstrap.
> Now I need custom Root FS, that's the reason to use Buildroot. I plan to
> build Linux for at91sam9g45 because it's currently not supported by the
> Build root or I'm not right? And now I'm trening with the 9263 but even it
> wont not work.

How were these u-boot images built. Do they have custom source? Which
configuration was used?
Have you tried using the exact same configuration?

If you're only interested in the rootfs, you could use the original,
working u-boot and use the rootfs from buildroot. Have you tried that?

>
> One question beyond the theme: is it possible to build only Root FS
> compatible with some external Kernel without any tool and if so how to do
> that?

It is of course possible to build every package yourself, and create
an image from that, but you'd have to know how to do it. That's
precisely the reason why you'd use buildroot: to not need to know all
the details and benefit from the knowledge and work of others.

Best regards,
Thomas
