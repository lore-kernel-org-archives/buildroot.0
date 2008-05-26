From: Wayne Keenan <wayne.keenan@gmail.com>
Date: Mon, 26 May 2008 18:22:02 +0100
Subject: [Buildroot] Anyone try simulating their Buildroot-created
	filesystem image in QEMU?
In-Reply-To: <483AEA55.5030603@tirsdagsklubben.nu>
References: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>
	<483AC264.6080500@tirsdagsklubben.nu>
	<270858e90805260907qe8164c2i47a230009c949191@mail.gmail.com>
	<483AEA55.5030603@tirsdagsklubben.nu>
Message-ID: <270858e90805261022i40f298e7md5315975a4900267@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 26, 2008 at 5:50 PM, Knut-H?vard Aksnes <kna@tirsdagsklubben.nu>
wrote:

> Wayne Keenan wrote:
>
>> Hi,
>>
>> How about using the qemu-img  conversion utility to convert from ext[2|3]
>> (or other) to qcow (qemu) format ?
>>
>>  That's OK to do as soon as you have a disk image available in some
> format. The problem is that buildroot doesn 't build disk images it builds
> partition images. What's missing is some kind of simple tool that wraps one
> or more partition images (plus optionally some kind of Master Boot Record)
> into a disk image.


good point.  *blush*

What I curretly do is export the RFS directory as an NFS mount point and
then am able to mount it from within an ARM QEMU session and also mount the
same export on target device.  Admittedly, my NFS RFS its not my buildroot
RFS right at the moment, just a core Debian one, I just haven't gotten
around to exporting and trying the BR one yet.

Regards
Wayne
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080526/67fd7b42/attachment.htm 
