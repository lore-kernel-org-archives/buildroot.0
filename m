Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1BDC531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D5E460672;
	Sat, 25 Jul 2026 21:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtO8ATV_pubB; Sat, 25 Jul 2026 21:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C08896064B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785016545;
	bh=HXu9vxyveO2LDl257T4vAs+SHc2Nti0x+UtItHUuu4Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=agsKMfQ8SuRE35C1OmGV1usKrbi4b8jYfwipE1qu7R8wx/f7fXvhZDrFWNtiGObVl
	 PW7e9bkTJV22W7TAfDh2pEXHjE/ZnRC8ljJ0vbhJ3sijd4EPL0n/DBs9i03ejFbkuT
	 /YFIIj8LWWXq2flB1m+KMakMeCnKTQyXqIJEFTSXF/Cl1NQJxj3L3Lr2yFtlWUafpe
	 d80efF8jm9RauN9TizPAk6p/S5CFKLCy9mtqQyjs4HkaPiNviKsuuVsqPLb1Ibykh2
	 32GBJUJ5XodeYqBttve6NO5sUmVcI2Vy94/5T3LXI14N9Wuta8sOpM30xkkzd+yFdu
	 BIBTDLAcsNkZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08896064B;
	Sat, 25 Jul 2026 21:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1B6C490
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79E080C95
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsUMfEvk8lx0 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9412980D7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9412980D7D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9412980D7D
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:55:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6F57D78034D;
 Sat, 25 Jul 2026 23:55:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 23:55:38 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 23:55:38 +0200
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>, Biagio Montaruli
 <biagio.hkr@gmail.com>
In-Reply-To: <499674f6-6f37-400f-95b6-bb690ab203c4@grenoble.cnrs.fr>
References: <499674f6-6f37-400f-95b6-bb690ab203c4@grenoble.cnrs.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <b962817b3f0a5afe13d38b5a43e73c5f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785016540;
 bh=U90mmcCSsNKzoD3Ly9ySZdkerQ2243DdsSvscAssFoQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VenUULNrC+hKLQnHVQywTq/n7Aq1A+xmdDF0JZZTKfOfogJ3BHEQRpKqkqL9g6Ck/
 bZ6vcB1rLChrIV5E9z0XReWjMeWHFDu6oQH4nnN6IAGC3UTnS+3c9Av4k9SEpvV/us
 /11HyyClcN0xrZQ8iWsiD2pvfkFrUcCrT883f95KSaGvK8tPdgP044a92/7NqqCxyw
 kygFcUPT9zImPcyU44nva9Zui7WhzN4dYgQ2lfpcu5KStsZlwm4RIPIiM51W06S95R
 PWuTr4UCFHXBoZxlHHo39k/+AO1op/Fy251y/WiuA2iAFtA7+Q2C5D7PnuxHiPX5tf
 pZyXYKurUtKgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VenUULNr
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.40
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

On 25/07/2026 17:11, Edgar Bonet via buildroot wrote:
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
