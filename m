Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5381BC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 17:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF7C611CB;
	Wed,  7 May 2025 17:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKfAU6uANqnm; Wed,  7 May 2025 17:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54268611E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54268611E3;
	Wed,  7 May 2025 17:38:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A3715A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77E71611CB
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSftT7a1LlIC for <buildroot@buildroot.org>;
 Wed,  7 May 2025 17:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F7CB6082D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7CB6082D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F7CB6082D
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:38:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5C9E219F5B2;
 Wed,  7 May 2025 19:38:37 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:51980])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 19:38:37 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 19:38:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507170752.24643-1-fl@n621.de>
References: <20250507170752.24643-1-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <086ee14ef3323844cfdc78cd5ef01b6c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746639518;
 bh=nqxWRRUKn7U0EDjco5sIaqQNntsEQIiBjUWmeDZxYeY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KVTgi5w1e16BoUwpx+f9jlw06sZNT6tGTVxrQGM5eHxiBw0sU3sZ3LkVgzPCo7X5r
 hB2zsQZbemte+Px6e6uXhqGpN4KdXtYUr3pm/tslx62yIBChXg4rjXN9sGTfyHWxaU
 wiXn92/Sb2R4d8St6RUdZZj/ZPOUZa+4xtiEagAsw/PZqkJyM3m41vtwIqzrjeVq8E
 CeU3WQJnnj71FNDHpd2eMT6AURop8dlNz/dDFUmBISLcxBeCmw/QBi8OfIXjZIyt5Q
 dwlfDhgiU+hYtJiTfz+v0Nyx2t/oWU7DtdhISIfdpm2eyvVzcqZnTv+C/BXF6rRpfG
 eUlrLEEbaYbDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KVTgi5w1
Subject: Re: [Buildroot] [PATCH 1/1] package/cpio: fix build with GCC 15
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

Hi Florian,

On 07/05/2025 19:07, Florian Larysch wrote:
> On systems running GCC 15, host-cpio will fail to build with errors 
> like
> 
>   copyout.c:646:12: error: too many arguments to function 'xstat'; 
> expected 0, have 2
> 
> and
> 
>   main.c:407:13: error: assignment to 'int (*)(void)' from incompatible 
> pointer type 'int (*)(const char * restrict,  struct stat * restrict)' 
> [-Wincompatible-pointer-types]
> 
> This was reported[1] and fixed upstream, but there is no new release
> yet. Import the upstream patch for now.
> 
> [1] https://lists.gnu.org/archive/html/bug-cpio/2025-05/msg00000.html
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

I applied this patch to master, thanks.
I also made few minor changes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/e3cae9e1ca4765da825c9ee94760e12f5c6c142a

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
