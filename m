Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AAEC5B555
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 20:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5F4812FD;
	Mon,  2 Jun 2025 20:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsPcvFd7gxPp; Mon,  2 Jun 2025 20:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8089812A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8089812A3;
	Mon,  2 Jun 2025 20:17:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E5EE15F
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40CFF40B54
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kNVdkYZ9xPl for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 20:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51D4C40BF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D4C40BF2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51D4C40BF2
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:16:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 22C7013F8B8;
 Mon,  2 Jun 2025 22:16:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 02 Jun 2025 22:16:54 +0200
MIME-Version: 1.0
Date: Mon, 02 Jun 2025 22:16:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250602172812.512003-1-petr.vorel@gmail.com>
References: <20250602172812.512003-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b6299a04c12fe329f3ace81b304dff6e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748895415;
 bh=2/OTjeosY02jgu69onu6BHfWP6URSQt/P+KHcBB70fk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r6uU4fDsfXJK14f7oY+x6v9T8A6aIymRMtdw/VHiQl8pL5ZzEhVnR/qmmczTQeCeL
 S69Uwr1SrGyKQyHYCzIsAR4fJpVcNyDLSQeTr76y5JTMLLjVwWy7pORG9fG0nmReAI
 a0Fz6PFuhvZ2luq6CuHPvjdni0SeSA8r3NU+20+SLx9QfkSSQtkqL89WaSQ8mbLJ6n
 o3GxcTISpGbOXqDl/+8gv/RDmH6LMe98iTaqy1+DR7k9WXLXMqyYLR5sNaFXwClgu7
 2FbLgLk+KTKnwns5xs8Fz8kela9BJMDoJyYoTf9xSQIte33UIXMn6IMULfYnFv9Q2Y
 PxRicOoeKFXvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r6uU4fDs
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20250602
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/06/2025 19:28, Petr Vorel wrote:
> https://github.com/iputils/iputils/releases/tag/20250602
> 
> Security release, fixes CVE-2025-47268 and CVE-2025-48964.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

For info, I added the mention "security" in the commit title.
This helps LTS branch maintainers to identify security fixes.

I also completed the test-pkg in gitlab CI:
https://gitlab.com/jolivain/buildroot/-/pipelines/1849623723

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
