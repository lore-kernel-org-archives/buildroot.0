Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BDCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70B4D415AE;
	Wed, 19 Jan 2022 21:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEalzVtNM84k; Wed, 19 Jan 2022 21:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8F3415AB;
	Wed, 19 Jan 2022 21:46:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13E471BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F9E9415AB
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zxm316jSzq3j for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:46:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B8B441592
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:46:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9197419F4F8;
 Wed, 19 Jan 2022 22:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642628783;
 bh=Pv5B0LrX77THqduh/R0l4czDosS6ni2GYU2rgR9riSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b31rvUupMPM+uEpejwbcylyqZiiV+NmroNniv3HkVPgzY1s5tqCQripkdl1pH+aUD
 acl5NG09W4BeCbj4O4wP/Jz+7Y9gkorCopStA12jDjKmHT0hNFuY1DHIlLAnf9Tfk5
 xS6hkQOAsLewTfrJf4kY4YsPWBNm2P40n4Eoi19Q5fWp0y4QyyYL6+31htcKD4OJAN
 udFnnM4vuBJJyodge503VKkTt77Fc1TQhLQlbXFzI6m12CpZV3md6NzG+EyLMia+2F
 0UCYBwYXlmZyplk8bzVMCPB7qnvScT2tYVX1L3jmArA+pQowUNVw1MCd6CEuXZzM7K
 h8LTQVF+OxzNw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 22:46:21 +0100
Date: Wed, 19 Jan 2022 22:46:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220119214621.GH3095239@scaer>
References: <20220118161853.27777-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118161853.27777-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/strace: bump version to 5.16
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

Peter, All,

On 2022-01-18 17:18 +0100, Peter Seiderer spake thusly:
> - update license file hash for COPYING (copyright year update)
> 
> Changelog (from [1]):
> 
>   Noteworthy changes in strace 5.16 (2022-01-10)
>   ==============================================
> 
>   * Improvements
>     * Implemented --secontext=mismatch option to find mismatches in SELinux
>       contexts.
>     * Implemented decoding of futex_waitv syscall introduced in Linux 5.16.
>     * Implemented decoding of BPF_LINK_GET_NEXT_ID and BPF_LINK_GET_FD_BY_ID bpf
>       syscall commands.
>     * Enhanced decoding of BPF_MAP_CREATE, BPF_PROG_TEST_RUN, and BPF_PROG_LOAD
>       bpf syscall commands.
>     * Enhanced decoding of BTRFS_IOC_FS_INFO ioctl command.
>     * Updated lists of AUDIT_*, BPF_*, BTRFS_*, DEVCONF_*, FAN_*, ETH_P_*,
>       IPV4_DEVCONF_*, KVM_*, NDA_*, SO_*, and V4L2_* constants.
>     * Updated lists of ioctl commands from Linux 5.16.
> 
>   * Bug fixes
>     * Fixed build for older Android.
> 
> [1] https://strace.io/files/5.16/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/strace/strace.hash | 6 +++---
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
> index ff89447bfd..30c90e8e39 100644
> --- a/package/strace/strace.hash
> +++ b/package/strace/strace.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
> -# https://strace.io/files/5.15/strace-5.15.tar.xz.asc
> -sha256  ebcac22f297335294dc654425cbc3ce013343bece6da2699e3aec86aee8d72dc  strace-5.15.tar.xz
> -sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
> +# https://strace.io/files/5.16/strace-5.16.tar.xz.asc
> +sha256  dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285  strace-5.16.tar.xz
> +sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
>  sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 4b70531aa7..c8c3590f6e 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STRACE_VERSION = 5.15
> +STRACE_VERSION = 5.16
>  STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
>  STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
>  STRACE_LICENSE = LGPL-2.1+
> -- 
> 2.34.1
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
