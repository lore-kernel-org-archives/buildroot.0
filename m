From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 17:41:01 +0100
Subject: [Buildroot] [PATCHv3 01/15] directfb: bump to 1.7.7
In-Reply-To: <55E9C2A6.70504@mind.be>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441144876-2628-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <55E9B048.8070704@imgtec.com> <55E9C2A6.70504@mind.be>
Message-ID: <55E9C99D.40807@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On 04/09/15 17:11, Arnout Vandecappelle wrote:
>   Hi Vicente,
>
> On 04-09-15 16:52, Vicente Olivert Riera wrote:
>> Dear Thomas Petazzoni,
>>
>> On 09/01/2015 11:01 PM, Thomas Petazzoni wrote:
>>> In addition to doing the bump, this commit changes the --enable-fusion
>>> option to --enable-multi-kernel, as was renamed upstream.
>>>
>>> The patches were just refreshed, except
>>> 0003-remove-redefinition-of-__typeof__.patch, which was removed since
>>> it was a backport from upstream, and is therefore now part of DirectFB
>>> 1.7.7.
>>>
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [snip]
>> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
>   Thanks for all these reviews and tests! However, it would be more convenient if
> you could put the tag just below the Sob (like now) so we don't have to scroll
> all the way to the bottom to see what you're saying.

Ok, sorry. I will do it in that way from now on. Thanks.

>
>>
>> Compile test for MIPS architecture:
>>
>> $ grep ^DIRECTFB_VERSION package/directfb/directfb.mk
>> DIRECTFB_VERSION_MAJOR = 1.7
>> DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
>>
>> $ file
>> output/target/usr/lib/directfb-1.7-7-pure/systems/libdirectfb_fbdev.so
>> output/target/usr/lib/directfb-1.7-7-pure/systems/libdirectfb_fbdev.so:
>> ELF 32-bit MSB shared object, MIPS, MIPS32 rel2 version 1 (SYSV),
>> dynamically linked, with unknown capability 0x41000000 = 0xf676e75, with
>> unknown capability 0x10000 = 0x70401, stripped
>
>   BTW, what do you want to show with this information?

In the first command I want to state that I was using the right directfb 
version (this is a version bump patch).

In the second one I want to state that the package was successfully 
installed (and therefore built) in $(TARGET_DIR). It also states that it 
was built for the right architecture. Sometimes the packages don't 
install any native binary file so the file command can't state the 
second part.

Regards,

Vincent.

>
>
>   Regards,
>   Arnout
>
>>
>> Regards,
>>
>> Vincent.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
