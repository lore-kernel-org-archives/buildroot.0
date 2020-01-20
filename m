From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Jan 2020 22:09:35 +0100
Subject: [Buildroot] Problem generating rootfs for ci20 defconfig
In-Reply-To: <CAJ4jsackLicBx5naQiNu+hCWZ45Jbx8cqRCK9sLaSHrDTE1pNg@mail.gmail.com>
References: <87muaimcqg.fsf@igalia.com>
 <CAJ4jsafbQ9GBLYd=x95B7QZ=AAd2AdLH-+iuPNnEqhkGfKZ1uw@mail.gmail.com>
 <87lfq2mbiz.fsf@igalia.com>
 <CAJ4jsackLicBx5naQiNu+hCWZ45Jbx8cqRCK9sLaSHrDTE1pNg@mail.gmail.com>
Message-ID: <85dd964f-adc4-5c1b-875f-ef3f827925cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/01/2020 17:41, Carlos Santos wrote:
> On Mon, Jan 20, 2020 at 11:46 AM Paulo Matos <pmatos@igalia.com> wrote:
>>
>>
>> Carlos Santos writes:
>>
>>> On Mon, Jan 20, 2020 at 11:20 AM Paulo Matos <pmatos@igalia.com> wrote:
>>>>
>>>> While trying to generate an image using the ci20_defconfig (on
>>>> git 84d471a0b1) with a few
>>>> extra libraries added I am getting the following error:
>>>>
>>>>>>>   Executing post-image script support/scripts/genimage.sh
>>>> INFO: cmd: "mkdir -p "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"" (stderr):
>>>> INFO: cmd: "rm -rf "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"/*" (stderr):
>>>> INFO: cmd: "mkdir -p "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp"" (stderr):
>>>> INFO: cmd: "cp -a "/tmp/tmp.ymKkcnSKic" "/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root"" (stderr):
>>>> INFO: cmd: "find '/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root' -depth -type d -printf '%P\0' | xargs -0 -I {} touch -r '/tmp/tmp.ymKkcnSKic/{}' '/home/pmatos/roots/br-root.jsc32-mips/build/genimage.tmp/root/{}'" (stderr):
>>>> ERROR: hdimage(sdcard.img): part rootfs size (62914560) too small for rootfs.ext4 (134217728)
>>>> make[1]: *** [Makefile:808: target-post-image] Error 1
>>>>
>>>> Does anybody understand what this part rootfs size refers to? The
>>>> rootfs.ext4 size if the 128M I set as BR2_TARGET_ROOTFS_EXT2_SIZE but
>>>> unsure what the other number is, or what it means.
>>>>
>>>
>>> It comes from "size = 60M" in board/ci20/genimage.cfg.
>>
>> Thanks!
>>
>> Working now.
>>
>> --
>> Paulo Matos
> 
> Perhaps we should drop the size parameter for rootts in
> board/*/genimage.cfg and let genimage always use the size of the
> filesystem image.

 That's the case for most genimage.cfg files anyway. I think the few which do
have a specified size are just historical accident.

 Regards,
 Arnout
