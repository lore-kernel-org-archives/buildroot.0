From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 24 Jan 2013 14:08:44 +0200
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <51011175.9010106@zacarias.com.ar>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
 <20130122180554.6c540102@skate> <50FED7D3.3060600@petroprogram.com>
 <51011175.9010106@zacarias.com.ar>
Message-ID: <5101244C.7080307@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

24.1.2013 12:48, Gustavo Zacarias kirjoitti:
> On 01/22/2013 03:17 PM, Stefan Fr?berg wrote:
>>> I don't remember exactly, but isn't the kernel build process itself
>>> capable of compressing the initramfs already? I remember we had some
>>> discussion about this a while ago, but I don't remember the outcome of
>>> these. Arnout was leading this discussion, IIRC.
>> If it's embedded initramfs then yes, kernel can handle it all itself
>> just nicely.
>> without needing to compress inside initramfs.
>> (images kernel.png and kernel2.png)
>>
>> But if outside cpio-archive (aka initramfs) then no. It has to be done
>> by hand.
>> And like I said to Gustavo it's bad to do double compression.
> Well, it's not always bad to do double compression.
> On some systems where touching the bootloader isn't an option with say,
> uboot, if uboot doesn't understand the newer compression method you're
> most likely stuck with gzip or none for the uImage.
> So doing xz for the initramfs in that case would be a space saver - even
> if you're doing double (de)compression.
> Granted, you'll pay it dearly in cpu time.
> I started looking at this because someone in #elinux started asking
> about making the tinyest possible kernel+initramfs for x86 for pxeboot
> with some packages and i saw we were lacking options to go for the best.
> Also noticed we weren't doing anything about the compressed cpio archive
> so the resulting combined kernel was roughly always the same size.
> For some unknown reason he wanted everything to fit in a 1.8 MB file -
> maybe some PXE limitation, i don't know.
> Question is, should we care about those uses cases or not?
> Regards.

I think users should be allowed to do every possible combination they
want to.
But also give them big fat warning in cases when their choices might
drop performance
so that they are perfectly aware of consequences of the choices they
made in config.
So yeah, double (de)compression is option too but with big fat warning
added that might
affect your system speed.

User is the King.

Stefan
