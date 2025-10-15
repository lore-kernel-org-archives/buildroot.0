Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A20CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 23:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBCFC616F7;
	Wed, 15 Oct 2025 23:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOQdGyiAftV3; Wed, 15 Oct 2025 23:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76906616F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76906616F3;
	Wed, 15 Oct 2025 23:11:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBF6147C
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 016FB41922
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UuBhZjE_jDZ for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 23:11:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A3B741925
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3B741925
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A3B741925
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:11:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DFE00B978FCB; Wed, 15 Oct 2025 22:06:04 +0200 (CEST)
Message-ID: <722c4451-cc26-40a1-a6a0-006d0828d31f@rnout.be>
Date: Wed, 15 Oct 2025 22:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Leroy <maxime@leroys.fr>, buildroot@buildroot.org
References: <20251014191828.442802-1-maxime@leroys.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251014191828.442802-1-maxime@leroys.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760558765; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=YwVgddEoTKsF3ZIDnI9Ex3zr4FTOB7aNiv6F2++xTWY=;
 b=cjapML5AjxOpHOfreG+d5X/d15qH5AKMixBkb3yQ2pyzMG1VXof3jMZGH6DTWjehrRrmxO
 XfOHazCKBXeiSU8EtTHI1Lc68Jdix0SqHflMndF3EyvBgrb4PTmj9PjLoR3EFEwBRRGKM+
 K9seSJFrNWV/HXNFsKYzF1atFbJFzwLNjNWxZR9NyYtDcyypUvP0Sp32FXccZy2Mz8ZBzq
 NmuK7SuE8slp1SrgBXL+sMtttkMqaqXtQcryoo/JYN8uuKqoINumH2L7X2HzORC7qmSUZC
 oVZeQBMC3Oa8LRdsHtW2pmjgAZh3XPuxlA6tFDSE4yDGOvIxy1FnbzdOmuFxQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cjapML5A
Subject: Re: [Buildroot] [PATCH 0/2] new version of grout package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/10/2025 21:18, Maxime Leroy wrote:
> Grout 0.13.0 requires libecoli 0.8.0, so both packages are updated accordingly.
> Build tested successfully in CI:
> https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2099339317
> 
> Maxime Leroy (2):
>    package/libecoli: bump version to 0.8.0
>    package/grout: bump to 0.13.0 version

  Applied both to master, thanks.

  Regards,
  Arnout

> 
>   package/grout/grout.hash       | 2 +-
>   package/grout/grout.mk         | 2 +-
>   package/libecoli/libecoli.hash | 2 +-
>   package/libecoli/libecoli.mk   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
