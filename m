From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 22 May 2013 13:30:03 +0100
Subject: [Buildroot] [PATCH] uClibc: Add upstream patch for context
	functions
In-Reply-To: <20130522141814.0739c4de@skate>
References: <1369224304-24734-1-git-send-email-markos.chandras@gmail.com>
 <20130522141814.0739c4de@skate>
Message-ID: <CAG2jQ8gSz-q8PGJfoYbPMNfw_T74E3oFZduWniGHrsWMegL4AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 May 2013 13:18, Thomas Petazzoni
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

Hi Thomas,

I was not sure about this to be honest. This patch alone, does not
affect existing functionality so even though it's built in the c
library,
most packages will not use it. Moreover, it's unknown when the next
major uClibc version will be so we may have a problem if more
packages start using these functions in the future (a bit unlikely though).
I believe it's safe to use !BR2_TOOLCHAIN_BUILDROOT ||
BR2_UCLIBC_VERSION_SNAPSHOT for now, but we may have to
reconsider applying this patch in the future.

--
Regards,
Markos Chandras
