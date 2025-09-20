Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB72CAC5A7
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 20:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F00980DB9;
	Sat, 20 Sep 2025 20:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWfZ5a0S67ad; Sat, 20 Sep 2025 20:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589C3813A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589C3813A6;
	Sat, 20 Sep 2025 20:33:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40209E7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31D344037F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1-dQhvLpPzF for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 20:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 768A54034A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 768A54034A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 768A54034A
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:33:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 57E7420039E;
 Sat, 20 Sep 2025 22:33:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Sep 2025 22:33:23 +0200
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 22:33:23 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aM2fDL1IHgxX7arz@waldemar-brodkorb.de>
References: <aM2fDL1IHgxX7arz@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <60a08d012950061768c03d66043cfa23@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758400405;
 bh=HwOGMqonzMN2kM9Tlb11YLHrib+jponDmX3pWQGJSAc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TWi+Nc6AsWvJogxpHiAQgYShz2e4erX4THU6GNrBKIUwY919S9JTDM6zFW3F4hyRi
 sT8C9+vGkD2A2H0HI2yzSymtKywSymIO+s7o+U9V55kRaM5kb49biCIeeMXfslBnR+
 cVVqMrBSeI51VCg3qlG4l3ydMrw4fZW1E9Hajas5zMZVGkUbbcIOFtVRKT5Omb69gt
 QAst1e1EFYscrNlmnDY4VjfUtM9Vs/L8564iOYkpPJ8TnNRpUKMUAuoNZQRD82xczp
 dFie0lU5puy22jZ9LDt1QVCPQelxVljLjabLTQhwsnvabkFmdDkIs5Q0PjBoxsbaIs
 1xZ3Ys5rbbxow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TWi+Nc6A
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.55
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/09/2025 20:21, Waldemar Brodkorb wrote:
> Finally the aarch64 tls bug is fixed. (python 3.13 segfault)
> Unfortunately it is not covered by any testcase of uClibc-ng-test.
> 
> Here is the git shortlog for the release:
> 
> Marius Melzer (1):
>       malloc-standard: Fix truncation problem in malloc
> 
> Waldemar Brodkorb (5):
>       Fix Sysvipc for ARM, AARCH64, RISCV64, KVX and m68k
>       remove uClibc specific gettext_printf
>       aarch64: do not force tls-model in CPU_CFLAGS, this isn't 
> required
>       aarch64: respect r_addend for TLSDESC relocations
>       bump version for 1.0.55 release
> 
> yliu (5):
>       mips32: Preventing FORCE_FRAME_POINTER from being optimized away
>       mips32: Define __IPC_64 according to kernel version
>       time64: fixed msgctl/semctl/shmctl result errors for for 
> MIPS32/RISCV32
>       time64: fix *ctl functions in mips32eb/mips64
>       time64: fix *ctl functions in mips32eb
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
