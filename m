From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Thu, 13 Jul 2017 15:21:08 -0400
Subject: [Buildroot] [PATCH 1/1] board/arcturus/ppc-ucp1020 new gcc-6.x
 Linux kernel build fix
In-Reply-To: <20170713193059.08c08974@windsurf>
References: <20170713163817.7114-1-oleks@arcturusnetworks.com>
 <20170713193059.08c08974@windsurf>
Message-ID: <940b0331-fb4e-e75d-b747-f9c282491c24@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On 07/13/2017 01:30 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 13 Jul 2017 12:38:17 -0400, Oleksandr Zhadan wrote:
>> Add the Linux-3.18 patch "powerpc/ptrace: Fix out of bounds array access warning" to the board/arcturus/ppc-ucp1020 BSP
>>
>> " gcc-6 correctly warns about a out of bounds access
>>
>> arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}' [-Warray-bounds]
>>          offsetof(struct thread_fp_state, fpr[32][0]));
>>                          ^
>>
>> check the end of array instead of beginning of next element to fix this"
>>
>> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Do you have a good reason to stick with the 4.1 Linux kernel in this
> defconfig, instead of upgrading to a newer kernel version that has
> commit 1e407ee3b21f981140491d5b8a36422979ca246f ? For example, using
> Linux 4.9 would solve this.

Yes, uprating to newer kernel is on our list. And we know that it is a 
fix there.
But, It will take some time to re-test all ours and our existing 
customers apps. And as usually we do not have that time now ;-).
For now we would like to fix uCP1020 buildroot build in any way: or by 
downgrading GCC or with that Linux-3.18 patch.
Please apply any of the patches and when we will be ready we will send 
another, new "kernel patch".

Thank you,

Oleks

>
> Best regards,
>
> Thomas


-- 
Oleksandr Zhadan
Sr. Software Engineer
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
