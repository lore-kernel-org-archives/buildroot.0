Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D89CA1011
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 17:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEAF742163;
	Wed,  3 Sep 2025 17:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlOAkEoS_Rfl; Wed,  3 Sep 2025 17:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0794442155
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0794442155;
	Wed,  3 Sep 2025 17:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61BAC10E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 480D742146
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNBcThVAxVM1 for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 17:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C6EB742114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6EB742114
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6EB742114
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:07:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 95C745FFC0;
 Wed,  3 Sep 2025 19:07:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Sep 2025 19:07:00 +0200
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 19:07:00 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250902221547.2205648-1-romain.naour@smile.fr>
References: <20250902221547.2205648-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <4fc2a7b1f7c616792e96b04a9d5a4e27@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756919221;
 bh=aMTRQGpYrDSIV2la33dU2e8ISo8AX0oGqb/PAQs8ytY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Iu+bIMJAWB5IlJe6rbIFQ3ZKLhOZRxDD4MWe8cauyBfJ2G2WKGsce76x4FXb/xiO7
 OoDsybspNnpP0Sr7U8+co/fJ3KbI5+jbuHfhCX+xwlzW83PdSShG+lWmg1eweWDrmO
 kP4IgIw+C2h2kraqR1gMDDMr0WaRaTrBY6fhrXbMBc0q8QksnxDkuJYAz7pQUetQBW
 rn1bsLFbwfHtIU5SWEqA4IsXnmKR1ss1oTr3gjr5uL3pDzZMAiXm4AvWJNA7AJ2APP
 o9fylP/FXdIk34FkwIPWZJcruSjEfD1uJcXgWBj8JHvVNzDnNW87cguyMcl7zwW0+r
 k0qkHbCJYwpzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Iu+bIMJA
Subject: Re: [Buildroot] [PATCH 1/2] package/firewalld: backport Python 3.13
 port
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

On 03/09/2025 00:15, Romain Naour via buildroot wrote:
> The module pipes is no longer part of the Python standard library. It
> was removed in Python 3.13 after being deprecated in Python 3.11. The
> last version of Python that provided the pipes module was Python 3.12.
> 
> Our firewalld 2.0.2 version is now superseded by several releases
> (up to 2.3.1) that include this patch (since 2.1.0).
> 
> [1] https://github.com/firewalld/firewalld/releases/tag/v2.3.1
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422466 
> (TestFirewalldSysVInit)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thank.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
