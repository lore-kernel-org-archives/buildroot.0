Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09711C77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 20:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7549E81EC8;
	Sun, 23 Apr 2023 20:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7549E81EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSWrtznzKWBT; Sun, 23 Apr 2023 20:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABDB81EC5;
	Sun, 23 Apr 2023 20:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ABDB81EC5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D23AF1C2B12
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 20:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA8E860BB9
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 20:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8E860BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Q4zw7ck-LFP for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 20:31:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 273E760AD5
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 273E760AD5
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 20:31:56 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qgNFpwCyGPQ3fqgNFpwdoW; Sun, 23 Apr 2023 22:31:53 +0200
Message-ID: <e0b77340-42d5-0783-3000-0cd4c08c2022@benettiengineering.com>
Date: Sun, 23 Apr 2023 22:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, it
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <CABGWkvoH-sy4LhPtWgY422FXm6pQ9UR5eM63nV-LAmEf1FRFng@mail.gmail.com>
 <80825E70-9D48-471F-AFF1-F43E71FBB045@benettiengineering.com>
 <CABGWkvpm3iydDjbkVbaw3dTe4kogD-SfyMt6sAz9UDGXSQe2eg@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CABGWkvpm3iydDjbkVbaw3dTe4kogD-SfyMt6sAz9UDGXSQe2eg@mail.gmail.com>
X-CMAE-Envelope: MS4xfKfqyJqwYHjo9HwXtl4ydCHNA/FUpt3bjdPs/dm9qbHk/Z0qgvFsEmCPBRbrs0jFRZdWDR9+oeGUXTlX4abesUp8fbYZYdRitaLz/v4kgy7qy7745wVD
 kS7EH9FARU0c/07vR6RcJJ6QH9FO1l0dWdex7wtdBURRS1C7fmG2dGU4Rgt45hfaqzG03sbcLtF8hUuNVmtHJ6wq7BJCiSNNsyl6w+g+V+ZTqv9gNi2JQmZb
 Ig18oN4uUpKhYaG1jIwy2LHy6QlANfMShmYy0X8Bs6I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1682281913; bh=w8/zycf0iajvN0NbYDZRCfY8qKYUiK0H1YVllh+SmP4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Vgu0LrYrKMA2DpGnvb4YxdkpCj8c+k7r6Uw274MxQKliLIctChuKw8CWW0L55SrC3
 x0dLh0y2RdMpk1kxbiyCqRC6JtV7F80REcWfY+l8r1BUARSD8ezWHWLOAvfvZiwP2v
 HCGvPknHAo0UXSDNeR9Ts+Ux3kTjPLKIc/6dc4iNj3bKc6e1F1w5p4s6qQ5FE14aMj
 a77SCGaRqjdLPkhm0htYP4y90Y67KiPa+32y5dah9QmdUtl539EQdoNf3VYsmjWBoP
 IluKsU43OahYSBvZJmWojJmkDGO44BbBlq1EgrCpDoE8aRvPDlKlZ4yqH+Zkabg78B
 3m5j2UsyDX2Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Vgu0LrYr
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd_defconfig:
 new defconfig
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 23/04/23 19:20, Dario Binacchi wrote:
[ SNIP ]

>>
>> Sure. Could you also try to fill the memory and see if everything works correctly?
>> You could try to start many instances of a program until you fill the memory and see that everything is working ok(I hope).
> 
> 
> I just uploaded version 2 with your suggested changes. I did some
> tests with can applications (candump, cansend, ...) and had
> no problems.
> But for example, running the ifconfig application, the second time I
> got this error:
> 
> ~ # candump can2 -L &
> [18] 81 candump can2 -L
> ~ # ifconfig
> Segmentation fault
> ~ # [  193.040912] warn_alloc: 1 callbacks suppressed
> [  193.040970] ifconfig: page allocation failure: order:7,
> mode:0xcc0(GFP_KERNEL), nodemask=(null)
> [  193.041056] CPU: 0 PID: 82 Comm: ifconfig Not tainted 5.19.0-rc2 #8
> [  193.041110] Hardware name: STM32 (Device Tree Support)
> [  193.041147]  unwind_backtrace from show_stack+0xb/0xc
> [  193.041252]  show_stack from dump_stack_lvl+0x19/0x1e
> [  193.041347]  dump_stack_lvl from warn_alloc+0x61/0xe8
> [  193.041434]  warn_alloc from __alloc_pages+0x36f/0x57e
> [  193.041511]  __alloc_pages from __get_free_pages+0xf/0x24
> [  193.041583]  __get_free_pages from alloc_pages_exact+0x45/0x5c
> [  193.041656]  alloc_pages_exact from do_mmap+0x491/0x556
> [  193.041752]  do_mmap from vm_mmap_pgoff+0x53/0x84
> [  193.041858]  vm_mmap_pgoff from load_flat_binary+0x501/0x690
> [  193.041960]  load_flat_binary from bprm_execve+0x1f5/0x2f4
> [  193.042044]  bprm_execve from do_execveat_common+0x10f/0x12c
> [  193.042119]  do_execveat_common from sys_execve+0x1d/0x20
> [  193.042195]  sys_execve from ret_fast_syscall+0x1/0x4c
> [  193.042262] Exception stack(0xc0ddbfa8 to 0xc0ddbff0)
> [  193.042324] bfa0:                   c0e6eff0 c0e68fa7 c0e6eff0
> c0c6e420 c0c6e028 0000000b
> [  193.042389] bfc0: c0e6eff0 c0e68fa7 c0e68b88 0000000b c0e6eff6
> 00000ff6 c0e626f4 00000000
> [  193.042438] bfe0: 6962732f c0e68b88 c0e0f7df c0e15db4
> [  193.042873] Mem-Info:
> [  193.042910] active_anon:0 inactive_anon:0 isolated_anon:0
> [  193.042910]  active_file:0 inactive_file:18 isolated_file:0
> [  193.042910]  unevictable:5 dirty:0 writeback:4
> [  193.042910]  slab_reclaimable:281 slab_unreclaimable:511
> [  193.042910]  mapped:0 shmem:0 pagetables:0 bounce:0
> [  193.042910]  kernel_misc_reclaimable:0
> [  193.042910]  free:1426 free_pcp:0 free_cma:0
> [  193.043049] Node 0 active_anon:0kB inactive_anon:0kB
> active_file:0kB inactive_file:72kB unevictable:20kB isolated(anon):0kB
> isolated(file):0kB mapped:0kB dirty:0kB writeback:16kB shmem:0kB
> writeback_tmp:0kB kernel_stack:400kB pagetables:0kB all_unreclaimable?
> no
> [  193.043162] Normal free:5704kB boost:0kB min:444kB low:552kB
> high:660kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:0kB inactive_file:72kB unevictable:20kB writepending:16kB
> present:16384kB managed:12544kB mlocked:0kB bounce:0kB free_pcp:0kB
> local_pcp:0kB free_cma:0kB
> [  193.043295] lowmem_reserve[]: 0 0
> [  193.043352] Normal: 22*4kB (UM) 32*8kB (UM) 23*16kB (UM) 20*32kB
> (UM) 20*64kB (UM) 0*128kB 12*256kB (UM) 0*512kB 0*1024kB 0*2048kB
> 0*4096kB = 5704kB
> [  193.043729] 23 total pagecache pages
> [  193.043748] 4096 pages RAM
> [  193.043765] 0 pages HighMem/MovableOnly
> [  193.043783] 960 pages reserved
> [  193.043805] nommu: Allocation of length 430080 from process 82
> (ifconfig) failed
> [  193.043843] active_anon:0 inactive_anon:0 isolated_anon:0
> [  193.043843]  active_file:0 inactive_file:18 isolated_file:0
> [  193.043843]  unevictable:5 dirty:0 writeback:4
> [  193.043843]  slab_reclaimable:281 slab_unreclaimable:511
> [  193.043843]  mapped:0 shmem:0 pagetables:0 bounce:0
> [  193.043843]  kernel_misc_reclaimable:0
> [  193.043843]  free:1426 free_pcp:0 free_cma:0
> [  193.043965] Node 0 active_anon:0kB inactive_anon:0kB
> active_file:0kB inactive_file:72kB unevictable:20kB isolated(anon):0kB
> isolated(file):0kB mapped:0kB dirty:0kB writeback:16kB shmem:0kB
> writeback_tmp:0kB kernel_stack:400kB pagetables:0kB all_unreclaimable?
> no
> [  193.044073] Normal free:5704kB boost:0kB min:444kB low:552kB
> high:660kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:0kB inactive_file:72kB unevictable:20kB writepending:16kB
> present:16384kB managed:12544kB mlocked:0kB bounce:0kB free_pcp:0kB
> local_pcp:0kB free_cma:0kB
> [  193.044206] lowmem_reserve[]: 0 0
> [  193.044260] Normal: 22*4kB (UM) 32*8kB (UM) 23*16kB (UM) 20*32kB
> (UM) 20*64kB (UM) 0*128kB 12*256kB (UM) 0*512kB 0*1024kB 0*2048kB
> 0*4096kB = 5704kB
> [  193.044638] 23 total pagecache pages
> [  193.044670] binfmt_flat: Unable to allocate RAM for process
> text/data, errno -12
> 
> Was it similar to your problem?

Yes, this error could be caused by the bug I've fixed and I've seen
you've used Linux 5.19-rc2. In this version there is not my bugfix
and in general it should be avoided to use rc versions.

This is the patch that fixes ZERO_PAGE(0) that is dedicated to
massive "memset()" in the kernel, so it's used pretty often.
In my case it failed to allocate it, so since in your backtrace
there is try to allocate it could be fixed by my patch, also because
you have 5MB free and they look enough for ifconfig.

Can you give a try with 5.15.108 and repeat the same test please?
Otherwise I'd need to enter debug with this board but I don't have it
and this kind of bugs are subtle to catch and fix.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
