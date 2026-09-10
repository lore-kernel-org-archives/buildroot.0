Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31350C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03DD60BD9;
	Thu, 10 Sep 2026 19:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZwcTCQM-KzV; Thu, 10 Sep 2026 19:41:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BB04B60BB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069293;
	b=U4QqbmuRIFI7/WJjuws1DLHTcaEHNhEbai+5CsVW6zH8t0glbE4H1ErItV5xd+YJhKGY
	 K2Sr+fL2PKFoEr1tba0b32l/FLX5BGgA/1dU1Y9BEw5SyUBYzKaZTr5MIFvJgQSbPwloK
	 WbDwOgLRkskiiclYkGd3n+uvJU65Ev6q3ULLw8fgt1LxwoK5x3fnFwNjrzRuBbMxvLBy2
	 kMZ2wGyy0typzi3rN6USzmCGDJWv10eRa3eSJAOfVJ5+Ytj/O8x+lt5j/TzH09dCISLNo
	 tfMO4njVgX6EWiub71rUOCdvLcXP1RNTMpPX8ubCa3oln7rrTPaKRyNqgzfwJIad0Uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nNd61cSjBwV2Jdgn7yHw+J2PRhDrUIxLiXld3uPwKdY=;
	b=TNjuVttfCuwF0reV+fTwWxBy3/VfC07Wt4+XCUlk8YK9K8Y2TRkXlorWArrwQHleEVUP
	 m+w0A8e+j4MJmzA6z0zcZaS+GNdKgZUIMJVkeYjvbCL4NzthqlC8ugF3jHk4N7VLO13QC
	 QRTKPFOh9278bETOCA3UuwEVliIYnmnhLsncI6jH7XHCXNdT3u/JQgYqpfBQbm4wFuEbf
	 15quIvvwFGYCARJh9BlOLre749uVLOOaZ9/JeeTJD8mJSEcOVnYpLCCZFMU+FcPnxj5Cp
	 uU114cqV7/VyBEPmqFWqhAmKIdrQypjvXbYQX3m0LBk8kDXkgOTMrrhBBqtrllTbpVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069293;
	bh=nNd61cSjBwV2Jdgn7yHw+J2PRhDrUIxLiXld3uPwKdY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g714LpsIJnPUKbP3fvGOdluDZolceMAx84WJgX6KD1mxvMnvVxvKBvtw3UzdCGt0u
	 MqYSgJfrEghPK777be1HU65Qe9b3byThXhMjBoHBs/wHX9QVl7IZNZro7IgSGaUA5L
	 zI7EAkh3o0C0IKhacPIYEjmcA4ql/28ulE+kWg8SgsAKCBINZx5szOVph0atPTUE4i
	 gABJj07TrAn4smt8lFINV0t5zqvCjmn5MaVrSP4YulxB5hhtpFV6/1k/KHYMAvYvm5
	 ges389zafc0iK2SIJ8L/srH510yOcIe6fn5ehxakmIwVbD/ToSguxFZ6HlwP1CfzvK
	 gHVcKW0PzJ7UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB04B60BB7;
	Thu, 10 Sep 2026 19:41:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E22C769
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FD3240AE9
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTGGExCEcVMZ for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:41:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2AD5640AC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069291;
 b=ftn9kTXkaD/fbmt56E4iDpCKbSz8qZCw+TOutczck8qa2q6LvovIMzJJO2A9y4rJPKq+
 h4QAXMcFd0rCC7e9ucluIt/woLwIK6LDTOoafnme74Amd7+nk+A3QdZDpVPW1mqWTKscm
 K3B58CCv9cEH9FsWb/sviS9nzbVEXsmFKZTc74UdePVpNA4kkxS4He7+Q533sv0l2Ke1m
 usuSTqPq5Ms3zPR9+6JtDlGjSP63LWTGJdcHRPk/hqUGAYlmQ7GhviIz7FEVl3fHE2OHd
 eQKm3cs12KJZfG9uOy+W5rZazEylPHVMI82bFmlwWyiYqz4ILLSLREQzHE2vcMGMwGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069291;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=nBltJvrn3oBHD/bMMLpwxB2TxsSq4bp33PwyC9Wu8m4=;
 b=TMQvL63wjT5iz956tqhPJ7ry5TyMJqPUagD2evSeDQqZ25dSrPQT8nvXq3cXxwyGPjFj
 p/rjLeC1Pa4o1a39PhwWlCRDRZ46ER7OrWKp8ddGpXU4au0Zw/5WtBRuVNf8SbpDf7U29
 DCzFoj7BohbV2b4FYHB1WuuIsOqdSz3Ucc/acuWad0jkubOsAlj0XzBL42aLaMCasjV4z
 /b9w1V0TJJkW0naRYQkfUe9j3oJVwvAq4IuHVCv5l9rTM/0iBCytdVEI+YV96H3ksR1g4
 romdAS/kLI4gUeDELW/fGKLmvZFjiOulqvmMgWUsl725jXegDaF7zbx2T9fM26oUALA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="BHP0PcH/"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AD5640AC6
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:41:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F1FD44E40106;
 Thu, 10 Sep 2026 19:41:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A7E245FC38;
 Thu, 10 Sep 2026 19:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F42711C787F4; 
 Thu, 10 Sep 2026 21:41:20 +0200 (CEST)
Date: Thu, 10 Sep 2026 21:41:20 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Chris Packham <judge.packham@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Romain Naour <romain.naour@gmail.com>, 
 "Yann E . MORIN" <yann.morin@orange.com>, thomas.perale@mind.be
Message-ID: <aqMHaMO8m4LZa-4Z@windsurf>
References: <20260703083137.155274-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703083137.155274-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/checkpackagelib: add new check
 MissingCVEPatch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Titouan,

On Fri, Jul 03, 2026 at 10:31:36AM +0200, Titouan Christophe via buildroot wrote:
> To indicate that a patch fixes a vulnerability in Buildroot, the convention is:
> 1. In the patch file, add a tag 'CVE: <cve id>'
> 2. In <pkg>.mk, and an entry to <PKG>_IGNORE_CVES, and add a comment above
>    that new entry to reference the patch file(s)
> 
> However, as packages get bumped and their patches are added, removed or
> rebased; it happens that IGNORE_CVES get outdated. One important issue is
> marking a CVE as ignored, while the corresponding patch is not in Buildroot.
> 
> To detect such cases, add a new checker to checkpackagelib that finds
> occurences of:
> 
>     # 000x-some-patch.patch
>     PKG_IGNORE_CVES += CVE-XXXX-YYYY
> 
> For each one of them, ensure that the mentioned patch files actually exist
> and contain the `CVE: ...` tag.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Thanks, series applied!

I have applied PATCH 2/2 as the first patch, because it fixes the
issues, before introducing the check that was your PATCH 1/2.

In your PATCH 2/2, I have adjust the binutils fixup: the
BINUTILS_IGNORE_CVES entry was no longer relevant, as only binutils up
to 2.44 was vulnerable, but we only support 2.45+ now (and so the
patch referenced by this IGNORE_CVES annotation was no longer there).

One additional thing that could be done is verify that the CVE: tag in
the patch references a CVE number that actually matches the one in the
<pkg>_IGNORE_CVES entry. But oh well, you proposal is already
improving the situation a lot!

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
