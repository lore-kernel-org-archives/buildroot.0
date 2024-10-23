Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D76CFA45C
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 18:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE7AE40137;
	Wed, 23 Oct 2024 18:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vq00MWLVllhz; Wed, 23 Oct 2024 18:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD4D403B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD4D403B8;
	Wed, 23 Oct 2024 18:31:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD9A727ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A77AF402E8
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHAi7nqv0zqM for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 18:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96F8640137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F8640137
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96F8640137
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:31:51 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id EF414240DF4;
 Wed, 23 Oct 2024 20:31:49 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id C9CE324054D;
 Wed, 23 Oct 2024 20:31:49 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 9D7EB240AC9;
 Wed, 23 Oct 2024 20:31:47 +0200 (CEST)
Message-ID: <e5860d9b-4618-4fe1-8dc6-625e182d65a3@mail.de>
Date: Wed, 23 Oct 2024 20:31:30 +0200
MIME-Version: 1.0
To: Niklas Cassel <niklas.cassel@wdc.com>, buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-2-niklas.cassel@wdc.com>
Content-Language: en-US
In-Reply-To: <20241016132443.3859149-2-niklas.cassel@wdc.com>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 543
X-purgate-ID: 154282::1729708308-51E3522F-170071E0/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1729708309;
 bh=ewGftEbigxQWZKMeH6s2kOBWWFRzqa2zzTK/m3/MMi4=;
 h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
 b=qcbpJNqb1jsQFHllyVwhhvBdFNDKlcmOaAtPlEtVumGhGELO7RrBOq7DX2cUval9w
 HEF7XdE3k0ERdhje8fFAdHH+B73spMUEFQ4VmAYCGoSY855PFMzPrRYsurwO6VB6/t
 baf56oS387e0BScxBxA89Ft7qCgBzRIwuCIlErDb/lLn0tjJo9yrcvE94c8dLA/awW
 mdoi6DbktMu9ZCyFsFMrkqglToBLL3ZkOX3foy1Hg8ZGjGGEkgMqum/CuGe8+6n+GK
 lW+mgm+TuyHndphw6+nRHnX2oeX+G5qcVFjbdFTy6PivewoIS3yqjoQ9TYref/cONh
 FAt2Qdl6EHlCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=qcbpJNqb
Subject: Re: [Buildroot] [PATCH v3 1/4] configs/rock5b: update to linux
 6.11.3
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey Niklas,

> A bunch of new hardware has been enabled for rock5b in linux 6.11,
> most notably USB3 host controller support, GPU support, cpufreq
> support, and PCIe endpoint mode support.
> 
> Add the dependency on host python3 that is new since linux 6.10.
> 
> Also add the missing dependency on openssl (which has been needed for
> a long time, since we are using arm64 defconfig, but only shows up as
> an error if the host system doesn't have extract-cert installed.)

Thanks for updating to 6.11

Best regards,
Kilian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
