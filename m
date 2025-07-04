Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1FCC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 21:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04AE08407F;
	Fri,  4 Jul 2025 21:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDrsfnBKc8iw; Fri,  4 Jul 2025 21:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F50484079
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F50484079;
	Fri,  4 Jul 2025 21:26:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E74607AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD8CB84063
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpvw0fiPTPIm for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 21:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 121EA8404E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 121EA8404E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 121EA8404E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:25:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 12A8F6012F;
 Fri,  4 Jul 2025 23:25:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 23:25:56 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 23:25:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165636.3745028-1-bernd@kuhls.net>
References: <20250704165636.3745028-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6657c8fed6f045acf43b074b7fe2d4ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751664358;
 bh=fQoOYd0wn4GJ1b86TgzYCUpl/fxqA349cWrHyYcXFnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tu1QAshhXV+6W2x3mNMG3Ia8J0m5N+YUpaOQxK8ucSUjGQZ7u//H4d0RXRdS6Z0du
 Gbsu1kbaDnHyJMK4dQR0W3xrmPO6EQLf+YjzOYLVh/4n71qJojdZ+s/4//V4quJbQJ
 Nu7kwjxE/X3STt1xTY3lSgUMxl2Bj+NyoYjaPzNz8Mm7oiM2AGVjGTAPeePy2iJJVN
 i9UozjgKWh0DSjeriB4RI4TmMZQ4xJK3sT3gQfzOqCWaJhbv1WVb4JNivw8/k09GiN
 4E1sIn3h11wAwV28Ri5dxkdIRW3esmtOdifw0VE4cugIwdc5toeYvtWOGG+EqtZSMx
 dkKhp/bIJNdKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tu1QAshh
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.24.0
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

On 04/07/2025 18:56, Bernd Kuhls wrote:
> Changelog: https://github.com/xmrig/xmrig/blob/v6.24.0/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
