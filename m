From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 22 May 2013 14:30:39 +0200
Subject: [Buildroot] [PATCH] uClibc: Add upstream patch for context
	functions
In-Reply-To: <20130522141814.0739c4de@skate>
References: <1369224304-24734-1-git-send-email-markos.chandras@gmail.com>
 <20130522141814.0739c4de@skate>
Message-ID: <CAKAx1chQcc_BTmKBYhN36-TARDnpApG6uCRsT5x8q4hmToUL-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Indeed, I've not heard about any testing of mongrel2 under uClibc yet,
but that would be good news to know it works with it once uClibc has
pushed a new stable version!

For information, these calls are made by libtask
(http://swtch.com/libtask/), which is embedded in mongrel2 source code
to avoid real threads overhead.

Regards,
Lionel


On Wed, May 22, 2013 at 2:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Wed, 22 May 2013 13:05:04 +0100, Markos Chandras wrote:
>> From: Markos Chandras <markos.chandras@imgtec.com>
>>
>> These functions are needed by some packages like mongrel2
>> and maybe others.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/8e132a2b03a7b5ae94199db7db86883c05dca700/build-end.log
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>> Given this patch is quite big, another option would be for these
>> packages to depend on !BR2_TOOLCHAIN_BUILDROOT || BR2_UCLIBC_VERSION_SNAPSHOT
>
> I believe this would be more reasonable, until this feature lands into
> a stable uClibc version.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
