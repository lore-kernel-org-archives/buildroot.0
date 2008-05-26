From: Arun Reddy <reddyac@gmail.com>
Date: Mon, 26 May 2008 13:13:49 -0700
Subject: [Buildroot] Anyone try simulating their Buildroot-created
	filesystem image in QEMU?
In-Reply-To: <270858e90805261022i40f298e7md5315975a4900267@mail.gmail.com>
References: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>
	<483AC264.6080500@tirsdagsklubben.nu>
	<270858e90805260907qe8164c2i47a230009c949191@mail.gmail.com>
	<483AEA55.5030603@tirsdagsklubben.nu>
	<270858e90805261022i40f298e7md5315975a4900267@mail.gmail.com>
Message-ID: <326f33790805261313i5eb510c7g32caca585182692@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey fellas, I would like to thank you for having this discussion in my
thread. I completely understand the point that buildroot doesn't make disk
images. I too tried qemu-img convert to see if I can "convert" the buildroot
created image to a harddisk image. But to actually convert the buildroot
image to a harddisk image, I did this successfully with my x86 build using
the script under ~/buildroot/scripts/build-ext3-img. In that, it actually
goes through what Knut-Havard outlined. Have you guys taken a look at it? I
tried using this script for my arm build (I ran my x86 build using
VirtualBox, but VirtualBox doesn't support ARM targets), and it seemed like
I made a harddisk image, but I still can't boot it in QEMU.

I think it might be worth looking into Wayne if you're curious. I will play
around with this method more and see what I can come up with. I have yet to
read the new link you gave as well. I hope to come up with something by
tonight!

On Mon, May 26, 2008 at 10:22 AM, Wayne Keenan <wayne.keenan@gmail.com>
wrote:

>
>
> On Mon, May 26, 2008 at 5:50 PM, Knut-H?vard Aksnes <
> kna at tirsdagsklubben.nu> wrote:
>
>> Wayne Keenan wrote:
>>
>>> Hi,
>>>
>>> How about using the qemu-img  conversion utility to convert from ext[2|3]
>>> (or other) to qcow (qemu) format ?
>>>
>>>  That's OK to do as soon as you have a disk image available in some
>> format. The problem is that buildroot doesn 't build disk images it builds
>> partition images. What's missing is some kind of simple tool that wraps one
>> or more partition images (plus optionally some kind of Master Boot Record)
>> into a disk image.
>
>
> good point.  *blush*
>
> What I curretly do is export the RFS directory as an NFS mount point and
> then am able to mount it from within an ARM QEMU session and also mount the
> same export on target device.  Admittedly, my NFS RFS its not my buildroot
> RFS right at the moment, just a core Debian one, I just haven't gotten
> around to exporting and trying the BR one yet.
>
> Regards
> Wayne
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080526/179c453d/attachment.htm 
