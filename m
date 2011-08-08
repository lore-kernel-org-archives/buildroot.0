From: Heiko Helmle <helman@gmx.net>
Date: Mon, 8 Aug 2011 22:56:19 +0200
Subject: [Buildroot] Problems with udev buildroot
In-Reply-To: <20110808200716.101270@gmx.net>
References: <20110808200716.101270@gmx.net>
Message-ID: <9BFF739A-9E25-4A0D-B689-418A498734F3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aah sorry - the rookie found his mistake:

I'm using a cpio'd filesystem as initramfs - and that disables devtmpfs_mount - according to kernel doc, initramfs has to to mount devtmpfs manually to use it.

So I'm still not quite sure if it'd be better to edit the inittab to mount devtmpfs or just put the basic nodes statically into /dev...

Am 08.08.2011 um 22:07 schrieb Heiko Helmle:

> -- snip --
> [hel at verflixtsl6 xtest]$ grep DEVTMPFS build/linux-2.6.39.4/.config 
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> -- snip --
> 
> I'm using i386 defconfig without any changes (yet) - this seems to enable DEVTMPFS by default.
> 
> But after a rebuild with the same .config it looks different now - I'll do a clean rebuild and check again.
> 
>> ----- Urspr?ngliche Nachricht -----
>> Von: Peter Korsgaard
>> Gesendet: 08.08.11 21:43 Uhr
>> An: Heiko Helmle
>> Betreff: Re: Problems with udev buildroot
>> 
>>>>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:
>> 
>>  Heiko> Hello
>>  Heiko> Hit the send button too early :)
>> 
>>  Heiko> it seems like /dev/null is missing and the generated image isn't able to mount anything...
>> 
>> Do you have CONFIG_DEVTMPFS_MOUNT enabled in the kernel? If so, that
>> should take care of /dev/null.
>> 
>> -- 
>> Bye, Peter Korsgaard
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
