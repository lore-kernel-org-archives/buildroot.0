From: Guillaume Delbergue <guillaume.delbergue@greensocs.com>
Date: Wed, 25 Nov 2015 15:15:00 +0100
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add DTB support for ARM
	Versatile PB
In-Reply-To: <5655BD9F.10001@zacarias.com.ar>
References: <1448457599-29371-1-git-send-email-guillaume.delbergue@greensocs.com>
 <20151125144810.04e7ed7e@free-electrons.com> <5655BD9F.10001@zacarias.com.ar>
Message-ID: <5551C7CB-AFAF-4DA6-86DB-EBAFF3AA2700@greensocs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi both,

The platform boots with or without DTB option (-dtb [?]/versatile-pb.dtb) with this patch (tested with QEMU master on Ubuntu 14.04).
Of course, I can adjust README. But currently, even with this patch, README is still valid. If you don?t specify dtb, it will use ATAGS and boot.

PS : CONFIG_MACH_VERSATILE_DT ( != ARM_APPENDED_DTB) is not to support appended DTB to zImage. http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/mach-versatile/Kconfig

Regards,

Guillaume Delbergue

> On 25 Nov 2015, at 14:54, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> 
> On 25/11/15 10:48, Thomas Petazzoni wrote:
> 
>>> Add CONFIG_MACH_VERSATILE_DT to support Versatile platform from device tree
>>> 
>>> Signed-off-by: Guillaume Delbergue <guillaume.delbergue@greensocs.com>
>> 
>> Then maybe the board/qemu/arm-versatile/readme.txt file should be
>> updated to make use of the DTB ?
>> 
>> Gustavo ?
>> 
>> Thanks,
>> 
>> Thomas
> 
> Hi.
> Yes, definitely, since we don't default to any form of appended DTB for that defconfig the current instructions will probably result in a non-bootable scenario.
> Care to adjust this and send a new patch?
> You can look at the vexpress readme.txt (board/qemu/arm-vexpress/readme.txt) on how to adjust/use it, but in theory you already do that unless you changed the kernel output to appended zImage.
> Regards.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 842 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151125/d0f19d30/attachment.asc>
