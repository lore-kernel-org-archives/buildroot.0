Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEA6CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 21:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D1940A64;
	Sat, 25 Oct 2025 21:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3sYLwHN0EHr; Sat, 25 Oct 2025 21:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFE7540A56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFE7540A56;
	Sat, 25 Oct 2025 21:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21A3D976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1313F812EB
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-hBSolZGFRm for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 21:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3BD2812EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3BD2812EA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3BD2812EA
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:11:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 22D2F19F57E;
 Sat, 25 Oct 2025 23:11:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 23:11:47 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 23:11:47 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251021083942.726874-1-buildroot@bubu1.eu>
References: <20251021083942.726874-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <d8c26c66d38320a66db5ac384cae213c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761426709;
 bh=lqfvphC14d2Fb41L9YhJ2N4wqFPqznDuehZBmGDgUU0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PBtt00VD9FPL54JW+6whkHOBK4aVC5dc8HxvKnCL6mZi+ClUt2iA/Mfr6Vrd1IhcK
 qjjpqDKL83cqSLsSGnDQYai5rdJRYwFKkrBDxj8jfL7C5VKkp3vbj3eE6r93/VeMI2
 9JSqoc4Dgv497fSMvcEU9aCxcnbaVBuUB736NE+dmflMUfQaoi1/8qTxgGDVHRAOhg
 C/XioD/3qxPG+FOO5GXCuk6mndGIFHVxnUkfB3DQ1WLY7uuAgnLWDK8smBxMkjegHP
 mgegUX3oNhT2qtsnFRQhLvb4vOI8USATUiGIvqUoXh1enutfjmnHadXtTXG+YNOssN
 2ZfmDQi/eCqZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PBtt00VD
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.119.1
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

On 21/10/2025 10:39, Marcus Hoffmann via buildroot wrote:
> Changes: https://github.com/fastapi/fastapi/releases/tag/0.119.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
