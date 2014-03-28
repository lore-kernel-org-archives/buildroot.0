From: Joshua Kinard <kumba@gentoo.org>
Date: Fri, 28 Mar 2014 06:52:55 -0400
Subject: [Buildroot] [PATCH v3] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <533551D2.2010003@imgtec.com>
References: <1395843340-18539-1-git-send-email-Vincent.Riera@imgtec.com>
 <53330BEB.3090206@mind.be> <5333165D.90100@imgtec.com>
 <87txakk5tr.fsf@dell.be.48ers.dk> <5333F5E6.1040604@imgtec.com>
 <5334BC27.5000400@gentoo.org> <53354619.70905@imgtec.com>
 <53354EAD.2060907@imgtec.com> <5335510C.3090006@imgtec.com>
 <533551D2.2010003@imgtec.com>
Message-ID: <53355487.3010401@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/28/2014 06:41, Markos Chandras wrote:
> On 03/28/2014 10:38 AM, Vicente Olivert Riera wrote:
>> On 03/28/2014 10:27 AM, Markos Chandras wrote:
>>> On 03/28/2014 09:51 AM, Vicente Olivert Riera wrote:
>>>> On 03/28/2014 12:02 AM, Joshua Kinard wrote:
>>>>> On 03/27/2014 05:56, Vicente Olivert Riera wrote:
>>>>>> On 03/26/2014 09:28 PM, Peter Korsgaard wrote:
>>>>>>>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>>>>>>>>>> writes:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>>    >>> +config BR2_MIPS_OABI32
>>>>>>>    >>> +    bool
>>>>>>>    >>> +    default y        if BR2_mips || BR2_mipsel
>>>>>>>    >>> +    default n        if BR2_mips64 || BR2_mips64el
>>>>>>>    >>
>>>>>>>    >> Did you forget to remove this or is there a reason to keep it?
>>>>>>> In the
>>>>>>>    >> latter case, please add an explanatory comment.
>>>>>>>
>>>>>>>    > Why would I want to remove this? The BR2_MIPS_OABI32 symbol is
>>>>>>> used by
>>>>>>>    > glibc and uclibc packages.
>>>>>>>
>>>>>>> Arnout is just asking about the 'default n' line. Symbols are 'n' by
>>>>>>> default, so the line doesn't do anything as far as I can see.
>>>>>>>
>>>>>>
>>>>>> I have maintained that line because if you remove it and then select
>>>>>> any
>>>>>> MIPS64 target, the "# BR2_MIPS_OABI32 is not set" is not present on
>>>>>> the
>>>>>> .config file.
>>>>>>
>>>>>> Isn't that a problem?
>>>>>
>>>>> Is the definition of BR2_MIPS_OABI32 missing completely, or do you see
>>>>> "BR2_MIPS_OABI32=y"?  If it's missing completely, then it's virtually
>>>>> the
>>>>> same as it being there as a comment, which will get stripped
>>>>> out/ignored by
>>>>> the build system.  Kconfig/Kbuild (whatever it is called) only cares
>>>>> if the
>>>>> symbol is defined to "y".  I believe that is then checked for in
>>>>> Makefiles
>>>>> and is in a generated config.h file for use as a C #define.
>>>>>
>>>>> That's how it works in the Linux kernel at least...
>>>>
>>>> If you remove the "default 'n'" line, and you select a MIPS64 target,
>>>> then "BR2_MIPS_OABI32=y" is completely missing in the .config file.
>>>>
>>>>
>>>
>>> That's not a problem is it? It's ok if the line is missing. A missing
>>> line means "this option is not available". A line starting with "#"
>>> means "the option is available but currently disabled"
>>
>> I want to be sure about that, because there are packages which use the
>> BR2_MIPS_OABI32 symbol. So, maybe having that line starting with "#"
>> means BR2_MIPS_OABI32=n, and everything works fine, and don't having
>> that line at all means that symbol is not defined and the packages which
>> use that symbol fail because of that. That's what I want to know.
>>
> 
> I think not having that line, or having that line but prefixed with "#" is
> the same thing as far as the Kconfig dependencies are concerned.
> (pretty much what Joshua said already)

Yup, it's just a comment and for human consumption only.  It's just a way of
telling you, when you read the config file, that the option is disabled.

-- 
Joshua Kinard
Gentoo/MIPS
kumba at gentoo.org
4096R/D25D95E3 2011-03-28

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
