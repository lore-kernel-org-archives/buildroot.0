From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 14 Jun 2012 00:44:29 +0200
Subject: [Buildroot] [PATCH v3 2/6] target: add symbols for PowerPC cpu
	features
In-Reply-To: <21f5fa71e486cd00a487bb6b6d201344@zacarias.com.ar>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-5-git-send-email-s.martin49@gmail.com>
 <4FD6DE65.8080103@mind.be>
 <21f5fa71e486cd00a487bb6b6d201344@zacarias.com.ar>
Message-ID: <CAHXCMM+QDPv=oQ+Sqky04VQM_4xJn_AG55L3f2dTT0dnXTAHDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Gustavoz,

2012/6/12 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> On 2012-06-12 03:15, Arnout Vandecappelle wrote:
>
>> On 06/10/12 13:46, Samuel Martin wrote:
>>>
>>> +# PowerPC cpu features
>>> +config BR2_POWERPC_CPU_G3
>>> + ? ? ? bool
>>> +config BR2_POWERPC_CPU_G4
>>> + ? ? ? bool
>>> +config BR2_POWERPC_CPU_G5
>>> + ? ? ? bool
>>
>>
>> ?I was expecting Altivec here, not the PowerPC CPU generations... ?These
>> CPU
>> features are relevant mostly to allow libraries to select optimized
>> assembly
>> code, and I don't see much use of G5-specific assembly. ?And anyway, the
>> -mcpu options for a particular CPU are already passed by buildroot.
I would expect nothing less ;-)

>>
>> ?Regards,
>> ?Arnout
>
>
> Also the G5 is 64-bit capable so one might expect some issues down the line
> since we're not ppc64-capable at the moment.
> Regards.
>

So, to sum up and make the relation with the question I asked on the
pacth 6/6 of the serie, you suggest I always turn off the
ENABLE_POWERPC option in the opencv package. That's it?

BTW, I can add an Altivec symbol, and let you (or others) use it in
packages that may take benefit from such optimization.
Let me know...

Regards,

-- 
Sam
