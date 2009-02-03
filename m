From: Maxim Grigoriev <maxim@tensilica.com>
Date: Tue, 03 Feb 2009 15:51:16 -0800
Subject: [Buildroot] {buildroot 0004384]: GCC 4.3.1 fails with cannot
 compute suffix of object files
In-Reply-To: <20090203233438.203590@gmx.net>
References: <4983870C.6010607@hq.tensilica.com>
	<4985F291.5010002@hq.tensilica.com> <20090203233438.203590@gmx.net>
Message-ID: <4988D874.6010305@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think setting LD_LIBRARY_PATH as an extra step is unacceptable,
even though, it works nice.

I'm working on this. I will definitely share my results,
when I have a reasonable solution.

-- Maxim


S0L0 at gmx-topmail.de wrote:
> I have the same problem. Build fails and I can not find the patchfile. :(
>
> I would be very glad, too hear something regarding this issue.
>
> S0l0
> -------- Original-Nachricht --------
>   
>> Datum: Sun, 01 Feb 2009 11:05:53 -0800
>> Von: Maxim Grigoriev <maxim@tensilica.com>
>> An: Maxim Grigoriev <maxim@tensilica.com>
>> CC: buildroot at uclibc.org
>> Betreff: Re: [Buildroot] {buildroot 0004384]: GCC 4.3.1 fails with cannot compute suffix of object files
>>     
>
>   
>> Is this the right mailing list to ask questions about BUILDROOT ?
>>
>> Should I ask some official maintainers directly instead ?
>>
>> If there is a communication policy described somewhere, please, refer me 
>> to it.
>>
>> Thanks,
>> -- Maxim
>>
>>
>> Maxim Grigoriev wrote:
>>     
>>> There is a buildroot issue 0004384:
>>>
>>>    
>>>       
>> http://lists.uclibc.org/pipermail/buildroot/2008-September/010792.html
>>     
>>> I understand it's a generic architecture-independent GCC 4.3.1+ compiler
>>> problem
>>> mentioned several times in different places ( e.g. bugzilla PRs 35577, 
>>> 35693 ).
>>>
>>> On the buildroot mailing, list I found a reference to the patch
>>>
>>>   gcc-4.3.1-compile.patch 
>>>
>>> introduced by "antezedens" somewhere around 09-10-08.
>>> But, I was not able to find this patch. Looks like it was withdrawn.
>>>
>>>                           * * * * *
>>>
>>> My question is: is this build failure supposed to be fixed on
>>> the BUILDROOT makefiles/scripts level ? Or, setting 
>>>
>>> LD_LIBRARY_PATH=$PWD/toolchain_build_arm/mpfr/lib:$LD_LIBRARY_PATH
>>>
>>> from the top of buildroot tree is assumed to be a standard
>>> setup for the buildroot build ? Is it documented anywhere ?
>>>
>>> Thanks,
>>> -- Maxim
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>   
>>>       
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>     
>
>   
