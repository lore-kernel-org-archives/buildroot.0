From: Paul Archer <ptarcher@gmail.com>
Date: Thu, 28 May 2009 16:10:02 +1000
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <d6cda7730905272159h1ecf88efx84d2ae055961c74e@mail.gmail.com>
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272132n34933d3fh925bd0e765eb6f5d@mail.gmail.com>
	<d6cda7730905272159h1ecf88efx84d2ae055961c74e@mail.gmail.com>
Message-ID: <56ea0bb80905272310l336edc11l992c2a3a6f5ee4d1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/5/28 Thiago A. Corr?a <thiago.correa@gmail.com>:
> ? I tried to fix the ubifs too a while back, but other things got in
> the way. I was mainly interested in seeing if it compresses better
> than jffs2.

I am not 100% sure if this is what you meant by comparing the sizes of
the images, but I have made a ubifs image, so I thought I would show
the results.

-rw-r--r-- 1 paul paul 4.6M 2009-05-28 16:03
binaries/AT91SAM9G20/at91sam92g20ek-rootfs.arm-20090528.jffs2
-rw-r--r-- 1 paul paul 6.8M 2009-05-28 16:01
binaries/AT91SAM9G20/at91sam92g20ek-rootfs.arm-20090528.ubifs
-rw-r--r-- 1 paul paul 4.1M 2009-05-28 16:03
binaries/AT91SAM9G20/at91sam92g20ek-rootfs.arm-20090528.ubifs.bz2
-rw-r--r-- 1 paul paul 4.3M 2009-05-28 16:02
binaries/AT91SAM9G20/at91sam92g20ek-rootfs.arm-20090528.ubifs.gz
-rw-r--r-- 1 paul paul 3.6M 2009-05-28 16:04
binaries/AT91SAM9G20/at91sam92g20ek-rootfs.arm-20090528.ubifs.lzma

I can't check what this equates to on a extracted image yet as I need
to modify u-boot a fair bit to get this to work, as currently uboot
doesn't build with ubifs support for the at91sam9xxx.

If you want the config I used to do further analysis just let me know.

Regards Paul

> ? Anyway. I think the correct approach would be mimmic jffs2.mk,
> don't download anything and let mdtutils build mkfs.ubifs for the
> host.
>
> Kind Regards,
> ? ?Thiago A. Correa
>
> On Thu, May 28, 2009 at 1:32 AM, Paul Archer <ptarcher@gmail.com> wrote:
>> On Thu, May 28, 2009 at 5:06 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>> Peter> And report any issues found here or in the bugtracker.
>> I have been trying to build buildroot with a ubifs image. I haven't
>> quite got there yet, but there are some bugs associated with this
>> version.
>>
>> target/ubifs/ubifsroot.mk
>> $(call DOWNLOAD,"$(MKFS_UBIFS_URL)")
>>
>> This should be a WGET, not a DOWNLOAD.
>>
>> I have been trying to update the UBIFS support as this is now included
>> in the mtd-utils package under the mkfs.ubifs.
>> ubifs also depends on e2fsprogs as there is uuid support needed in
>> mkfs.ubifs. I have at least gotten ubifs to compile with a few changes
>> here and there (mainly a change in mtd-utils makefiles to build
>> mkfs.ubifs), but I haven't had time to get an image made yet.
>>
>> --
>> ----
>> Regards
>> Paul Archer
>> ptarcher at gmail.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>



-- 
----
Regards
Paul Archer
ptarcher at gmail.com
