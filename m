Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B86CA5FFE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 17:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0C904070C;
	Mon,  5 Oct 2026 17:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_H1V_wbIMTh; Mon,  5 Oct 2026 17:06:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 99F0B40713
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791219976;
	b=MnB4fcaMlmucIVa2CV/LVjYs/ai+iQMMDxSRw6LMqqt+PiIiP3DNbPKa8fGH4LBhCagI
	 oSejke5FRjOBZakn+FSSn5mUlTImvDPerJA1pVwK2ZjLjUITqV8eIfk8yK3iigQHkRWIh
	 r6L0osXhjx/u4btENl8+tMSF4fAjB6yIDlx2FSoJbvJt5HAIpIDhQJY+JRRDpQ3v/X68b
	 eGT2HpJNaGPy8fntJ3cLg49wz04SEpNNMHzP0RHwCLXSS1jbVe+uJVDZBwl/6qZ+Sv+if
	 VC0mbjcVJdacAUzoeP4e+N9+wE2tDpdT2KxDwi3yTChOQZQdDBFisK79UBDIh8//e9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791219976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=GOLf5Rh/A3IT+0xLfdoZ4f1eqOU2X2wdFVfYewYMYqk=;
	b=m5ahpGve/ddoXraQig5Q//4+RVgmR5h7ZLyf5IfR71vwLl1JHB2AfU8EEEHl7D/OVtP4
	 OTDjsRBoUQfglx4BucxYS6aqA6scMfJ2MdeNORt5b4+ZFzY3dmsxY/7jvQfkmKqsJ2myA
	 PaGnXm0nkcCI+XXMDCtQhfJ4p8sB8XXbsomgD+aJTlHh4knDovTwZfIMwKIn8g9PolwJZ
	 JrF/IjInoNhecxjYGQG7yjnbEZJkBtzzR2XPqko/seGdxBcbKdmj56+JzRB6madC5DYu9
	 JSpUNphS/twniXzYroYMrXAzfmB+CeU8XvvFwizs59SazcOHHYxKFCdZtHaetC9Wnng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791219976;
	bh=GOLf5Rh/A3IT+0xLfdoZ4f1eqOU2X2wdFVfYewYMYqk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LncY7B0/O5qdpVTYbhkmbeiREannCLsJnf2moKKclHdhfAh5KDA6w+jVj9xO3chJe
	 SdFxujnCxh//VIt2ne0DD7pbPkxqGKYZ7+0qAtMkAICyFeuAERbL/F5Rr7fBADuBMw
	 teBnw3R+/omQvugPoJJ+88n/QvymbY3EWTswULd/g6pShK3+U2AvRhNVMy7rEkM82i
	 FV/8QFef2rVOWKevZIXfuFig9UgFgpui3FELnF2EjEru8fh0R8jP+BwXbKQO9Gndq1
	 040RhNBm7bjDj5dw8tDv+wkO7l8bWmdqydWimi6aQQN7TV4r2lxBMWfddoK0fZiktV
	 ZGR88nPkNjiow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F0B40713;
	Mon,  5 Oct 2026 17:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0897B2E0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 17:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E259560718
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 17:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aq8GKciERmew for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 17:04:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8426E606B8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791219855;
 b=lQ9D1vOxxrck4WL2g3PWNOksVRlBeXxewHE8Hgr5m3ZpbILUB8RaYis7f515rCow4Dar
 zTfXQi9qwziWffQR2lkZbJmUgHMi9REgSUvTUDTo0mj/9Ub3382f5tUM8amx6kpFvBZA+
 M5wU3GcjtcIbW/ue7Be8YY+WflqMGvHZ1lhKM13jzHo7mmCiPMuau9p7Cp/RJUqBoWUZ/
 JWx7hVjcgT3HNxunzKfjXqgts8h+FOw1zRL/ibfFpGiLTQ3+yPLN8ItbMloMP+vPTFW9a
 h4zs4bSEIs6jg+jjIZQPUM0t6juikcOoY9eefOApeAeycpVK7tLPmihmiDXEZS8yF1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791219855;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=VzUX9D/BN9RoWpR7KSaRBtIDObOh9dbs4MrDyRtrccc=;
 b=XnR0V+3ORYqvelXVY028RTBky4BGOxukcmdbsM1lfL+9iD/BBs9QhWuUmYAuNkBJRajD
 kDGy8b2Ajy/z72UMMilOaN+LJ+7WEs76y7R6ZHdafBrMG057kBB2MqCx4FH8rf7rHeT5o
 B//E792Wu4d1stnJAvo+ejTqJ0dPb04T4NMIQFG1qihiQBYdZhf0zPctjTFwopUZ6VtJ1
 J/GboIRvAv0xGL/N1UFmJFrC0a/602lidnUM89UpzSgTP3UnhFAqPsV2D+HaTtiRHfTeM
 v1guap/kRREE9a1NXYwGzHbuPxLYvAOJib7nORAiJnxhBRH2kX8s7zwbZGHQR0hoiDw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SQi1KWVN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8426E606B8
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 17:04:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6B60A200420;
 Mon,  5 Oct 2026 19:04:05 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:46086])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Oct 2026 19:04:05 +0200
MIME-Version: 1.0
Date: Mon, 05 Oct 2026 19:04:05 +0200
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Bastien Curutchet
 <bastien.curutchet@bootlin.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20261005-update-rasdaemon-v1-1-dc40986b5952@bootlin.com>
References: <20261005-update-rasdaemon-v1-1-dc40986b5952@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <eb5c6b53c784c2902ccc4c7f9d97a185@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rasdaemon: bump version to v1.0.0
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

Hi Thomas,

Thanks for the patch.

On 05/10/2026 11:48, Thomas Bonnefille via buildroot wrote:
> As of v1.0.0, rasdaemon is using meson. Swith the buildroot pacakge to

Small typo: "pacakge" -> "package".

> meson.
> The patch added here by Bastien was applied as:
> b62e70c ("rasdaemon: fix build when sqlite isn't enabled")
> Drop the patch.
> However, some includes are still missing in rasdaemon to build using
> musl.
> Fix missing includes.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
[...]
> diff --git a/package/rasdaemon/rasdaemon.mk 
> b/package/rasdaemon/rasdaemon.mk
> index a6f53a7b6a..2bb9b81037 100644
> --- a/package/rasdaemon/rasdaemon.mk
> +++ b/package/rasdaemon/rasdaemon.mk
> @@ -4,32 +4,31 @@
>  #
>  
> ################################################################################
> 
> -RASDAEMON_VERSION = 0.8.4
> +RASDAEMON_VERSION = 1.0.0

This new version is introducing build failures with
"test-pkg -a -p rasdaemon". See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2914516840

For reference, the previous version build fine:
https://gitlab.com/jolivain/buildroot/-/pipelines/2914518318

Could you have a look, please?

>  RASDAEMON_SITE = $(call 
> github,mchehab,rasdaemon,v$(RASDAEMON_VERSION))
>  RASDAEMON_LICENSE = GPL-2.0+
>  RASDAEMON_LICENSE_FILES = COPYING
> -RASDAEMON_AUTORECONF = YES

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
