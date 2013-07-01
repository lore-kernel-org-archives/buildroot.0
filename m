From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 01 Jul 2013 12:10:40 +0200
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
 <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
 <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
Message-ID: <51D155A0.3010205@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/24/2013 09:49 PM, rh wrote:
> On Mon, 24 Jun 2013 08:22:56 -0400
> Frank Hunleth
> <fhunleth@troodon-software.com> wrote:
>
>> If you'd like to try out my repository for the BBB, feel free to look
>> at:
>>
>> https://github.com/fhunleth/buildroot-bbb
>>
>> I don't have much in the line of instructions right now, but it should
>> build for you. Check out the bbb branch and run "make
>> beagleboneblack_defconfig" and make. I can run the images from both a
>> microSD card and eMMC, and things seem to be coming up.
> Thanks for sharing!  You're way more organized than I am.
> Mine is not ready for prime-time, I'm not sure if it even boots.
> I don't have a working serial cable yet.
>
>> Also, I just put in the PRU's PASM assembler and interface libraries.
>> I haven't checked it out yet except that it builds and can assemble
>> the examples.
>>
>>>> The point of my email is just that the
>>>> github.com/beagleboard/kernel repository is not in a form that
>>>> nicely integrates with buildroot due to it just containing patches
>>>> for a Linux kernel. I'm just looking for pointers on how best to
>>>> handle this.
>>> I think the answer is in the other reply, but I'm not sure yet.
>>> From the brief time I've used buildroot it seems flexible enough to
>>> allow pulling stuff from lots of places.
>> Despite using br for the past few years on a handful of projects, it
>> seems like every time I update my tree that I learn about a few new
>> features.
> Buildroot has lots of possibilities for sure. I'm used to building kernels
> but the BBB and buildroot adds a new level of complexity for me.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Hello,

checked the linked config from fhunleth, it seems in the used kernel
tree (
http://files.troodon-software.com/br/beagleboard-kernel-b37928553c8de3598d8a259d7ce5c4be713c2908.tar.xz
), the usb and the ethernet support is broken (or, as it always
possible, i failed something).
 So to get a working kernel, i used the patchset from
https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.8 ,
( which patches are extracted from the Angstrom build tree ), applied
them manually on the mainline tree, created a tarball, and used that to
build with Buildroot.
So far everything works well (UART,USB host/gadget, ethernet, GPIO
tested). I wondering, would it be possible to apply those subdir-style (
https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.8/patches )
patches automatically in Buildroot on an elegant way? Or better to
create a git tree with applied patches somewhere online and use that in
Buildroot?

Thanks, best regards,
zgyarmati



-- 
br, 
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
