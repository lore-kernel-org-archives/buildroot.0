Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FB3C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5465830E3;
	Wed,  7 May 2025 20:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2s4S2K_FMnS; Wed,  7 May 2025 20:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F38F982128
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F38F982128;
	Wed,  7 May 2025 20:12:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F8A439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE6982B34
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iikXwDiVmrxc for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49A6782128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49A6782128
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49A6782128
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:12:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1416A5FFB1;
 Wed,  7 May 2025 22:12:25 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:55360])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 22:12:25 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 22:12:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250507130044.1040159-1-titouan.christophe@mind.be>
References: <20250507130044.1040159-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <4bb9cb3f1db86ddffa4ed2ece745ad2b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746648748;
 bh=H6I2BLOF/jSKv74inGGciGiZAkSygUBT/+UN4uq7Zqk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=na5WEXcuQVsm4ibxQieR+X522cP5yYhNuethf6zPDxbmSdYUMtYqPR1AxaaejoD0j
 8pyn+S2FWtsj1P98SXRmj+qGVYYNzILmLXeP7Lk2sZr+WDkUhHSFtwbuOgBQPbrQJc
 vZRrkSMEvSNeQHYnWJt4CdNHL/vV2h4/k8TwILDdPt6oQuM22uN7m7z4mur6WpEULG
 T5cgvdyH/VAe3HcF8KIgmMFqOCDmfy22LtoMgNFoa2R/DO9zW3rEoTfwL3FC/4aByB
 QclEFDvFm79xBkOEyZldfC0We083aU0HevoAJO1YHL2ZL8X3thWKV9GgbNg0S9Ky4H
 ZGOE2NWWjQAJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=na5WEXcu
Subject: Re: [Buildroot] [PATCH] package/sqlite: add patch to fix
 CVE-2025-29087
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

Hi Titouan,

On 07/05/2025 15:00, Titouan Christophe via buildroot wrote:
> This patch was commited upstream, and released as part of sqlite 3.49.1
> 
> However, the configuration system changed between sqlite 3.48 and 3.49
> from autotools to autosetup, and this has proven challenging to support
> in Buildroot (see `git log package/sqlite`), hence why we are still on
> sqlite 3.48.
> 
> Therefore, until the package build infrastructure correctly supports
> building sqlite 3.49, let's simply import the upstream patch to address
> the CVE.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

I applied this patch to master, thanks.

I had to reformat the package patch, since it was not applying as is.
It was apparently made for original sqlite sources, while Buildroot
is using the amalgamated source release archive. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/835b5659ea576290458aa17d2119b2ec13ebf0a0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
