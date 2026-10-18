Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F287BCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 19:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9315D406DD;
	Sun, 18 Oct 2026 19:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY92O9zLDvKu; Sun, 18 Oct 2026 19:32:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A785406D0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792351960;
	b=AN48ZnwNeMYFZddKRMmJcLkcKErCWZ99yaOnqMak4nO0NKbIw2cNjmaHYvLux6s9FA8Z
	 zw84B8jJidgfF87wX1mXAo3XMSNuxB3XcBt4ATLdhADKJ8+Obw18TgogcufP1SBs7NEeC
	 BugXKd7JmahBMw6X/NHLKT6YPh+6q1l4i3fIrP9f/WjrM1wYypjKC2JuBmxB2HNmv5hTD
	 XMH7HEwo+XrABlwlc9VscP8TcrDApzU+cUkttllfa2LFWZlbBOPRka1cT0EN4oSBQoh5v
	 o9XdnYMs8ahKlh1940FBG3snOat7FkAqFYduvi5qz8pk2MdlJRDDxh84qnbbTsPlN0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792351960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sUVNavkWkpPB3wg6TDlZIWhXm8XGoG2AkvrV4Kf23WU=;
	b=JoFct//n2KMf8G0iK4zyzUBn9w2uyUGSrCesa7xgMFX8WVzYJzlhWYmxvKpt2XYqwFOR
	 dLI6ert9U4scqmcj/E932aB3H1nquZKoeIkaPs5q3L7LWZ1AD+SZjN6fcYTv1SwGwIkhc
	 T8gH3mweW0TdR4O1zwWOdhNLXV/juoQwGMIY75R6kZRB8iWZcC4o7wMXRHxLinYAAVboI
	 GYw7QkuyN9cabF56YvnuPR8Ou7RLP1DvrxgZw5M7DAoYNSNW0TytrwywjKuzPnsR4HLF0
	 iolTDuJJ+q6HOfcF94AwA7iCFFogiyuPYpaqgUbynUJfLCSreDwKovKKa0LeKamTt8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792351960;
	bh=sUVNavkWkpPB3wg6TDlZIWhXm8XGoG2AkvrV4Kf23WU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=brQ2VSfTWz+kpTiSv/zOts1e2nZ1VEFZTI5L20sD1kFtPx/5uwyRVkvXM36OBgNKJ
	 eNxxA9yQsicIi80kUZq17syThkCXz3EbpHMF8BGMH8xZrnpDGu/mdcb9E5pqOlESJ7
	 mDIX1jGcebMaCtnZS/mWMx3PXcu/f4tQ0iAc45MmV9tDsNhUitTzjfxb+IQKcAyeNL
	 VoIV3hh8jvzYy7ar4ef6QDPSXUL8WN2fURUmR45f7J1b8CWmyrZunsjKOPicnn2uI4
	 MLRhcOKDrCP6oZQQqKhcmX6/00/CyEDuy/d8Rs4SWOJR/n1CAJXxyA/MmINIlzqKCP
	 9DM8On/SNmAPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A785406D0;
	Sun, 18 Oct 2026 19:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82B15769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6924C60606
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsWA8sg7_fXZ for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 19:32:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 046A1605FD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792351958;
 b=o5Hq1GsvB4KRgrYPvGbhvRHjg2eJAPs9kFQkTuEqSPBbRpMF8f9JW9DnqnuZFToQZ2qn
 C4mu7LywIktswZt9jWdhvAm/2RE9YEFHVTksX91a+K13z69dLfeoMxQ4Ag+RWrIypq6i9
 EpyhILOPHvll0PW6NK3N7Dq7kL6eCS3Lqj2VduJalByv5G6zoyhXQy20Trnw6f9/XApZk
 2wL3kQPqp5+HCL7GqDdIWtoOMft34ChZohMlVJJGW7Iu8YysFKqLvjwMX3wVdCkCJnWoO
 egLjOKNnW0HS+4bLHJHo+v8tsW2TLJPJ2TB6H+YWYgt4GK6PSLBtF1uBzmeJA2ORLmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792351958;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=UKqt/PsurBnBg6YNe/Fwdur+SlcHB08eFgZxk78Embc=;
 b=R8onzlA7rXd40fa/DEgJ390u/N7yaD6e5MjBTUyt27F9DqYF52Nn9/EV4r6rYSOvDDMM
 Y0nmwGKIy7AZ6k1778P8n6qjQO7HqVlwycrccq4wDY+aVnvzNfCAfQtHgAnA8bNjwYdFI
 0/aqr2XR6BeDvOLzrqlbTZRT7JT0FSvv70FqblLAVgwKFajxa/hHCLXfMmcvwX2D0Ibr2
 h+n3SpoHmPYXPtUfGV7hk/c4MLWKlZOZplUe9i4Lqcr5ygAOl0P64vME6F4YMLzxWhTTf
 cLXW/fShC0Cyr3YvENHY2iVAyY9ZYcJZibBMHUmDY+a7iwNx1aBtSPYibuJinUfZvEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=crRv0CNA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 046A1605FD
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:32:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6EC1C4E41213;
 Sun, 18 Oct 2026 19:32:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 264F760582;
 Sun, 18 Oct 2026 19:32:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18BD71032868C; 
 Sun, 18 Oct 2026 21:32:27 +0200 (CEST)
Date: Sun, 18 Oct 2026 21:32:27 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <atUeDroTYvzii7To@windsurf>
References: <20261003210614.1376879-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210614.1376879-1-alexander.sverdlin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Jardin <vjardin@free.fr>, Romain Naour <romain.naour@smile.fr>,
 arnout@rnout.be, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 11:06:12PM +0200, Alexander Sverdlin wrote:
> Since U-Boot 2024.07, boards with CONFIG_OF_UPSTREAM build their device
> trees from dts/upstream/src/<arch>/<vendor>/ instead of arch/<arch>/dts/,
> so the files copied by BR2_TARGET_UBOOT_CUSTOM_DTS_PATH were misplaced.
> 
> Derive the destination from the U-Boot configuration, including the vendor
> sub-directory taken from CONFIG_DEFAULT_DEVICE_TREE.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Thanks for the patch. However, I don't really understand the
use-case. If your board DT is not in the upstream Linux kernel, why
would you enable CONFIG_OF_UPSTREAM in the first place?

The whole point of CONFIG_OF_UPSTREAM=y is to tell U-Boot "use the DT
from the upstream kernel". But if you have to copy your own DT, it
means your board DT is not in upstream Linux. So, just disable
CONFIG_OF_UPSTREAM in your U-Boot configuration, and use the existing
BR2_TARGET_UBOOT_CUSTOM_DTS_PATH option that copies to arch/ARCH/dts/
and does the job.

Could you clarify why we would want this change? I'm kind of missing
the point.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
