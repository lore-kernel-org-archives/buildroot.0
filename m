From: Martin Kelly <martin@surround.io>
Date: Tue, 17 May 2016 16:54:24 -0700
Subject: [Buildroot] [PATCH] Config.in: add -Og option
In-Reply-To: <573A5995.6020201@surround.io>
References: <1463183826-28562-1-git-send-email-martin@surround.io>
 <20160514142558.70fb92f4@free-electrons.com> <573A5995.6020201@surround.io>
Message-ID: <573BAF30.3060404@surround.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/16/2016 04:36 PM, Martin Kelly wrote:
> On 05/14/2016 05:25 AM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Fri, 13 May 2016 16:57:06 -0700, Martin Kelly wrote:
>>> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
>>> which can be useful for when you want optimized code that is nonetheless
>>> debuggable.
>>>
>>> Signed-off-by: Martin Kelly <martin@surround.io>
>>
>> Thanks for submitting this patch. I had never heard of -Og, but it
>> seems like a useful addition.
>>
>>> +config BR2_OPTIMIZE_g
>>> +    bool "optimize debugging experience"
>>> +    select BR2_HOST_GCC_AT_LEAST_4_8
>>
>> select? You can't select an option such as BR2_HOST_GCC_AT_LEAST_4_8.
>> How could Buildroot *force* the host machine to have gcc >= 4.8 ?
>>
>> In addition, using BR2_HOST_GCC_AT_LEAST_4_8 is wrong here: what we
>> care about is the version of the *target* compiler, not the version of
>> the host compiler.
>>
>> So this line should instead be:
>>
>>     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>>
>
> Thanks, I agree. I wasn't sure whether to use select or depends. In
> hindsight, I should have checked, but I'll fix up the patch and send a
> revision.
>

I sent a revised patch to the list. Please tell me if you notice 
anything else to fix up.
