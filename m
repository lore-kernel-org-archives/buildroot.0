From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Feb 2014 08:18:25 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-07
In-Reply-To: <20140210210752.641364a8@skate>
References: <20140208073009.5C3E6100CDC@stock.ovh.net>	<20140208124907.GA3442@free.fr>	<20140210093158.1dc26780@skate>	<CAAXf6LVr18TkjCX_APQOabr6idsUMCRgrqxTL69yHO=2XJSugA@mail.gmail.com>	<52F90EE4.1060103@mind.be>
 <20140210210752.641364a8@skate>
Message-ID: <52F9CEC1.2030200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 21:07, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Mon, 10 Feb 2014 18:39:48 +0100, Arnout Vandecappelle wrote:
> 
>>>> This one I agree is old. The question is: how do I exclude this package
>>>> from being built. Should we introduce hidden Config.in bools for kernel
>>>> header versions, so that the packages that need at least the kernel
>>>> headers from kernel X.Y are not visible if you have a too old
>>>> toolchain? Those bools would be set by linux-headers/Config.in for the
>>>> internal backend, automatically set for the well-known external
>>>> toolchains, and a custom choice for special external toolchains.
>>>
>>> I think we should indeed implement a mechanism to restrict packages
>>> based on kernel headers.
>>> There have been many packages that require recent kernel headers, and
>>> it is not feasible to fix all these packages individually. Forcing the
>>> user to update their kernel headers or toolchain is not unreasonable,
>>> and otherwise they are always welcome to propose a patch for a
>>> particular package, or discuss the matter upstream.
>>>
>>> The solution you propose seems a good idea to me and not too complex.
>>
>>  I had also thought about this option already. However, I expect the "not
>> too complex" is not entirely true: you probably want symbols from
>> something like 2.6.36 up to 3.13... Hm, that's just 20 symbols, maybe not
>> so bad after all. However, for custom external toolchains and for custom
>> kernel headers, all of these have to be made visible as well, so that
>> adds another 20 symbols...
> 
> True, but I don't really see another solution that solves the problem
> at hand...

 Neither do I.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
