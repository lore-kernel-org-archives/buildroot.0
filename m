From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 2 Jan 2013 16:32:52 -0800
Subject: [Buildroot] [RFC] How to handle targets that need more than one
 file system to boot?
In-Reply-To: <201301030056.01956.yann.morin.1998@free.fr>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <CAJJ6jxuKWz3-que3MYwBSrLh_F2-L_XhMvE-+oUog+kL_2mobA@mail.gmail.com>
 <50E3DA74.6080303@mind.be>
 <201301030056.01956.yann.morin.1998@free.fr>
Message-ID: <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 2, 2013 at 3:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, Steve, All,
>
> On Wednesday 02 January 2013 Arnout Vandecappelle wrote:
>> On 12/25/12 04:52, Steve Calfee wrote:
>> > On Sun, Dec 23, 2012 at 4:00 PM, Yann E. MORIN<yann.morin.1998@free.fr>  wrote:
> [--SNIP--]
>> >> For now, buildroot can build a single filesystem image. This is not useable
>> >> for these systems. The only possibility as of today is to configure BR to
>> >> generate a tarball, and have a custom script that does the required split up
>> >> of the different components.
>>
>>   That's not really true, is it? Buildroot generates the ext2fs and the
>> boot loader and kernel images, you only have to create the partitions and
>> the fatfs and pull everything together into a single image.
>
> So, you said the same as me: Buildroot (without external tools) can
> not generate more than one *filesystem* image (ext2, tar, whatever).
>

Hi Yann,

Maybe we are talking about different things. I think there is a config
option in buildroot that allows you to build multiple output
filesystems, I believe I have created ext4 and a tar.gz as outputs. I
think there are also various flash file systems you can create.

They do all contain the identical built rootfs, so for raspberry pi
where for now you want the first boot partition to be fat and the rest
ext4,  buildroot does not build both of them. However the images are
correctly made and can easily be installed by the user manually or via
a script. Building for instance the boot fat file system does not make
much sense, you still need to somehow install the built stuff onto
flash. Doing an install is highly developer specific (and frequently
requires manual insertion of flash etc), and I don't think should be
part of the the BR make system.

Regards, Steve
