From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 14 Nov 2017 10:05:28 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <fbbec566-444f-39de-d23e-6b50de62294e@grandegger.com>
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home> <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
 <87d14ms2x2.fsf@dell.be.48ers.dk> <20171113173611.GB2861@scaer>
 <d632b876-9cbe-bbec-5195-d383b6ebd440@grandegger.com>
 <20171113203343.GC2861@scaer>
 <fbbec566-444f-39de-d23e-6b50de62294e@grandegger.com>
Message-ID: <c56927b6-b854-36cb-5329-0e3f42f92ce7@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 14.11.2017 um 09:00 schrieb Wolfgang Grandegger:
> Hello,
> 
> Am 13.11.2017 um 21:33 schrieb Yann E. MORIN:
>> On 2017-11-13 19:04 +0100, Wolfgang Grandegger spake thusly:
>>> Hello,
>>>
>>> Am 13.11.2017 um 18:36 schrieb Yann E. MORIN:
>>>> Peter, All,
>>>>
>>>> On 2017-11-13 14:50 +0100, Peter Korsgaard spake thusly:
>>>>>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
>>>>> ?? > This means: A symbolic link would work.
>>>>> Ok, great - Makes sense. I wonder how much effort it wil be to get
>>>>> binutils to generate symbolic links instead of hard links.
>>>>
>>>> No way.
>>>
>>> Well, the attached patch fixes the issue with the binary utilities (ld,
>>> ar, objdump, as, ...). I think only the fixes in 
>>> "binutils/Makefile.in" and
>>> "gas/Makefile.in" are need, IIRC. And in the fixes did not break the
>>> build, at least. Will do more checks...
>>
>> Well, what I meant is that there are no --disable-hardlinks on the
>> ocnfigure command line.
>>
>> And don;t forget that we do have 4 versions of binutils to patch.
>>
>> And as Peter said: if we patch, we should try to get that upstreamable.
>> Maybe upstream will be receptive to that. Or maybe not. Who knows...
>>
>> I think providing a post-install hook is better than patching.
> 
> I agree.

You mean post-install for the "binutil" packages only? A generic 
solution would be better, but not straight-forward, unfortunately.

Do we want to have symbolic instead of hard links or is a special RPATH 
with directories for all hard linked ELF files acceptable?

Wolfgang.
