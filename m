Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEE0F3026E
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 15:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8F81826E7;
	Sun, 15 Mar 2026 15:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RqNs6X54i6P; Sun, 15 Mar 2026 15:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9038C8266C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773588003;
	bh=0j6ZY8r5x00SFh7Rlywl29gvnzrFXwNI/KTRXJsZ25o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HYO4Led3cSteKIK5PsQ+PBrbIkdjI0096BogQeGWpnyC1oDvqS6q/jNqOxWOCBJvx
	 VYKJvW4JotV6oae4CRUOoP4hNedCc8Q53U8Qb8K2ki8r7EY4GT9aev+vFUqde5zvRw
	 PAQityzVuBwDn8KJW1QKUTvTFCWXIuwpnVPXaedG7eNIFCsAsOUDuRF8VctBKP3GBJ
	 djtRhfcG08G+TOeD/bCf3fRDPUsP7064z35fSmtm6DTlKeIdx2d1HSJSiVRWK9ID4K
	 j6oLgIp5fmXZuxPABHdUYzXUQPF8rAQ90utKUQAkfjHUo1BY5L5WAnCWk5d4XlXQHI
	 LtAjU5lTODjzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9038C8266C;
	Sun, 15 Mar 2026 15:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9BE3201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB5EC4011A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2K2AVwkRM08B for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 15:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4FDB40061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4FDB40061
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4FDB40061
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:20:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EF133780333;
 Sun, 15 Mar 2026 16:19:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Mar 2026 16:19:57 +0100
MIME-Version: 1.0
Date: Sun, 15 Mar 2026 16:19:57 +0100
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260312092413.545638-2-dowan.gullient@smile.fr>
References: <20260312092413.545638-1-dowan.gullient@smile.fr>
 <20260312092413.545638-2-dowan.gullient@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <6ffbb4ec48f7506c51f1c86162af1218@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773587999;
 bh=GCjVx8emgJWv/tUDtVRbU3nX27rRI6s3Bu0iwxr162s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SMhc/Z0KSco854NO6ytmmHfs19admp914QAg5x+ppDnGp4P9eQ/gMAk6wEcb2qMgq
 ZA5MkeNKLu3vnjmLNasRVrhYL3gu0SODMBB9/On28+X6YOw1y0QpjEq+i6vN6gWkXv
 8cJdKgp+91wsqrOz+Qj1d3glCZrMR904EJWwDWu2eAi9iZidojRJwjbPfT9I1hZrqw
 GOBv4H+1tlb8OIzV9FRXC8B6GXeomNLCc2ST1ztahgdX0KKUdewTYtzvBPmakHJGYQ
 ir1a9huosnvcK8MskXQxiKUDTI7hVlY1TIWeQiXHa0dW+P9hzFciYf8ETSWcN/P2Ar
 jWXVS44WY1ZYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SMhc/Z0K
Subject: Re: [Buildroot] [PATCH v3 1/3]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
 15.2.rel1
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

On 12/03/2026 10:24, Dowan Gullient via buildroot wrote:
> Update the ARM aarch64 external toolchain to the latest 15.2.rel1
> release from ARM.
> 
> This involves:
> - Updating the version, site URL, and source filename in .mk
> - Updating the SHA256 hash in .hash
> - Updating the display name and GCC version dependency in Config.in
> 
> Verified by booting on a default Qemu configuration.
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

Series applied to master.

For info, I fixed a minor check-package error in patch #2. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/8cb765faa68a4ea7abf6445009f0586063aa4d4a

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
