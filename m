Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DFBC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 17:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F3F80EC1;
	Tue, 22 Sep 2026 17:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4KsseYpDHBa; Tue, 22 Sep 2026 17:21:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1995080EA3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790097661;
	b=BuPjIX7X9M5remyMY75D0/LfVwqNJFG7NBaeKGfdGeIBoMItynEayHI4KluFHrxlvCmz
	 DS5m/FRK4d4OPs+IoTsThkaZAL4xbkCc8D9zrdtENH3xkjsy9gW3kfvBsJfngOnXBLfH3
	 JVmK+p29Kmn0Kao//yJ7mQMMKsQRjoLlMUgzYOA3/03bEYknb656FOeVUJId2CtGxSsqr
	 Er6Zy/EexBeyqDTI+NDA+uoPZnbqJhlyyMdYWbx8m7HngXqVi8rR/jppap+LmKZyi4KtF
	 81HNri9gm3Hd+J1FSRPGetoxXltrOpxAUSbjrwgbWkQuunUQD/HAIB/k5273yUBD8+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790097661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=pFL4rdKpp2YmSMMLbrFuoizuYT3/SidAbEeV3E9OzhE=;
	b=hMeQBjM80phDqnkJLEEfFZQxSXWZmCImbZW6yQzISgWOZZ/5yntLVvFsEsSrkRx7lEPm
	 A46WVCUQFOg83NyoVE6h6KYjRsJBARKnj/VOwZm/OT1K2ID1AGF43WmSfmUCqDJFj9lGZ
	 Vw9fWHXCs9GQ8PwUd05FdfnVYOO0EDS8waMVUJWcpsj68y8/4gpBRoLoLV/23yyQiQpA8
	 V2Lp1DoTOSoQZQy0H8HUJlkqAPdyGGlkL62pqCmSv1kmFHOFSC0OZeIGH5H07qKr0w+ST
	 L/Kwnukl7NycSuzlQWmueHKJjUz/3CWA7F2LPLrNqm7D1KUVRz4kYcVdHBLvZJ3eHuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790097661;
	bh=pFL4rdKpp2YmSMMLbrFuoizuYT3/SidAbEeV3E9OzhE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n/VtyfBRuc58FiQlFRFJJ35DpElNBLJ0TPcH7T/AJlDFJnOahv/cTb1jqn+q4r0CQ
	 AHZJPt3SJ4ldZZs3UlCWIvohzh3jADhUXqvpGdcIL03e9gclAXqABlaWdp5HKMHRZw
	 dXGfVhvsRVHDUTnR+02XcLhJLgLgu7xnrwduRPetzmrk3B45ZoFIXxHhqbtUr5v2CI
	 iBeUbh4J0v9QQlj//7hmjpHwHSP64Mg57v8EdoZOtuOV8Hx/nKJI1tuaNjz70gWHPO
	 7u5sIvy992ZD4dIRBw68UoSTflR/ozdsX9WKl9cfpq/Dnms5tNHoTHwLpFUDATa/mN
	 shNsZf1c8EmcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1995080EA3;
	Tue, 22 Sep 2026 17:21:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4767AD1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39065407D6
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTBeof92ki7d for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 17:20:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1E112407C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790097658;
 b=a0Z/n1EGcu/PYK8OhT5fvFVrMqqJ36VLyS7XeM1wGc8sWTELUoWexBAFqM4UMKng79Af
 mJAz+PTqQ5BieUZq0t4Hj0A9L865BNxJ1L5RMLatoAxn9dKdQXYtyhodA5NtZc1/hiHHd
 9uMHGvhORe6LwoNZVqoCXMTJ3AZig/qiH2JJcvhwSuC6l6mFY4/t9coJZy2KM/TuV1fAC
 oUIZIMApa01CWD01bXtKhIDtSSOHWjUMQ0gWe5PTDCMHULHhsuDY2vtkZl2gJMxZdTPGP
 CJAHCMYCkXNTlx5IeQ3vILZJZLqOUvLUIoLtbwdSDj7Icy6yVSnS8iqzGGDXbtM0+vQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790097658;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=odIMSL67uuj6d9+3NXAIe0EkvKxpgQuHjsGhb9KZFw0=;
 b=lwQH6EzljxiUJRKfl0tv/HACDqfTO4kp0j1ZnGp4HgD31RGRgwVncr7yKVATDpOrh57S
 0meuzZwZYkn9CWn6TLzbbE9dY4TR6cIdO3NlAbSUP729kd91d8t/6valXvQLMx+/E81/T
 xRaCjwHizFI0STdMET4AkEKGwmZpb7MvspIPGQe7Xsn40zSAzqmqM4BgCP+jiVKX4dOQ1
 8jo3EdqCLwLBMpCLR4C6QpjlJFA1TjbYwRBEIfBe6W7BxUiMu7wTAaiY4yovNM6YG/FA1
 ctpL0DGSL0SrgqM/N8HVCP1sEUVWdTt2MlO6KENmG6g/6NPfn42bLqpfVF3MdSFxu2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S0MvzaP2; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E112407C6
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:20:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6F87978034E;
 Tue, 22 Sep 2026 19:20:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 19:20:52 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 19:20:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adam Duskett
 <adam.duskett@amarulasolutions.com>, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260921214518.3764002-2-bernd@kuhls.net>
References: <20260921214518.3764002-1-bernd@kuhls.net>
 <20260921214518.3764002-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <39e405c23ffa4fc9e7c672483d46c2a5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 2/2] package/flutter-engine: bump version to
 3.44.9
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

Hi Bernd,

On 21/09/2026 23:45, Bernd Kuhls wrote:
> This release includes upstream commit
> https://github.com/flutter/flutter/commit/5526436a9488419a391a9d9242a068d2569ffadb
> which adds a new configure option --no-default-linux-sysroot that
> implements the same function our patch 0001 added, the patch is now
> superfluous and was removed.
> 
> Added new patch 0001 to fix a build error with at-spi2-core.
> 
> Rebased patches 0002 & 0003.
> 
> Added new patch 0005 to fix build errors with pango >= 1.58.0.
> 
> Removed configure option --enable-impeller-3d due to upstream commit
> https://github.com/flutter/flutter/commit/2c970ccee18a53c1c6b1b1dd0a05e031bbc962d6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> All Gitlab pipelines
> https://gitlab.com/bkuhls/buildroot/-/commits/47e9d779159ea92659def9c2fe93090a64f2018d
> failed due to "no space left on device"

The runtime test is failing at build time, even when
executed locally with enough storage, with command:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_flutter

On my side, it failed with the error:

/usr/bin/sed: can't read 
flutter-engine-3.44.9/engine/src/flutter/build_overrides/vulkan_headers.gni: 
No such file or directory

Can you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
