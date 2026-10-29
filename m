Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF3606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o6kohUCZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9755180E31;
	Thu, 29 Oct 2026 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_sM9PS9GEjb; Thu, 29 Oct 2026 19:16:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 178C580E14
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793301408;
	b=IhuP7vtJwfPwlQDnfSUeC1Vbk6UqZ3ur6Ct099tAbAoi8hg+inC/AQp7OSjVf+CPBUia
	 dEJGqSJe1cNpq2bNY80pHY3Tx9ZKX+Fi39hASegcZCBBI64rizuM/5QHf9p5RyDEtUZoV
	 hXUqjVhhhRRuc2ScB3uujVc1kIJ4vBKVv6Nhcn9MZnyrglxWQlRXB+ZqzcgI0MO5hfw0T
	 ikbeFSd1dIf8SbHJcw7/xMoqlQipJuGUTmeXcw9P5kKNL9J5qPEFl9V2KBxNXJlLUxphJ
	 HsM7eNzl3QKeKx3A+bI8SFWp7NDmiAZlTdilBvWXlak1fWWVpRVmC/n0DwCGqDUkG0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793301408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Mime-Version:Date:Message-Id:Cc:To:X-Mailer:
	 References:In-Reply-To:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EfXcQJL2qY5WB4l6NlVwFAvEpTiREk+15Weovh9WE1o=;
	b=O0wzgGisguXIQb4Qk7NOr8l4mkuydTiHSWAv8n5/45IZYT39LODMLNYyzCQU7oxU6240
	 hL2hnExOyik1NWRalnfx7+hZoIL0K3UXnTokDKMmT4wYQfZH4PF8rmi/xqgTBWyrPo8zr
	 HsNbmEDmfkdw8xtmAYsjviseaJnzN2YL2p6Mqhcl/rPqgd6OBrNS+ayej9c89Pb84HC9I
	 Z/Z5EpA7YZpdM9UTKXtcwfB1K9OoRc0zD/HeXU3eiqG53Ru9QsuZmLdtKYYw6eveIX+Xp
	 fBXiYsOtO8wisF3hiehYljl64iYFR2hjl68/lOTMXiCWKnhJMFhSqf/L9KaMV2+nlQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793301408;
	bh=EfXcQJL2qY5WB4l6NlVwFAvEpTiREk+15Weovh9WE1o=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o6kohUCZHpmqAR8CmFK0vmv1Iwn5jy12h/CSvzILn1v35mB6gI3fN7VM1ZERpbA0u
	 yHnaU9qUo4w3iCDFVNj/kuwweLlbsERNn521dg592fJQBdFOdaoaJP602xpHcMZS7P
	 15vbRAVhRNFq6Qe1ExbNDl9huBbMP+Bj4MVUYS9FD2U0o3THfyKrsqlKGBhM1Loymc
	 mOVrZsWH5WZfqK0aTX3HCnVAjlfIjPZeJP0QT1zWMPOueqKOo62o3SA6DcuSmJEoOv
	 oavUAClFFZ0bFjetLOM+1+6XNqEIZ9mtIF7h8IYCzZ/3ukfbK41PE+n5znH94Y2rh+
	 o9VAsFM97umcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178C580E14;
	Thu, 29 Oct 2026 19:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16BC02E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 079E260602
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ep7YOT5AJAcY for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 19:16:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 985B1605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793301404;
 b=CtufTyOWdtQPxsN59Wl44+G28WuiDDWQ0Jnc/9LO7dK8PSxGhCju32jK2cprxYsqpl0X
 G3+Aggk1ZaG8Mj7AxpnNp/Y1RvStvXnPb1FLHeB5MxfvsTGbl5/kR/0BJNV8NjLCc2xEt
 74RlUxhD8zOC5O9aUQqP/AemTLarwfpXK7Lv552NBNTPYJDoOJ8JS76XWQxLR9RyvCGnI
 jJOHT+ECGeLWUwNAjyjMU+0u5l2QxwXMMT11UzQmU/cA4Jv1SiXSyzs3nI9tCqbyWt8sO
 Kb1D/LEad4CwxJUkIkwG9LyxxSCO3KPODDoxAGoWpaV1eMMG0/ABqrKuP4Q3Xkg9OHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793301404;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Mime-Version:
 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kJBZq3x/vWY4/2J3+lIY3/oM1ZvfNz+VaS3ax40kJng=;
 b=EGk1oOkEia2PyIalanYWVjMgSFx5puBOdSokBMKJ1smH0OaXBEFgtj+egZ95uXPUsd0R
 t9AIDgo7RwoZUZiZRNv//wxB0B6guwIsbGyEmoBmCq4SlTmlOs03iD6r/bOctnPSksuW2
 Tr0HxpuBJCwx8PiXrxBfbeHt4vV8Ne3JHvj2DdxlvjBKCf1Ljo8S7QiEi1Ev+zTpH4Jd3
 2GwAisxybUEZRjroAOtn6Cf1G22qHZT3uDUD9R94bZPurytfi1PlpFCe3JSX7+/Atuhmr
 PBjopzy1rihP/9lPGCBXjs41gh5aJH1+0a2dcYJl7nbHnykaTRvQK3ivxL2t0ywkQCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VfeqlcdV; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 985B1605F1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:16:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 71BB91A13AD;
 Thu, 29 Oct 2026 19:16:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 383896076A;
 Thu, 29 Oct 2026 19:16:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9762910328F94; Thu, 29 Oct 2026 20:16:35 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 29 Oct 2026 20:16:34 +0100
Message-Id: <DMHKAFCYLG13.3E2IKLN1MHJYF@bootlin.com>
Cc: "Phil Eichinger" <phil.eichinger@gmail.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "buildroot"
 <buildroot-bounces@buildroot.org>
To: "Olivier Benjamin" <olivier.benjamin@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.22.0
References: <20250515123547.571910-1-olivier.benjamin@bootlin.com>
In-Reply-To: <20250515123547.571910-1-olivier.benjamin@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/psplash: bump to revision
 53ae74a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Thu May 15, 2025 at 2:35 PM CEST, Olivier Benjamin via buildroot wrote:
> This includes the following changes:
>
> 53ae74a configure.ac: fix autoconf code for img_fullscreen
> ec1ed35 configure.ac: standardize default-enabled options
> 1f64c65 README: Update mailing list to point to yocto-patches ml
> b1a75fd psplash: Only define bool if using C standard older than C23
> 5a32cf6 psplash.c: fix crash from length becoming negative
> ecc1913 SECURITY.md: Add file
>
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

This commit fixes bug [0] (progress bar not shown).

Could it be considered for the stable branches?

[0] https://gitlab.com/buildroot.org/buildroot/-/work_items/112

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
