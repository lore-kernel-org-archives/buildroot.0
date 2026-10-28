Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC5606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 18:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ltF9SeL0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D0F84AC8;
	Wed, 28 Oct 2026 18:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOGymIwQjsDB; Wed, 28 Oct 2026 18:17:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 17CC884B4D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793211395;
	b=LUuvzxlJM7ppdm92qq0RYTM6pfmNHuD+xfFg+8plBqHoyiwyfToa1cAafLr2iDybwt56
	 bmhEdI2MNTeQr2enmCpFL6PQqEXUgcyVe/0s2ZFaPJ/4GDWC9bI4L/MmK3VMATztd7pjZ
	 Npc2XvDe3YAA4tKeRBmIg7Q72THebMyJMhP5eCgcM/t8+KnYAhL/Q7G5y4W77QLVHOz8q
	 XPw29datD6I1zv1tIgQ9JN/W0TyWlcyFnF+XtQivQHhdbPti/+xlyV0ZhkUVcC2xZmu9k
	 uina7J5s4Hs5+ctjRenFzL+jtXqYzs7yHi65zME4a3bFNZMHU9HoDFwOQlE+16r8yHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793211395;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1Rq5WmbppIXn1AtpNtwn3n0BhdqXab6Yv6lL314/yTU=;
	b=ZqA/tuvDSjzRDNdpJEbmJadVk99AIx4bF1ZoHkghedT/dIlGsMpplV6z3T18bBW3RoNG
	 RRz92+B+x8GItCJbUeRpcyHwbceM6qzoNTVhya2ybAPmAEku3LJL6BilZL+VnkPUiN4NW
	 fa1qqjPWNbKABED+XO6GhcAX6aVRE2HpYQYMcXE3hl92hR0SxEKb1JybZ5bhG8MVN/yd7
	 24N1luYkr3AfcZ16p2lLR6HG3ma3ZEq53KXSYjHvq3KnXbWC/ELgTwhK+/WG88koyK8Wk
	 S3gronuvQLCUDY+RLPFRwHLWKFbpZzmEaMuG+pKuUpOvj9EOcCTZH06vcRjaFnqifzQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793211395;
	bh=1Rq5WmbppIXn1AtpNtwn3n0BhdqXab6Yv6lL314/yTU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ltF9SeL08fTXCkn2Q0R7XVkLbjply7v0XMswjXMNNJa4DsZgsK8W3FD0DpTjbTlYq
	 AavUuHapXLT+PSrD91mX9WaKhofYx9mvGDeh1k7Ry+MhIFAJpEeDo1NVk/0OuCyl8B
	 PJ8VCT9xeOM/SREX87aV72DtPvOcEd7Lwz2lmxyZ5qkv/dLDMKy1XsC8YZ/FT/Xn7q
	 JmAGT4ShJ/3dhigkFz0CaMuoLU3vtdFDppiSzxykcnqMtWoYOksYEhnAekimT8puoF
	 qU7aBB0YgqbHhNjr5HR4U+n/KmLCWdNHaETzZDODtBcbeh6rrSm62pClxKltwkElg8
	 ai2kpCLz1mnsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CC884B4D;
	Wed, 28 Oct 2026 18:16:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C57642A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B779740B38
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IN2II28q6dIS for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 18:16:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2390742A47
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793211392;
 b=aRmWm1rY/K3Gd6ktgqsU8+TrPzDVWPYWG16NYqUg41RuL+L2voKTvgVCJ0OEPkaYGVLs
 IJBPNKicKDaann8DJ+jeRTxUf29/iUsR1+kZRxqaYUxfy3GuTnAMYvT4xgXOr8AhMNL8J
 Ojc2iecln6o6eSCAm4KKcjpUL1QllaI5Op7MhidecLD/ipzEY1ZK8u0lGwiyC9XVDXSui
 mMFr7SHBPctqttLQGJN71V80pA1KVCzbDTnr9VyHTbtmYJ0UepLMn898ms0ykQN3rUucA
 b3nxQ30s+YxEsArQqgtcanNNSbQn6uiORKg/FbeW1UZeXP2VzpmhzSlaR+XJ7yo876w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793211392;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=meC3rIw1DwxGIFb1GekGpgSuDOI/lNtMYsUNfiCZopc=;
 b=VYfsV6AJ21u1/jOuq9R9QtowLbZjnHk7R2VSUrTLF5Ol3IJtwZAq3b6UtpPoSVvGvVUj
 tAa7bAAfz/7mbpVzucXga1yjHjP4b1lrh2fAFSopR78TXzSnYdOyjcvmbjWaAfcD1aKxw
 QTv9h82rIhiSuymdT2a+XzkMT8GCrGUhzZanOHaCRBXgkQC/SJt+xlQ0IQhj+P5sVFkap
 sDms8GXl8rBhSvJ8Lktyskf/lXeueFgf7AdSrFa6RmhmfcW0952VtiDZjdtpIWKwRyNcg
 22ykKLx+Rd3S80MPESpnGkUChg6Me8p6n4h+u6xdursEcUZa966dTXJq2vHLNUeOEJA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=o98kSh5D; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2390742A47
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:16:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7341A4E4136B;
 Wed, 28 Oct 2026 18:16:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 373E160769;
 Wed, 28 Oct 2026 18:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C944B103290F8; Wed, 28 Oct 2026 19:16:18 +0100 (CET)
Date: Wed, 28 Oct 2026 19:16:17 +0100
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 Petr Vorel <petr.vorel@gmail.com>, Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <auI71Zq-3lVH7z4U@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf>
 <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
 <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
 <auD5d-yrritLxAfN@windsurf>
 <ae0634ed-d834-4ff6-a239-6fdbdb180334@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae0634ed-d834-4ff6-a239-6fdbdb180334@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 12:56:20PM -0700, Florian Fainelli wrote:

> Do we have any preference on where that directory should be, and how it
> should be named? output/*/sources/?

Wasn't this already in my (very) old patch series? I think it was
output/sources/<pkg>/ or something like this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
