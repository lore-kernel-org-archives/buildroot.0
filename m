Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CCAC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 16:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7532740BF1;
	Fri, 18 Sep 2026 16:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Px5VrqA72NaF; Fri, 18 Sep 2026 16:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A144040AD9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789750480;
	b=ChZDcqyC7KdLn15QKvRQEh3QXORZRgpo+5JQKQ2Vn1hqZEHmq/WtZE9cxd9D+RK/ZtQU
	 GE3DMk/7yzX+BzxBfQqDMpH2f0pNgoiBmfyEN/SKGBAVe+Ius4kmeuuWWE9DlA8CVTKLy
	 SsC1SyhqYxEb8Rj2T0PRLoHktB17yi99AcA20PRfWyxhv2xEeYpwY8Whh6t2+IxF+vyO1
	 h0Ak87cPm46uDqQvSUIyG164hoDq40sgLMimMw3UI4Z3p4RTXKxzFQPyRO6nRB3lxiEpa
	 1vdx4+1d4GbNi9DEJMF5eoynafVoDWAltFhbo79mVbEgVAEoVEoU1HxUzGiz8ESQ36w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789750480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Ba+W6NS2wBDy8LACqmKyb88aeDe270X8cFSddTNM/wQ=;
	b=kGhH19AnsRvF3vFOjm5NiJXBfiPXNeVU1MMSb9llI1LrjwdhdU5dke8JOVKMF1/AxMjk
	 k6pbcn6PaMyFXgDHVLPGj81HQjboiiyJXVBp5of3HJ6F1Mu/FTfsYfJ7dtc92NlbQXElV
	 GxnySkDuSWzUOo6p3dTUjY9huMzEgIcjLrP4jH5zMuZnzEQXKX3nj7cPeEKl6gKgFRMcf
	 0F2+s5I5d43+KdPa4itSouy6MZ3aSsFPTmNowtivj7EbYcG5iOJGXoEWHZSqm20RXKDA/
	 iB4ZlmRoz4dPVQaYgFPKIqxWXIMudVAQyLZUaUsdJri5l7GVyS8W+zG7CQYqslGkorA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789750480;
	bh=Ba+W6NS2wBDy8LACqmKyb88aeDe270X8cFSddTNM/wQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kHodoGAENM7XyOP+C5jAM9rhTSKF9Pp4Vf/xB7xID4hfRYySFdCxkkYkKEKWFdNbI
	 ayKSXysJ02UAoz6FJKyKN5/eoPqWdgGOTXqLKe3pArkNGGVH+WTNPYNnUtusc27h0T
	 yc0Mi31vBEQja8sk+bVAO6kMCB+igfsf4Deaf7YIsc+7FQ7JlXTalheyv0Ks7mh6A4
	 cPj1U+jCIb2umlYGH9fsnQwDGC4z9hNlZV032LgvogbYTyMOnXDdX2p20ICwxjOz7M
	 3OctD0ZMCGSi/ElhSC3HvluH672OipMp+6w3nm223YPO5W4RBLGw4aigsdF/wEYYW3
	 7kraAHTEjUQ6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A144040AD9;
	Fri, 18 Sep 2026 16:54:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5605825B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 477DD81322
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CorZK-IOvTLo for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 16:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6161C812C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789750478;
 b=olJgtbFD1/rwyWqHfTKbLaxWdgc6uTQC8BSDgFVFq+T6suj1GB5frytRlqAAaFvnnUhn
 VWwdo2Nep4F6lmlfmXch9yAwgpUxzvHpNm1lDhK4pARHKT78Gxnm/bWhS7GVPX1/8Yj6L
 GZJB7JT/IrOYInsDpAPiiNJOofCmGT2c1wPIr3mnHtQW5Fr+tYVDJEHU6mg6IiSyWZkg+
 VAdiOVWWvPEJbIBcapV3PHfbO02TsWips6mxt2eZervOnNF2zspfkIy0qMh++nNhLt8rn
 IWTUHF8pcEGK4EFoe3N3DKSmqKLfOP1BppP3afXcZQy1eHaJDhP8DFKvy5CmOumMwtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789750478;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Sy3wUYiZ7ekH/c2z/zKB54j57Ubn4Gwtjla/2HrgCS4=;
 b=B7sNBwxGV8fKz5yNSvQdWlVAlXVG5iTvg+WOjKThk1CPPc8sbtOY77t2IAYFPAeIgB4G
 bUWTvWfxBwv6ju4ZT8U38OvLKhb7Zr4Zjwq7/1GUONJdmzTG3tGtL5ThCPoKJbCyUObVE
 fu3weBB9H8/O17i74LtaKBOahyt7NANpmK2ebRiDhzJ47EheInv+EEGMVHNBJtBOj/Bm6
 il1nWllzVfN3Rtz244xscCvyTTdw4SQ0wDH8fEW9anf2AvB2Z5zVPE15kRqgCSP7J377O
 6vg0tGiPeCpJHJVnZbFSuWunkKTqWFYtHfzU07cVG8TbiH2AGQEHf/gRkoylBX/2tMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Waw+xDCu; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6161C812C5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:54:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 076F219F5A5;
 Fri, 18 Sep 2026 18:54:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 18:54:34 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 18:54:34 +0200
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <1c085135-c356-4e1e-bdf7-2aef0478fa07@linatsea.fr>
References: <1c085135-c356-4e1e-bdf7-2aef0478fa07@linatsea.fr>
User-Agent: Webmail Free/1.6.19
Message-ID: <7b6ecb42c53a1e8035f6cc2095607fc8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] roadmap / status of imx95 support ?
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

Hi Thierry,

On 18/09/2026 15:46, Thierry Bultel via buildroot wrote:
> Hi,
> 
> Being about to be on a project involving an IMX95 SOC, I would like to 
> get a scope
> of the support for it on buildroot.
> I can see the submitted patch series (from February):
> https://lists.buildroot.org/pipermail/buildroot/2026-February/796112.html
> but not much feedback on this thread.
> Is this part of features that are likely to come in a future release, 
> or is it postponed for some reason ?

On my side, I was waiting to get one of those boards to test those 
patches.
I finally received it very recently, so I should be able to complete a
review, and possibly merge it soon.

> 
> Thanks !
> Thierry

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
