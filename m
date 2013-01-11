From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 11 Jan 2013 14:38:00 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <201301111436.14878.yann.morin.1998@free.fr>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
 <201301111436.14878.yann.morin.1998@free.fr>
Message-ID: <CAGduivxSgB-VMaiwuM+Xnp+8=G7SJn3fxg3qQS_OxhzgjEZsGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 11, 2013 at 2:36 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> On Friday 11 January 2013 14:17:30 Maxime Hadjinlian wrote:
> [--SNIP--]
>> diff --git a/board/raspberrypi/README.txt b/board/raspberrypi/README.txt
>> new file mode 100644
>> index 0000000..5ddc5c5
>> --- /dev/null
>> +++ b/board/raspberrypi/README.txt
>> @@ -0,0 +1,35 @@
>> +## RaspberryPi
>> +
>> +When you use the rpi_defconfig to build a rootfs for your RaspberryPi, a few
>> +items are created in output/images :
>> +
>> +     output/images/
>> +     ??? rootfs.tar
>> +     ??? rpi-firmware
>> +     ?   ??? bootcode.bin
>> +     ?   ??? config.txt
>> +     ?   ??? fixup_cd.dat
>> +     ?   ??? fixup.dat
>> +     ?   ??? start_cd.elf
>> +     ?   ??? start.elf
>> +     ??? zImage
>
> Please, use only ascii chars (0x00..0x7F):
>         output/images/
>         +-- rootfs.tar
>         +-- rpi-firmware
>         |   +-- bootcode.bin
>         [...]
>         |   `-- start.elf
>         `-- zImage
Will do.
>
>> +In order to have a working SDCard, you should have at least two partitions :
>> +
>> +    - First partition :
>> +     This will be the boot partition (It must be formated in fat32 and have
>> +        bootable flags).
>> +     It should contains the *content* of output/images/rpi-firmware/.
>> +        It will also contain the kernel binary.
>> +        For the kernel to be found, you have two choices :
>> +         1 - Rename zImage to kernel.img since it's the default kernel file
>> +                name here.
>> +            2 - Add 'kernel=zImage' to config.txt (without the quotes).
>
> kernel='kernel.img' maybe?
Nop, as said, you have two choices for the kernel binary to be found.
Either, you rename the file so it match the default name, kernel.img.
Or, you change in the config.txt the file name the kernel should have.
> If not, explain what this kernel= settings means.
>
> Otherwise, looks good to me. ;-)
Thanks
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
> | --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
> | http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
> '------------------------------'-------'------------------'--------------------'
