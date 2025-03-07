Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A90C28B2E
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44DA480C60;
	Fri,  7 Mar 2025 21:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AERwd2HwRyas; Fri,  7 Mar 2025 21:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E8980C87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E8980C87;
	Fri,  7 Mar 2025 21:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F945E26
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F1C380C60
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHdFjwoMjMMc for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 21:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A5C080C5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A5C080C5C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A5C080C5C
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:14:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E6595B0053D;
 Fri,  7 Mar 2025 22:14:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Mar 2025 22:14:42 +0100
MIME-Version: 1.0
Date: Fri, 07 Mar 2025 22:14:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org, Etienne Carriere <etienne.carriere@foss.st.com>
In-Reply-To: <20250307074834.895067-2-dalang@gmx.at>
References: <20250307074834.895067-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <54494ce6af589ad4f6647aeca247b343@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741382085;
 bh=aK4tiOUFsgjWaJJ9rlRw02TpanB3uNo3kREBEXi/kYE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CRPm/Wmx6CHrhTkv0bnHcIant+j+yMM+Ktrt62holn7q1lCjY4lFzGhgBsHFfKsCz
 HieQ5CBtq4f5M/nZXs992/kBWeFIsE4cjHWK84CE17Vj5as6/OpTFMeQWPiL3NaH21
 KY08LCIX2+9jBlmHynMTsokGr2iElJcqv92p1sUX06thhM7YQ5CC6RxP3nn9zMzrr5
 leuOCvsl+k8JBSj0HR+H6PNUQMuAy2IIRcogRoqdA5NYbPX2V6zeS7F81+TCYp90WX
 +0RUX6WJQJGHUTziJqYcWK8FFxEsu/7L1DxQ8utfpgBakHlOxAETtwXvuL3oiYbYY7
 JrJSHJgqV3xcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CRPm/Wmx
Subject: Re: [Buildroot] [PATCH] boot/optee-os: add CVE identifier
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

On 07/03/2025 08:48, Daniel Lang via buildroot wrote:
> cpe:2.3:o:linaro:op-tee:4.3.0:*:*:*:*:*:*:* is a valid CVE ID.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
