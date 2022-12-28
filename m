Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC10C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1408E815CD;
	Wed, 28 Dec 2022 19:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1408E815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsawRGA_-274; Wed, 28 Dec 2022 19:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7820B81584;
	Wed, 28 Dec 2022 19:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7820B81584
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7E331BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81FA9403A7
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81FA9403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22aHnJXCQhlv for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:53:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106DC402E0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 106DC402E0
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:53:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:58a9:4a7:c920:8cca])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 53B592003ED;
 Wed, 28 Dec 2022 20:53:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Dec 2022 20:53:54 +0100
Date: Wed, 28 Dec 2022 20:53:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20221228195354.GH2498764@scaer>
References: <20221217153729.545952-1-romain.naour@gmail.com>
 <20221217153729.545952-4-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221217153729.545952-4-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672257236;
 bh=gUwlA1srvj/xnkDx3B2i8Gr1qk2MJGh7NIQArddkwEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uNWfs6x/6oAtmFwM2vVRwY7Pw2wWZCn+fqVCkhXfAC/5ClJgx++nn1q52fJ0MwN3J
 TFT0JEtPkcAqYib6QSJFsdkyk5TPcSDLzcLkIuclYyroKIYwLXUmCaQXCzQ/FAfoHU
 bMtQ1YHdwbWrKJYv4CXRtw+UaAejsn+M9Kde5o4pgekmDDpZFygU81VgUQSWJ/6f2A
 t5j1dAqYca6VutwNqqvZffAKBSH1ypE+tcGpK4MqF3bxtoGoEcXFAnN8qIk9jqHZ7p
 TU+QcbL2+bCV8M1V4uYGCc0RxCzWLRcbN98Zjnwb0WfO6cRMrOdLyBdZGdQ32gwz3E
 nixUezSXrTBaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uNWfs6x/
Subject: Re: [Buildroot] [PATCH 4/4] package/qemu: bump to version 7.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-12-17 16:37 +0100, Romain Naour spake thusly:
> Changes log:
> https://wiki.qemu.org/ChangeLog/7.2
[--SNIP--]
> Revert a commit for sh4 since it introduce a regression
> that appear randomly when booting the kernel or running
> userspace application.

Instead, I've backported the relatively trivial fix:
    https://gitlab.com/qemu-project/qemu/-/commit/bc2331635ce18ff068d2bb1e493bc546e1f786e1

> [1] https://wiki.qemu.org/ChangeLog/7.2#Removal_of_the_.22slirp.22_submodule_.28affects_.22-netdev_user.22.29
> [2] https://gitlab.com/qemu-project/qemu/-/commit/5890258aeeba303704ec1adca415e46067800777
> [3] https://gitlab.com/kubu93/buildroot/-/jobs/3490258272
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, with the backport instead of the revert, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...evert-target-sh4-Fix-TB_FLAG_UNALIGN.patch | 500 ++++++++++++++++++
>  package/qemu/qemu.hash                        |   2 +-
>  package/qemu/qemu.mk                          |   6 +-
>  3 files changed, 505 insertions(+), 3 deletions(-)
>  create mode 100644 package/qemu/0003-Revert-target-sh4-Fix-TB_FLAG_UNALIGN.patch
> 
> diff --git a/package/qemu/0003-Revert-target-sh4-Fix-TB_FLAG_UNALIGN.patch b/package/qemu/0003-Revert-target-sh4-Fix-TB_FLAG_UNALIGN.patch
> new file mode 100644
> index 0000000000..8eab49d26f
> --- /dev/null
> +++ b/package/qemu/0003-Revert-target-sh4-Fix-TB_FLAG_UNALIGN.patch
> @@ -0,0 +1,500 @@
> +From ecc76769c9a885fd65bff4e4d291928da1416f58 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sat, 17 Dec 2022 16:19:53 +0100
> +Subject: [PATCH] Revert "target/sh4: Fix TB_FLAG_UNALIGN"
> +
> +This reverts commit ab419fd8a035a65942de4e63effcd55ccbf1a9fe.
> +
> +With this patch applied Qemu for sh4 is unstable and may randomly
> +crash:
> +
> +kernel:
> +Run /sbin/init as init process
> +Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> +
> +udhcp:
> +Segmentation fault
> +/usr/share/udhcpc/default.script: line 95: can't create : nonexistent directory
> +
> +Fixes:
> +https://gitlab.com/kubu93/buildroot/-/jobs/3490258272
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + linux-user/sh4/signal.c |  6 +--
> + target/sh4/cpu.c        |  6 +--
> + target/sh4/cpu.h        | 58 ++++++++++++--------------
> + target/sh4/helper.c     |  6 +--
> + target/sh4/translate.c  | 90 +++++++++++++++++++----------------------
> + 5 files changed, 77 insertions(+), 89 deletions(-)
> +
> +diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
> +index c4ba962708..f6a18bc6b5 100644
> +--- a/linux-user/sh4/signal.c
> ++++ b/linux-user/sh4/signal.c
> +@@ -161,7 +161,7 @@ static void restore_sigcontext(CPUSH4State *regs, struct target_sigcontext *sc)
> +     __get_user(regs->fpul, &sc->sc_fpul);
> + 
> +     regs->tra = -1;         /* disable syscall checks */
> +-    regs->flags = 0;
> ++    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
> + }
> + 
> + void setup_frame(int sig, struct target_sigaction *ka,
> +@@ -199,7 +199,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
> +     regs->gregs[5] = 0;
> +     regs->gregs[6] = frame_addr += offsetof(typeof(*frame), sc);
> +     regs->pc = (unsigned long) ka->_sa_handler;
> +-    regs->flags &= ~(TB_FLAG_DELAY_SLOT_MASK | TB_FLAG_GUSA_MASK);
> ++    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
> + 
> +     unlock_user_struct(frame, frame_addr, 1);
> +     return;
> +@@ -251,7 +251,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
> +     regs->gregs[5] = frame_addr + offsetof(typeof(*frame), info);
> +     regs->gregs[6] = frame_addr + offsetof(typeof(*frame), uc);
> +     regs->pc = (unsigned long) ka->_sa_handler;
> +-    regs->flags &= ~(TB_FLAG_DELAY_SLOT_MASK | TB_FLAG_GUSA_MASK);
> ++    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
> + 
> +     unlock_user_struct(frame, frame_addr, 1);
> +     return;
> +diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> +index 453268392b..bc75333916 100644
> +--- a/target/sh4/cpu.c
> ++++ b/target/sh4/cpu.c
> +@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
> +     SuperHCPU *cpu = SUPERH_CPU(cs);
> + 
> +     cpu->env.pc = tb_pc(tb);
> +-    cpu->env.flags = tb->flags;
> ++    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
> + }
> + 
> + static void superh_restore_state_to_opc(CPUState *cs,
> +@@ -72,10 +72,10 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
> +     SuperHCPU *cpu = SUPERH_CPU(cs);
> +     CPUSH4State *env = &cpu->env;
> + 
> +-    if ((env->flags & (TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND))
> ++    if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
> +         && env->pc != tb_pc(tb)) {
> +         env->pc -= 2;
> +-        env->flags &= ~(TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND);
> ++        env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
> +         return true;
> +     }
> +     return false;
> +diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> +index 727b829598..9f15ef913c 100644
> +--- a/target/sh4/cpu.h
> ++++ b/target/sh4/cpu.h
> +@@ -78,33 +78,26 @@
> + #define FPSCR_RM_NEAREST       (0 << 0)
> + #define FPSCR_RM_ZERO          (1 << 0)
> + 
> +-#define TB_FLAG_DELAY_SLOT       (1 << 0)
> +-#define TB_FLAG_DELAY_SLOT_COND  (1 << 1)
> +-#define TB_FLAG_DELAY_SLOT_RTE   (1 << 2)
> +-#define TB_FLAG_PENDING_MOVCA    (1 << 3)
> +-#define TB_FLAG_GUSA_SHIFT       4                      /* [11:4] */
> +-#define TB_FLAG_GUSA_EXCLUSIVE   (1 << 12)
> +-#define TB_FLAG_UNALIGN          (1 << 13)
> +-#define TB_FLAG_SR_FD            (1 << SR_FD)           /* 15 */
> +-#define TB_FLAG_FPSCR_PR         FPSCR_PR               /* 19 */
> +-#define TB_FLAG_FPSCR_SZ         FPSCR_SZ               /* 20 */
> +-#define TB_FLAG_FPSCR_FR         FPSCR_FR               /* 21 */
> +-#define TB_FLAG_SR_RB            (1 << SR_RB)           /* 29 */
> +-#define TB_FLAG_SR_MD            (1 << SR_MD)           /* 30 */
> +-
> +-#define TB_FLAG_DELAY_SLOT_MASK  (TB_FLAG_DELAY_SLOT |       \
> +-                                  TB_FLAG_DELAY_SLOT_COND |  \
> +-                                  TB_FLAG_DELAY_SLOT_RTE)
> +-#define TB_FLAG_GUSA_MASK        ((0xff << TB_FLAG_GUSA_SHIFT) | \
> +-                                  TB_FLAG_GUSA_EXCLUSIVE)
> +-#define TB_FLAG_FPSCR_MASK       (TB_FLAG_FPSCR_PR | \
> +-                                  TB_FLAG_FPSCR_SZ | \
> +-                                  TB_FLAG_FPSCR_FR)
> +-#define TB_FLAG_SR_MASK          (TB_FLAG_SR_FD | \
> +-                                  TB_FLAG_SR_RB | \
> +-                                  TB_FLAG_SR_MD)
> +-#define TB_FLAG_ENVFLAGS_MASK    (TB_FLAG_DELAY_SLOT_MASK | \
> +-                                  TB_FLAG_GUSA_MASK)
> ++#define DELAY_SLOT_MASK        0x7
> ++#define DELAY_SLOT             (1 << 0)
> ++#define DELAY_SLOT_CONDITIONAL (1 << 1)
> ++#define DELAY_SLOT_RTE         (1 << 2)
> ++
> ++#define TB_FLAG_PENDING_MOVCA  (1 << 3)
> ++#define TB_FLAG_UNALIGN        (1 << 4)
> ++
> ++#define GUSA_SHIFT             4
> ++#ifdef CONFIG_USER_ONLY
> ++#define GUSA_EXCLUSIVE         (1 << 12)
> ++#define GUSA_MASK              ((0xff << GUSA_SHIFT) | GUSA_EXCLUSIVE)
> ++#else
> ++/* Provide dummy versions of the above to allow tests against tbflags
> ++   to be elided while avoiding ifdefs.  */
> ++#define GUSA_EXCLUSIVE         0
> ++#define GUSA_MASK              0
> ++#endif
> ++
> ++#define TB_FLAG_ENVFLAGS_MASK  (DELAY_SLOT_MASK | GUSA_MASK)
> + 
> + typedef struct tlb_t {
> +     uint32_t vpn;		/* virtual page number */
> +@@ -265,7 +258,7 @@ static inline int cpu_mmu_index (CPUSH4State *env, bool ifetch)
> + {
> +     /* The instruction in a RTE delay slot is fetched in privileged
> +        mode, but executed in user mode.  */
> +-    if (ifetch && (env->flags & TB_FLAG_DELAY_SLOT_RTE)) {
> ++    if (ifetch && (env->flags & DELAY_SLOT_RTE)) {
> +         return 0;
> +     } else {
> +         return (env->sr & (1u << SR_MD)) == 0 ? 1 : 0;
> +@@ -373,10 +366,11 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
> + {
> +     *pc = env->pc;
> +     /* For a gUSA region, notice the end of the region.  */
> +-    *cs_base = env->flags & TB_FLAG_GUSA_MASK ? env->gregs[0] : 0;
> +-    *flags = env->flags
> +-            | (env->fpscr & TB_FLAG_FPSCR_MASK)
> +-            | (env->sr & TB_FLAG_SR_MASK)
> ++    *cs_base = env->flags & GUSA_MASK ? env->gregs[0] : 0;
> ++    *flags = env->flags /* TB_FLAG_ENVFLAGS_MASK: bits 0-2, 4-12 */
> ++            | (env->fpscr & (FPSCR_FR | FPSCR_SZ | FPSCR_PR))  /* Bits 19-21 */
> ++            | (env->sr & ((1u << SR_MD) | (1u << SR_RB)))      /* Bits 29-30 */
> ++            | (env->sr & (1u << SR_FD))                        /* Bit 15 */
> +             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
> + #ifdef CONFIG_USER_ONLY
> +     *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
> +diff --git a/target/sh4/helper.c b/target/sh4/helper.c
> +index e02e7af607..6a620e36fc 100644
> +--- a/target/sh4/helper.c
> ++++ b/target/sh4/helper.c
> +@@ -147,11 +147,11 @@ void superh_cpu_do_interrupt(CPUState *cs)
> +     env->sr |= (1u << SR_BL) | (1u << SR_MD) | (1u << SR_RB);
> +     env->lock_addr = -1;
> + 
> +-    if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
> ++    if (env->flags & DELAY_SLOT_MASK) {
> +         /* Branch instruction should be executed again before delay slot. */
> + 	env->spc -= 2;
> + 	/* Clear flags for exception/interrupt routine. */
> +-        env->flags &= ~TB_FLAG_DELAY_SLOT_MASK;
> ++        env->flags &= ~DELAY_SLOT_MASK;
> +     }
> + 
> +     if (do_exp) {
> +@@ -786,7 +786,7 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +         CPUSH4State *env = &cpu->env;
> + 
> +         /* Delay slots are indivisible, ignore interrupts */
> +-        if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
> ++        if (env->flags & DELAY_SLOT_MASK) {
> +             return false;
> +         } else {
> +             superh_cpu_do_interrupt(cs);
> +diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> +index 7db3468b01..eee0ca5484 100644
> +--- a/target/sh4/translate.c
> ++++ b/target/sh4/translate.c
> +@@ -175,13 +175,13 @@ void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> + 		    i, env->gregs[i], i + 1, env->gregs[i + 1],
> + 		    i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
> +     }
> +-    if (env->flags & TB_FLAG_DELAY_SLOT) {
> ++    if (env->flags & DELAY_SLOT) {
> +         qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
> + 		    env->delayed_pc);
> +-    } else if (env->flags & TB_FLAG_DELAY_SLOT_COND) {
> ++    } else if (env->flags & DELAY_SLOT_CONDITIONAL) {
> +         qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
> + 		    env->delayed_pc);
> +-    } else if (env->flags & TB_FLAG_DELAY_SLOT_RTE) {
> ++    } else if (env->flags & DELAY_SLOT_RTE) {
> +         qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
> +                      env->delayed_pc);
> +     }
> +@@ -223,7 +223,7 @@ static inline void gen_save_cpu_state(DisasContext *ctx, bool save_pc)
> + 
> + static inline bool use_exit_tb(DisasContext *ctx)
> + {
> +-    return (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) != 0;
> ++    return (ctx->tbflags & GUSA_EXCLUSIVE) != 0;
> + }
> + 
> + static bool use_goto_tb(DisasContext *ctx, target_ulong dest)
> +@@ -276,12 +276,12 @@ static void gen_conditional_jump(DisasContext *ctx, target_ulong dest,
> +     TCGLabel *l1 = gen_new_label();
> +     TCGCond cond_not_taken = jump_if_true ? TCG_COND_EQ : TCG_COND_NE;
> + 
> +-    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
> ++    if (ctx->tbflags & GUSA_EXCLUSIVE) {
> +         /* When in an exclusive region, we must continue to the end.
> +            Therefore, exit the region on a taken branch, but otherwise
> +            fall through to the next instruction.  */
> +         tcg_gen_brcondi_i32(cond_not_taken, cpu_sr_t, 0, l1);
> +-        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~TB_FLAG_GUSA_MASK);
> ++        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~GUSA_MASK);
> +         /* Note that this won't actually use a goto_tb opcode because we
> +            disallow it in use_goto_tb, but it handles exit + singlestep.  */
> +         gen_goto_tb(ctx, 0, dest);
> +@@ -307,14 +307,14 @@ static void gen_delayed_conditional_jump(DisasContext * ctx)
> +     tcg_gen_mov_i32(ds, cpu_delayed_cond);
> +     tcg_gen_discard_i32(cpu_delayed_cond);
> + 
> +-    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
> ++    if (ctx->tbflags & GUSA_EXCLUSIVE) {
> +         /* When in an exclusive region, we must continue to the end.
> +            Therefore, exit the region on a taken branch, but otherwise
> +            fall through to the next instruction.  */
> +         tcg_gen_brcondi_i32(TCG_COND_EQ, ds, 0, l1);
> + 
> +         /* Leave the gUSA region.  */
> +-        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~TB_FLAG_GUSA_MASK);
> ++        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~GUSA_MASK);
> +         gen_jump(ctx);
> + 
> +         gen_set_label(l1);
> +@@ -361,8 +361,8 @@ static inline void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
> + #define XHACK(x) ((((x) & 1 ) << 4) | ((x) & 0xe))
> + 
> + #define CHECK_NOT_DELAY_SLOT \
> +-    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {  \
> +-        goto do_illegal_slot;                       \
> ++    if (ctx->envflags & DELAY_SLOT_MASK) {  \
> ++        goto do_illegal_slot;               \
> +     }
> + 
> + #define CHECK_PRIVILEGED \
> +@@ -436,7 +436,7 @@ static void _decode_opc(DisasContext * ctx)
> +     case 0x000b:		/* rts */
> + 	CHECK_NOT_DELAY_SLOT
> + 	tcg_gen_mov_i32(cpu_delayed_pc, cpu_pr);
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT;
> ++        ctx->envflags |= DELAY_SLOT;
> + 	ctx->delayed_pc = (uint32_t) - 1;
> + 	return;
> +     case 0x0028:		/* clrmac */
> +@@ -458,7 +458,7 @@ static void _decode_opc(DisasContext * ctx)
> + 	CHECK_NOT_DELAY_SLOT
> +         gen_write_sr(cpu_ssr);
> + 	tcg_gen_mov_i32(cpu_delayed_pc, cpu_spc);
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT_RTE;
> ++        ctx->envflags |= DELAY_SLOT_RTE;
> + 	ctx->delayed_pc = (uint32_t) - 1;
> +         ctx->base.is_jmp = DISAS_STOP;
> + 	return;
> +@@ -513,15 +513,12 @@ static void _decode_opc(DisasContext * ctx)
> + 	return;
> +     case 0xe000:		/* mov #imm,Rn */
> + #ifdef CONFIG_USER_ONLY
> +-        /*
> +-         * Detect the start of a gUSA region (mov #-n, r15).
> +-         * If so, update envflags and end the TB.  This will allow us
> +-         * to see the end of the region (stored in R0) in the next TB.
> +-         */
> ++        /* Detect the start of a gUSA region.  If so, update envflags
> ++           and end the TB.  This will allow us to see the end of the
> ++           region (stored in R0) in the next TB.  */
> +         if (B11_8 == 15 && B7_0s < 0 &&
> +             (tb_cflags(ctx->base.tb) & CF_PARALLEL)) {
> +-            ctx->envflags =
> +-                deposit32(ctx->envflags, TB_FLAG_GUSA_SHIFT, 8, B7_0s);
> ++            ctx->envflags = deposit32(ctx->envflags, GUSA_SHIFT, 8, B7_0s);
> +             ctx->base.is_jmp = DISAS_STOP;
> +         }
> + #endif
> +@@ -547,13 +544,13 @@ static void _decode_opc(DisasContext * ctx)
> +     case 0xa000:		/* bra disp */
> + 	CHECK_NOT_DELAY_SLOT
> +         ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT;
> ++        ctx->envflags |= DELAY_SLOT;
> + 	return;
> +     case 0xb000:		/* bsr disp */
> + 	CHECK_NOT_DELAY_SLOT
> +         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
> +         ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT;
> ++        ctx->envflags |= DELAY_SLOT;
> + 	return;
> +     }
> + 
> +@@ -1197,7 +1194,7 @@ static void _decode_opc(DisasContext * ctx)
> + 	CHECK_NOT_DELAY_SLOT
> +         tcg_gen_xori_i32(cpu_delayed_cond, cpu_sr_t, 1);
> +         ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT_COND;
> ++        ctx->envflags |= DELAY_SLOT_CONDITIONAL;
> + 	return;
> +     case 0x8900:		/* bt label */
> + 	CHECK_NOT_DELAY_SLOT
> +@@ -1207,7 +1204,7 @@ static void _decode_opc(DisasContext * ctx)
> + 	CHECK_NOT_DELAY_SLOT
> +         tcg_gen_mov_i32(cpu_delayed_cond, cpu_sr_t);
> +         ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT_COND;
> ++        ctx->envflags |= DELAY_SLOT_CONDITIONAL;
> + 	return;
> +     case 0x8800:		/* cmp/eq #imm,R0 */
> +         tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, REG(0), B7_0s);
> +@@ -1391,14 +1388,14 @@ static void _decode_opc(DisasContext * ctx)
> +     case 0x0023:		/* braf Rn */
> + 	CHECK_NOT_DELAY_SLOT
> +         tcg_gen_addi_i32(cpu_delayed_pc, REG(B11_8), ctx->base.pc_next + 4);
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT;
> ++        ctx->envflags |= DELAY_SLOT;
> + 	ctx->delayed_pc = (uint32_t) - 1;
> + 	return;
> +     case 0x0003:		/* bsrf Rn */
> + 	CHECK_NOT_DELAY_SLOT
> +         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
> + 	tcg_gen_add_i32(cpu_delayed_pc, REG(B11_8), cpu_pr);
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT;
> ++        ctx->envflags |= DELAY_SLOT;
> + 	ctx->delayed_pc = (uint32_t) - 1;
> + 	return;
> +     case 0x4015:		/* cmp/pl Rn */
> +@@ -1414,14 +1411,14 @@ static void _decode_opc(DisasContext * ctx)
> +     case 0x402b:		/* jmp @Rn */
> + 	CHECK_NOT_DELAY_SLOT
> + 	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT;
> ++        ctx->envflags |= DELAY_SLOT;
> + 	ctx->delayed_pc = (uint32_t) - 1;
> + 	return;
> +     case 0x400b:		/* jsr @Rn */
> + 	CHECK_NOT_DELAY_SLOT
> +         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
> + 	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
> +-        ctx->envflags |= TB_FLAG_DELAY_SLOT;
> ++        ctx->envflags |= DELAY_SLOT;
> + 	ctx->delayed_pc = (uint32_t) - 1;
> + 	return;
> +     case 0x400e:		/* ldc Rm,SR */
> +@@ -1842,7 +1839,7 @@ static void _decode_opc(DisasContext * ctx)
> +     fflush(stderr);
> + #endif
> +  do_illegal:
> +-    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
> ++    if (ctx->envflags & DELAY_SLOT_MASK) {
> +  do_illegal_slot:
> +         gen_save_cpu_state(ctx, true);
> +         gen_helper_raise_slot_illegal_instruction(cpu_env);
> +@@ -1855,7 +1852,7 @@ static void _decode_opc(DisasContext * ctx)
> + 
> +  do_fpu_disabled:
> +     gen_save_cpu_state(ctx, true);
> +-    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
> ++    if (ctx->envflags & DELAY_SLOT_MASK) {
> +         gen_helper_raise_slot_fpu_disable(cpu_env);
> +     } else {
> +         gen_helper_raise_fpu_disable(cpu_env);
> +@@ -1870,23 +1867,23 @@ static void decode_opc(DisasContext * ctx)
> + 
> +     _decode_opc(ctx);
> + 
> +-    if (old_flags & TB_FLAG_DELAY_SLOT_MASK) {
> ++    if (old_flags & DELAY_SLOT_MASK) {
> +         /* go out of the delay slot */
> +-        ctx->envflags &= ~TB_FLAG_DELAY_SLOT_MASK;
> ++        ctx->envflags &= ~DELAY_SLOT_MASK;
> + 
> +         /* When in an exclusive region, we must continue to the end
> +            for conditional branches.  */
> +-        if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE
> +-            && old_flags & TB_FLAG_DELAY_SLOT_COND) {
> ++        if (ctx->tbflags & GUSA_EXCLUSIVE
> ++            && old_flags & DELAY_SLOT_CONDITIONAL) {
> +             gen_delayed_conditional_jump(ctx);
> +             return;
> +         }
> +         /* Otherwise this is probably an invalid gUSA region.
> +            Drop the GUSA bits so the next TB doesn't see them.  */
> +-        ctx->envflags &= ~TB_FLAG_GUSA_MASK;
> ++        ctx->envflags &= ~GUSA_MASK;
> + 
> +         tcg_gen_movi_i32(cpu_flags, ctx->envflags);
> +-        if (old_flags & TB_FLAG_DELAY_SLOT_COND) {
> ++        if (old_flags & DELAY_SLOT_CONDITIONAL) {
> + 	    gen_delayed_conditional_jump(ctx);
> +         } else {
> +             gen_jump(ctx);
> +@@ -2226,7 +2223,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
> +     }
> + 
> +     /* The entire region has been translated.  */
> +-    ctx->envflags &= ~TB_FLAG_GUSA_MASK;
> ++    ctx->envflags &= ~GUSA_MASK;
> +     ctx->base.pc_next = pc_end;
> +     ctx->base.num_insns += max_insns - 1;
> +     return;
> +@@ -2237,7 +2234,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
> + 
> +     /* Restart with the EXCLUSIVE bit set, within a TB run via
> +        cpu_exec_step_atomic holding the exclusive lock.  */
> +-    ctx->envflags |= TB_FLAG_GUSA_EXCLUSIVE;
> ++    ctx->envflags |= GUSA_EXCLUSIVE;
> +     gen_save_cpu_state(ctx, false);
> +     gen_helper_exclusive(cpu_env);
> +     ctx->base.is_jmp = DISAS_NORETURN;
> +@@ -2270,19 +2267,17 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> +                   (tbflags & (1 << SR_RB))) * 0x10;
> +     ctx->fbank = tbflags & FPSCR_FR ? 0x10 : 0;
> + 
> +-#ifdef CONFIG_USER_ONLY
> +-    if (tbflags & TB_FLAG_GUSA_MASK) {
> +-        /* In gUSA exclusive region. */
> ++    if (tbflags & GUSA_MASK) {
> +         uint32_t pc = ctx->base.pc_next;
> +         uint32_t pc_end = ctx->base.tb->cs_base;
> +-        int backup = sextract32(ctx->tbflags, TB_FLAG_GUSA_SHIFT, 8);
> ++        int backup = sextract32(ctx->tbflags, GUSA_SHIFT, 8);
> +         int max_insns = (pc_end - pc) / 2;
> + 
> +         if (pc != pc_end + backup || max_insns < 2) {
> +             /* This is a malformed gUSA region.  Don't do anything special,
> +                since the interpreter is likely to get confused.  */
> +-            ctx->envflags &= ~TB_FLAG_GUSA_MASK;
> +-        } else if (tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
> ++            ctx->envflags &= ~GUSA_MASK;
> ++        } else if (tbflags & GUSA_EXCLUSIVE) {
> +             /* Regardless of single-stepping or the end of the page,
> +                we must complete execution of the gUSA region while
> +                holding the exclusive lock.  */
> +@@ -2290,7 +2285,6 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> +             return;
> +         }
> +     }
> +-#endif
> + 
> +     /* Since the ISA is fixed-width, we can bound by the number
> +        of instructions remaining on the page.  */
> +@@ -2315,8 +2309,8 @@ static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
> +     DisasContext *ctx = container_of(dcbase, DisasContext, base);
> + 
> + #ifdef CONFIG_USER_ONLY
> +-    if (unlikely(ctx->envflags & TB_FLAG_GUSA_MASK)
> +-        && !(ctx->envflags & TB_FLAG_GUSA_EXCLUSIVE)) {
> ++    if (unlikely(ctx->envflags & GUSA_MASK)
> ++        && !(ctx->envflags & GUSA_EXCLUSIVE)) {
> +         /* We're in an gUSA region, and we have not already fallen
> +            back on using an exclusive region.  Attempt to parse the
> +            region into a single supported atomic operation.  Failure
> +@@ -2336,9 +2330,9 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
> + {
> +     DisasContext *ctx = container_of(dcbase, DisasContext, base);
> + 
> +-    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
> ++    if (ctx->tbflags & GUSA_EXCLUSIVE) {
> +         /* Ending the region of exclusivity.  Clear the bits.  */
> +-        ctx->envflags &= ~TB_FLAG_GUSA_MASK;
> ++        ctx->envflags &= ~GUSA_MASK;
> +     }
> + 
> +     switch (ctx->base.is_jmp) {
> +-- 
> +2.38.1
> +
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index 06d090bd1d..e671e1d184 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,4 +1,4 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256  a0634e536bded57cf38ec8a751adb124b89c776fe0846f21ab6c6728f1cbbbe6  qemu-7.1.0.tar.xz
> +sha256  5b49ce2687744dad494ae90a898c52204a3406e84d072482a1e1be854eeb2157  qemu-7.2.0.tar.xz
>  sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index d42a16ec3e..05e1cef1d8 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QEMU_VERSION = 7.1.0
> +QEMU_VERSION = 7.2.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = http://download.qemu.org
>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
> @@ -68,7 +68,7 @@ QEMU_OPTS += --enable-vhost-user
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QEMU_SLIRP),y)
> -QEMU_OPTS += --enable-slirp=system
> +QEMU_OPTS += --enable-slirp
>  QEMU_DEPENDENCIES += slirp
>  else
>  QEMU_OPTS += --disable-slirp
> @@ -256,6 +256,7 @@ HOST_QEMU_DEPENDENCIES = host-libglib2 \
>  	host-pixman \
>  	host-pkgconf \
>  	host-python3 \
> +	host-slirp \
>  	host-zlib
>  
>  #       BR ARCH         qemu
> @@ -400,6 +401,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--disable-vnc-jpeg \
>  		--disable-png \
>  		--disable-vnc-sasl \
> +		--enable-slirp \
>  		--enable-tools \
>  		$(HOST_QEMU_OPTS)
>  endef
> -- 
> 2.38.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
