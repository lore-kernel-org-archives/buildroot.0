From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Mon, 8 Jul 2013 14:44:45 +0800
Subject: [Buildroot] [PATCH] linux: Do not force GZIP initramfs
	compression
In-Reply-To: <50752329.60809@mind.be>
References: <1349825696-28535-1-git-send-email-gvaxon@gmail.com>
 <50752329.60809@mind.be>
Message-ID: <CAJhJPsXEJGJB33c-muJX3uSu1W9k2UL6CvKc=qTbg6Hzw+AdzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Agreed.

2012/10/10 Arnout Vandecappelle <arnout@mind.be>

> On 10/10/12 01:34, Valentine Barshak wrote:
>
>> Initramfs compression does not make much sense for the architectures
>> that support compressed kernel images because in this case the data
>> would be compressed twice. This will eventually result in a bigger
>> kernel image and time overhead when uncompressing it.
>> The only reason to use compressed initramfs is to reduce memory
>> usage when the kernel prepares rootfs, and both the unpacked
>> filesystem and initramfs.cpio are present in the memory.
>>
>> Buildroot attempts to force GZIP compression for initramfs,
>> however it doesn't always work because initramfs compression mode
>> depends on RAM disk compression supported by the kernel.
>> Thus, CONFIG_INITRAMFS_COMPRESSION_**GZIP depends on CONFIG_RD_GZIP.
>> If CONFIG_RD_GZIP is not set, setting GZIP initramfs compression
>> will have no effect.
>>
>> Besides, the kernel also supports other compression methods,
>> like BZIP2, LZMA, XZ and LZO. Forcing the good old GZIP does not
>> really make much sense any more.
>>
>> This removes initramfs compression settings from Buildroot,
>> so that the default value preset in the kernel config is used,
>> which is CONFIG_INITRAMFS_COMPRESSION_**NONE.
>>
>> If initramfs compression is still needed, it can be set
>> in the kernel config (using make linux-menuconfig)
>>
>> Signed-off-by: Valentine Barshak<gvaxon@gmail.com>
>>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  I especially like the extensive commit message!
>
>  Regards,
>  Arnout
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
> ______________________________**_________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/**mailman/listinfo/buildroot<http://lists.busybox.net/mailman/listinfo/buildroot>
>



-- 
Best Regards!
Kelvin Cheung
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130708/3008c21c/attachment.html>
