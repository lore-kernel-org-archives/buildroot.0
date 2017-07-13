From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Thu, 13 Jul 2017 09:31:25 -0400
Subject: [Buildroot] [PATCH 1/1] configs/arcturus_ucp1020_defconfig
In-Reply-To: <20170713094219.1750fab7@windsurf.orange-hotspot.com>
References: <20170712183103.30139-1-oleks@arcturusnetworks.com>
 <20170713094219.1750fab7@windsurf.orange-hotspot.com>
Message-ID: <c171cf9c-b0f7-e065-e3b9-41ca3678bdff@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
On 07/13/2017 03:42 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 12 Jul 2017 14:31:03 -0400, Oleksandr Zhadan wrote:
>
>> Back to the BR2_GCC_VERSION_4_9_X, because the default/latest GCC fails to build the Linux kernel.
>>
>> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> What failure do you have when building the Linux kernel ?

In file included from include/linux/linkage.h:4:0,
                  from include/linux/kernel.h:6,
                  from arch/powerpc/kernel/ptrace.c:18:
arch/powerpc/kernel/ptrace.c: In function ?fpr_get?:
arch/powerpc/kernel/ptrace.c:379:24: error: index 32 denotes an offset 
greater than size of ?u64[32][1] {aka long long unsigned int[32][1]}? 
[-Werror=array-bounds]
         offsetof(struct thread_fp_state, fpr[32][0]));
....

arch/powerpc/kernel/ptrace.c: In function ?fpr_set?:
arch/powerpc/kernel/ptrace.c:407:24: error: index 32 denotes an offset 
greater than size of ?u64[32][1] {aka long long unsigned int[32][1]}? 
[-Werror=array-bounds]
         offsetof(struct thread_fp_state, fpr[32][0]));

>
> Thomas
P.S.
Did you have a chance to look into our "[Buildroot][PATCH v4 1/1] 
configs/arcturus_ucls1012a: new defconfig" patch from 07/06/2017 05:13 PM.

Thank you,

Oleks
