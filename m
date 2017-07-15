From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 10:16:12 +0200
Subject: [Buildroot] [PATCH 1/1] board/arcturus/ppc-ucp1020 new gcc-6.x
 Linux kernel build fix
In-Reply-To: <20170713163817.7114-1-oleks@arcturusnetworks.com>
References: <20170713163817.7114-1-oleks@arcturusnetworks.com>
Message-ID: <20170715101612.41c0b8f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 12:38:17 -0400, Oleksandr Zhadan wrote:
> Add the Linux-3.18 patch "powerpc/ptrace: Fix out of bounds array access warning" to the board/arcturus/ppc-ucp1020 BSP
> 
> " gcc-6 correctly warns about a out of bounds access
> 
> arch/powerpc/kernel/ptrace.c:407:24: warning: index 32 denotes an offset greater than size of 'u64[32][1] {aka long long unsigned int[32][1]}' [-Warray-bounds]
>         offsetof(struct thread_fp_state, fpr[32][0]));
>                         ^
> 
> check the end of array instead of beginning of next element to fix this"
> 
> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> ---
>  ...ce-Fix-out-of-bounds-array-access-warning.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/0003-powerpc-ptrace-Fix-out-of-bounds-array-access-warning.patch

Applied to master, after tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
