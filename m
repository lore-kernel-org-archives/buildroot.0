From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 May 2014 08:41:25 +0200
Subject: [Buildroot] [PATCH 1/2] powerpc64 powerpc64le: add support
In-Reply-To: <CAPoQQ-2Xq7MSaH4AH4mRpzj0dQayaHGiOcK10KBSwqoiFKkzqQ@mail.gmail.com>
References: <1399796286-14822-1-git-send-email-cody@linux.vnet.ibm.com>
 <536F65CD.4070901@zacarias.com.ar>
 <CAPoQQ-2Xq7MSaH4AH4mRpzj0dQayaHGiOcK10KBSwqoiFKkzqQ@mail.gmail.com>
Message-ID: <53706D15.2060404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/14 22:44, Cody P Schafer wrote:
> You're right, that ALTIVEC selection needs to be removed.

 Please don't top-post.

> 
> On Sun, May 11, 2014 at 4:58 AM, Gustavo Zacarias
> <gustavo@zacarias.com.ar> wrote:
>> On 05/11/2014 05:18 AM, Cody P Schafer wrote:
>>
>>>  config BR2_generic_powerpc
>>>       bool "generic"
>>> +     select BR2_POWERPC_CPU_HAS_ALTIVEC if BR2_ARCH_IS_64
>>
>>> +config BR2_powerpc_power4
>>> +     bool "power4"
>>> +config BR2_powerpc_power5
>>> +     bool "power5"
>>
>> Generic has altivec and power4/5 don't?
>> That doesn't sound right, generic should be the lowest common denominator...

 Looks OK to me though. I do think that all 64-bit PowerPC platforms have
Altivec, so the generic of powerpc64 and powerpc64le should indeed enable Altivec.

 Remember that we're reusing the same symbols here for the three ppc architectures.

 Regards,
 Arnout

>> Regards.
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
