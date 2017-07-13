From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 15:38:09 +0200
Subject: [Buildroot] [PATCH 1/1] configs/arcturus_ucp1020_defconfig
In-Reply-To: <c171cf9c-b0f7-e065-e3b9-41ca3678bdff@arcturusnetworks.com>
References: <20170712183103.30139-1-oleks@arcturusnetworks.com>
 <20170713094219.1750fab7@windsurf.orange-hotspot.com>
 <c171cf9c-b0f7-e065-e3b9-41ca3678bdff@arcturusnetworks.com>
Message-ID: <20170713153809.5d51faba@windsurf.orange-hotspot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 09:31:25 -0400, Oleksandr G Zhadan wrote:

> >> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>  
> > What failure do you have when building the Linux kernel ?  
> 
> In file included from include/linux/linkage.h:4:0,
>                   from include/linux/kernel.h:6,
>                   from arch/powerpc/kernel/ptrace.c:18:
> arch/powerpc/kernel/ptrace.c: In function ?fpr_get?:
> arch/powerpc/kernel/ptrace.c:379:24: error: index 32 denotes an offset 
> greater than size of ?u64[32][1] {aka long long unsigned int[32][1]}? 
> [-Werror=array-bounds]
>          offsetof(struct thread_fp_state, fpr[32][0]));
> ....
> 
> arch/powerpc/kernel/ptrace.c: In function ?fpr_set?:
> arch/powerpc/kernel/ptrace.c:407:24: error: index 32 denotes an offset 
> greater than size of ?u64[32][1] {aka long long unsigned int[32][1]}? 
> [-Werror=array-bounds]
>          offsetof(struct thread_fp_state, fpr[32][0]));

Then could you please backport Linux kernel commit
1e407ee3b21f981140491d5b8a36422979ca246f instead? It should fix this
build issue.

> > Thomas  
> P.S.
> Did you have a chance to look into our "[Buildroot][PATCH v4 1/1] 
> configs/arcturus_ucls1012a: new defconfig" patch from 07/06/2017 05:13 PM.

I had a brief look, it looked good. I'll review more carefully, and
hopefully apply it as time permits.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
