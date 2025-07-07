Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68C5C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 720BB40978;
	Mon,  7 Jul 2025 17:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0_SYfKYlip0; Mon,  7 Jul 2025 17:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44526409A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44526409A1;
	Mon,  7 Jul 2025 17:45:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71B0E15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 635CA83E05
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtSRgq6xBVgW for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85B4883DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B4883DFC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85B4883DFC
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:45:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 875EA2003C1;
 Mon,  7 Jul 2025 19:45:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 19:45:14 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 19:45:14 +0200
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250707064531.4032062-1-vladimir.kondratiev@mobileye.com>
References: <20250707064531.4032062-1-vladimir.kondratiev@mobileye.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bbd26bb7d2a2bedccdededaff740a48f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751910315;
 bh=u4ATqPyP9FfCtnsqj6IboJCRXCASbjpNfZdKIIJkbpM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YIaPr8LcXTYAPJB0HlGswXCjm9SfxeHK3PmdnDuoLQ5vCJ02jQno8YRWSvusIQbHE
 rnIgd4klhWg9YkiImpvdWuvmYOj/R9SUJHEbhtli5vvPqukUQq+TIsvYRUK7gfL6U+
 MNCel1br4UoipSMrxv+rS3zjkq15enXb9cbF/vASmnEv5EmfYjJSNnco1MpVY6HaAg
 FShcIKWbGFPnLV1+ekEtX+qhw4kxoBgkzIsB7bI+3ntyPALxgfofJI5v2BbuQAyFAP
 GGhWEzJ0otL9k3dP+BJ3PBSJGZkl/ZbTGxM0Heun6ELa1A2HtrsMvYHd5guwdSisQG
 n6A1LDUXyLJdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YIaPr8Lc
Subject: Re: [Buildroot] [PATCH 1/1] package/libunwind: enable on riscv
 64-bit glibc
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

Hi Vladimir,

On 07/07/2025 08:45, Vladimir Kondratiev via buildroot wrote:
> Since version 1.8, libunwind supports 64-bit riscv,
> at least with glibc
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Applied on master, thanks.

I checked the libunwind sources. So I added a link to the commit
introducing this support. I also noticed it was first introduced
in version 1.6.0 (rather than 1.8). So I slightly reworded the commit
log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7981df0c82b3f2456749cb4badfa7a0a05d5f0a9

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
