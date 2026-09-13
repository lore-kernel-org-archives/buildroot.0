Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D9CC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC8B605F7;
	Sun, 13 Sep 2026 09:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjpqUouH4u4A; Sun, 13 Sep 2026 09:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 69C8660614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789291643;
	b=DRZwlJhJw57PLUu+SRBPeu2l2vbm498lUyLhBS17EKti3kt7R+C+8UhO/xfWz69g1++t
	 O3egL44sIykHUBbk2CoJe4tYw1xmYOhC4EVutFS3aqumYWqDV2VJCARWmPSM5VD7Pa19D
	 a1TzBwYm9O+FMgCD2EOKWVhyoENC71f2yOoSge1XcSQ23zdWLoxoVsomOr9Y1CJyHWTe6
	 Oj2fsNTHg7IjGhCBUDLjbZoAKwfuZ+md0IU+2lbevtaERCcNE1CND3PVaJHUBW59OhI2n
	 MeRGBX8n/aEd1rs66LtIJbEpJ+cm80Ft+cT+ATsPVRwMYJNmBm+XakmEMhl2E8ldBQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789291643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=JsaQbvMkdjbxmHt3rUBDYke25wLiC9bAgvcG7f681hk=;
	b=SBA7/qDfaRk2Qf4vGsUkLIGkVqk30rNDcP8iDwxuy5zCZyByxt84ihNCLOYxlaJCFYYO
	 RkBseET2Heaf2Usul9kyyfEmeP77OloYPIn+W2446mbr3hrxc9nwHS8p/+m/3Qd082TSz
	 hHuw6IL0ezCOYppveyW4PoR5Vzg7VKQ2mhRewfGOMkrnmoTMV+o5YXSmv/CKYzzq3CII9
	 lUMGOFO4ebSvN90FOE19mLNSvRTAnP1oIIp0UqFWx4l5U1oWlRu9CojC9ZE1zPPHyRSaK
	 Fx9n1CvP8JceLijbIqKhQsQtf9Im6ZQPukjoczhh1Z8AbpzWHOAkzsO9npUR0swt5Yw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789291643;
	bh=JsaQbvMkdjbxmHt3rUBDYke25wLiC9bAgvcG7f681hk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EnbNZnzdMt5qiEbOQQ2G4BGw6ekd40EtgZkifBe6n1Mx/rPZfDADE1ABF3dP2ahKT
	 4quOBuLF9ZpkZd4NGtNm+fhvtF2HdPyAZ/V7+ALTPO2ZZrgZSJKZ4kKlR/KmcoJxPQ
	 JABujDLwhEAbwpNetvBiFABTX3OTaIhSNDNH8hZBZ9V/Y6+7DbsyA+5D7mtx9jL6to
	 LrUjgM9WSfM4g2fZO9QY6F7ue+nHx5toJDSxKUCV5V/6R4jUHbioB+SVfDc6r6MwRs
	 5PwBKEeiuqNqzcU0rbT2B1i2+k37PmxErDJ3dp+quNcQiqJBsy379fP2pJnERnJBk2
	 F0CY725hxObIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C8660614;
	Sun, 13 Sep 2026 09:27:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F88224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8903060614
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq9o50GnKVCK for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F82D605F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789291641;
 b=dGBya2oeyvPRh6RW+j1+M7UUGo303yhDyXx5Cz5K7weCteF3Pw3n2/co6JECn7rg1I5m
 d4sODCORtPsANv5EDN6nAY4Ro1DxmGUce4qj2FQPU6B9BMZXuG/DSQ6SMCfcvtjO/k1mr
 H5hC0GSMpljeFTp0l+wbs19gnap0IMWBKuMQJs06K+/rPZ1/ZtlwHMPEY/BdSCbABYlCY
 rAXCCfhLM5wMRjBdvUPPhWsoGoNGCobossJt7I+A8iGnzbXFfK9t2fD0dXb8UUKCrfgh2
 0W0j55ChywT/e85XvfeRYKvURHfTr4zi5ltHY5LQ8rjZ0xkgLJJIkkB4KIL3YRVUi4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789291641;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=hPvucBHlR6ROYrgmScXUhr7iPhnRwgZsdrURgD0690o=;
 b=UgiFz/3dYzhxoLITV7F3svOHpg1dT4yCFUEnRCcO6ZndnMUsvLOmO6tudKHl29s3dcen
 Y+1WO34uMiA9q+nsLG+qtmtPEKVsBQWGo9E6CnDo1u0WyPhN74XNxYpHG+jSTvFvPiyzW
 ZO0EUoJrrTGqEjzNp8fTNyiguZrOm3a1joRCnFlvwMOFYMD9BDnsjClWX9dHhBdsiBalI
 nR/JUrwJsF56nRHsMW7YjXEi749RVauzOEYQEiinyhNFXj1qHWneQbPK2VCo+0ymABwTD
 Ar0AnkUuA/snDHoePT4wpBD2xa9eAV4cFVZG5J44D1vyo9lsmalxQYQfzUmRCGs528A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cEo0dJdH; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F82D605F7
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9D8295FFB1;
 Sun, 13 Sep 2026 11:27:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 11:27:10 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 11:27:10 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bastien Curutchet
 <bastien.curutchet@bootlin.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, James Hilliard
 <james.hilliard1@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>, Kurt
 Van Dijck <dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <20260912211801.1557569-1-thomas.petazzoni@bootlin.com>
References: <20260912211801.1557569-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <11ea890a662e634932a55011ae85bfc0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/*/Config.in: harmonize select of
 BR2_PACKAGE_ARGP_STANDALONE
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

On 12/09/2026 23:18, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_ARGP_STANDALONE is defined as follows:
> 
> config BR2_PACKAGE_ARGP_STANDALONE
> 	depends on !BR2_TOOLCHAIN_USES_GLIBC
> 
> Some packages did:
> 
> 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
> 
> while a number of others did:
> 
> 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || 
> BR2_TOOLCHAIN_USES_MUSL
> 
> This commit harmonizes the situation, by settling on the first
> solution ("if !BR2_TOOLCHAIN_USES_GLIBC") as it matches how
> BR2_PACKAGE_ARGP_STANDALONE is defined in the first place.
> 
> No functional change.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
