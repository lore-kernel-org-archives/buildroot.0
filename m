Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9BBD2FED9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F120812EC;
	Tue, 27 Jan 2026 21:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYT6Bmn2Su9Z; Tue, 27 Jan 2026 21:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A6F8116D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769547625;
	bh=wPNhMrgW7QgpYVI6VVOmqgBaMtgSqekd4D3cORBrwpQ=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jUCBZi7QQl/fskjl0y1gy2Y9L9PgC179iwRKgIC2OBa4Lk4v0NU3+zACnW57c3/a0
	 /9gB5qL0Kftuu8DFumAC7OTaNFxbCjPYBuu4ORktpVXbIes0iVHbOBolsBxcAZt1X5
	 2h4qsSLdl5WJNInojPQchrz5D6jpps1ekpYekcPyo16FV58QoRZQUq7lOPDKDqiMgh
	 QgXby3U48VD0cEgbcLheumzqJFKnji43DFkrgVxRq8B8QRwWRWqN0hM3jFP+t3DNxH
	 MD41ZFYjVu9lKECi3p5LIl5zwkBT6KoYL8NbNFGBWQEEmA98XZE86rkKe4B9DJObm2
	 xmujbJXMX33DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A6F8116D;
	Tue, 27 Jan 2026 21:00:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E61A118
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 087488116D
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgogWVslELlR for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 21:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5775F81162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5775F81162
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5775F81162
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:00:21 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E2BBE31E0C15; Tue, 27 Jan 2026 22:00:18 +0100 (CET)
Date: Tue, 27 Jan 2026 22:00:18 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Chris Packham <judge.packham@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
Message-ID: <aXknYlAq4sBVhAv2@waldemar-brodkorb.de>
References: <CAFOYHZAeKaF89C8hGkiWz_qBT0Kq4n3bM=tmmSThhV2gBs75Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFOYHZAeKaF89C8hGkiWz_qBT0Kq4n3bM=tmmSThhV2gBs75Qg@mail.gmail.com>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1769547618; bh=/S/XO6BSQpx+Xry7ZQazFpdDMBqZj507aP1PmY5zNrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YwolLXWLiXJ8jTcRlpWhu5ot8YASCtXB3+E0ygrfMGi+uf6YJzFEzW7pJRNMiD29p
 XzuxXQqAwGnThk5KL1LScPCv2NV4I3iGCgTDiX1gyU+WgUnRBQeHy8mwyy26Ea8Kti
 5aeDs4wYx7HPf10qtmenq40U2qS7e1erjzOwXtdT7wJDSS6yEb3DUU5a1R5RKAYx5C
 qO0TMeeCcTTAy785jl40jMN1QV0WHJFwXY2PWyktdvB5t3v3Yur8aSsvCBiOFZGm4c
 p2cZmixMC79iIBnnh3/SBm9uMw/wCErm+1XYs0Hg1x270KbjgH3MEAW1TUKDFis4zV
 OQlayfWvEsQEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=YwolLXWL
Subject: Re: [Buildroot] crosstool-ng piggy packing off sources.buildroot.net
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Chris,
Chris Packham wrote,

> Hi Buildroot,
> 
> Some of you may have noticed that uclibc-ng.org is down. Probably yet
> another victim of the plague of web scrapers AI has unleashed on the
> world (or just people travelling to FODSEM and not noticing).
> 
> Over at crosstool-ng our builds have hit download issues due to this
> (our builds probably don't help the situation, I've tried to get the
> github caching to behave but it seems stubbornly unable to update
> things when something changes).
> 
> I was wondering if it would be OK if I included sources.buildroot.net
> as a mirror for some of the packages we have in common? uclibc-ng is
> the one that is causing problems right now but I imagine there are
> others.

The server is not down. But I stopped apache2 because I get a very
high load (280) from web scrapers using my git via https.

I have installed a robots.txt, but it seems to be ignored.

Any ideas are welcome!

I just started the webserver again.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
