From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Aug 2016 17:59:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/rt-tests: remove
 sched_setattr/sched_getattr API for SuperH arch
In-Reply-To: <20160809183029.GG845@tarshish>
References: <1470607398-8644-1-git-send-email-romain.naour@gmail.com>
 <20160808044245.GM3873@tarshish>
 <8216095c-f7c2-a862-c685-fe11e2bd2f32@gmail.com>
 <20160809183029.GG845@tarshish>
Message-ID: <a97fdbb0-51c5-04c8-8960-4a58ebce9565@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 09/08/2016 ? 20:30, Baruch Siach a ?crit :
> Hi Romain,
> 
> On Tue, Aug 09, 2016 at 12:34:24PM +0200, Romain Naour wrote:
>> Le 08/08/2016 ? 06:42, Baruch Siach a ?crit :
>>> On Mon, Aug 08, 2016 at 12:03:17AM +0200, Romain Naour wrote:
>>>> This commit remove rt-sched.o from librttest and pi_stress test program
>>>> only for SuperH arch which doesn't have __NR_sched_setattr and
>>>> __NR_sched_getattr syscalls defined.
>>>>
>>>> Patch [1] adding these syscalls has not been merged in upstream kernel
>>>> (4.7).
>>>
>>> But these syscalls were added for 4.8-rc1 (commit 74bdaa611fa69). This 
>>> solution prevents sched_{set,get}attr use even for future v4.8+ kernels.
>>
>> Thanks for this info, I haven't checked the upcoming 4.8 kernel.
>>
>> However, it means that pi_stress should depends on BR2_sh and
>> BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8. But this symbol doesn't exist yet in Buildroot.
>>
>> I think this patch can be commited as is (kernel 4.8 will be released after
>> 2016.08) and the dependency on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8 can be added
>> in a follow up patch.
> 
> Alternatively, you may patch src/include/rt-sched.h to add sh syscall numbers, 
> in addition to the existing i386, x86_64, and ARM ones. That would fix the 
> current build issue, and would also be future proof. Such a patch might even 
> be acceptable upstream.

Ok thanks, I'll do that.
I think I'll keep the kernel headers dependency on 3.14 since the next rt-tests
version will add two new test program for SCHED_DEADLINE (cyclicdeadline and
deadline_test). So RT_TESTS_REMOVE_RT_SCHED_API would be updated on each version
bump.

Best regards,
Romain

> 
> baruch
> 
