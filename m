From: Willy Lambert <lambert.willy@gmail.com>
Date: Thu, 3 Jan 2013 09:31:44 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
 file system to boot?
In-Reply-To: <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <CAJJ6jxuKWz3-que3MYwBSrLh_F2-L_XhMvE-+oUog+kL_2mobA@mail.gmail.com>
 <50E3DA74.6080303@mind.be>
 <201301030056.01956.yann.morin.1998@free.fr>
 <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
Message-ID: <CAKvQZ_0r6DyEt=1XZWZ5RwFYg-LaU1xvyJcYTVn0sje+696nkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/3 Steve Calfee <stevecalfee@gmail.com>:
> On Wed, Jan 2, 2013 at 3:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Arnout, Steve, All,
>>
>> On Wednesday 02 January 2013 Arnout Vandecappelle wrote:
>>> On 12/25/12 04:52, Steve Calfee wrote:
>>> > On Sun, Dec 23, 2012 at 4:00 PM, Yann E. MORIN<yann.morin.1998@free.fr>  wrote:
>> [--SNIP--]
>>> >> For now, buildroot can build a single filesystem image. This is not useable
>>> >> for these systems. The only possibility as of today is to configure BR to
>>> >> generate a tarball, and have a custom script that does the required split up
>>> >> of the different components.
>>>
>>>   That's not really true, is it? Buildroot generates the ext2fs and the
>>> boot loader and kernel images, you only have to create the partitions and
>>> the fatfs and pull everything together into a single image.
>>
>> So, you said the same as me: Buildroot (without external tools) can
>> not generate more than one *filesystem* image (ext2, tar, whatever).
>>
>
> Hi Yann,
>
> Maybe we are talking about different things. I think there is a config
> option in buildroot that allows you to build multiple output
> filesystems, I believe I have created ext4 and a tar.gz as outputs. I
> think there are also various flash file systems you can create.
>

I'm curious to know how you do ext4 from BR. I did not found that, and
ASAIK, there is no documentation about outputs (and it's a real pain
for new comers like me)

> They do all contain the identical built rootfs, so for raspberry pi
> where for now you want the first boot partition to be fat and the rest
> ext4,  buildroot does not build both of them. However the images are
> correctly made and can easily be installed by the user manually or via
> a script. Building for instance the boot fat file system does not make
> much sense, you still need to somehow install the built stuff onto
> flash. Doing an install is highly developer specific (and frequently
> requires manual insertion of flash etc), and I don't think should be
> part of the the BR make system.

Maybe a documented exemple with qemu would be helpfull. I am trying
for a month now to create a "partionned" img file. The idea is to use
one of the partition as the rootfs. So I tried different ways to
extract the rootfs.tgz into it but I never succeed in this. I admit
that I'm really not good at playing with "virtual disks", but there is
no entry to find your way. I also believe that it's no more BR stuff,
but hints would be welcome.


>
> Regards, Steve
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
