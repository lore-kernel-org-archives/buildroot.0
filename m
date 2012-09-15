From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 15 Sep 2012 20:26:18 +0200
Subject: [Buildroot] Basic questions about using BuildRoot
In-Reply-To: <5054C649.6000006@ronetix.at>
References: <5054BAFA.5060700@ronetix.at>
 <CAAXf6LUAv+e848ucWt+=2PX-yTF6JhWQ1BQ7=EDPqF1YH_pT3g@mail.gmail.com>
 <5054C649.6000006@ronetix.at>
Message-ID: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

Please keep the list in copy, and please don't top-post...

Op 15 sep. 2012 20:17 schreef "Martin Peevski" <martin@ronetix.at> het
volgende:
>
>      Thank you very much for the fast response!
>
>      When i wrote the first letter the building was in progress. When it
finish only the u-boot.bin was in the output/images/ directory. Neither a
Kernel nor a File system was build. It was included in the menuconfig but
was not build. Also i program the u-boot.bin in the target and it not work.
Can you please help me again to resolve that problem?

If the kernel is not built and there were no errors during the build
process, it must mean that your config is not ok.
Can you re-verify the .config file for e.g. the kernel settings?

Note that I don't have specific experience with this board nor with uboot,
so I can't answer that question.
In general, I'd wonder whether you programmed the bootloader correctly,
what the errors were you encountered, if any, ...
Did you follow the procedure regarding configuration I outlined in my first
response? First defconfig, then make. Can you try with a clean defconfig
without any modifications?

Best regards, Thomas

>
>
>
>
>
> On 15/09/12 20:50, Thomas De Schampheleire wrote:
>>
>>
>> Op 15 sep. 2012 19:29 schreef "Martin Peevski" <martin@ronetix.at> het
volgende:
>> >
>> >      Hello, I'm new embedded Linux user and need a little help to
build embedded Linux system with BuildRoot tool for AT91SAM9263 target. May
questions are described below:
>> >
>> >      1. After system configuration is done with make menuconfig
command, shall I execute only make command to build the entire embedded
system? Or there is need to execute make at91sam9263ek_defconfig command
prior or after the pure make command?
>>
>> If there is a defconfig for your board, you would start with 'make
xxx_defconfig' and then possibly 'make menuconfig' to tune the
configuration. The defconfig serves as a start that should work out of the
box.
>>
>> >
>> >      2. If I not make additional configuration with busybox-menuconfig
or the corresponding command for configuration the Linux Kernel, shall the
build system work on the target?
>>
>> If you started from a defconfig that corresponds to your board, then yes
it's supposed to work just like that.
>>
>> >
>> >      I will be thankful to any help!
>> >      With best regards, Martin Peevski.
>> >
>>
>> Best regards,
>> Thomas
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120915/6632e400/attachment-0001.html>
