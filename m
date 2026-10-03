Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3800CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE0CF406F9;
	Sat,  3 Oct 2026 18:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hclJ-lhn1LQm; Sat,  3 Oct 2026 18:38:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 821C140705
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791052704;
	b=N2pkBTB0lBVRmqnglJ229AWuzAACa0SJnT1fdccOUU3s3Y0J1ZK9dE0/7a7sIGTaRr7+
	 EB0hCxXEVkNrBloUjsZeaAS2e4br+wKHtf2Z/v6xvhP0Wf6r21OZHR41ph6xxGEzqjoBA
	 VX4IIeIJF1WQsxi0JeSeXoU/NvoaqZXoWpW+son6xeTO/hNiwjsjqDSLwjp+j4PxuEJkU
	 2WzdUFb7nqDigzHwMHQvp99S/ejg/eRmDVdhmxDPfJp1egJ1RryvEtNYebN3jKDK3qxV6
	 myKqNpEfxOwC4vmVFonx3xZL/HF1QymJkzklAU+Nfqek6dyKYXyOEshvD/D6i/eItxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791052704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X/HiwrSOL4BXFaaQZb+F76dIZY+rinzapdjVGPH2BlE=;
	b=kcq2hCg51wcs8YCf9Ke8+PA4oVHR0Ja1IHrAhS/wS3PhpS3MMGQPvecsJ7mBR656aGsP
	 U5PCTeOzjIeHjirAN36NR6cfNATWLsIx287H/CChPH0bT+qlOPJqwrUsEvcgjnC1QFLQ0
	 42pkIXBrNrNQDjnAFRa5ZXK7lIPNz8EGKEAPecgI1esMYt396mp21n+5D4Swv2trbQItV
	 9Mu/Lfc4rwfuNznOx9DQu0lHk0tjwF3kW5BE0j79ehfEfQiA6Ps6MZQiT/rJgIO99sgVD
	 0hnPEkepLl35ZV/aOv1s1873Npy2+MU9wt1rypeHk4onsYSJDEgIfJHnCNDQPDgabrQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791052704;
	bh=X/HiwrSOL4BXFaaQZb+F76dIZY+rinzapdjVGPH2BlE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=duTkuAVBb/ERPDwRpEiTJ4LEk9qQl21L3xot6U2pW8UlkopGz2re/jNkKFTkrU8to
	 o2GGfC/9U6U1xDZyMhF7+Rbf+8+PogmeeESBUmKMWVImrojf5zl+BCmYMBbqGfyiqv
	 ClBlAIs3fLOb+Aw5MZnUEnRP3kc/JmsX3pGZG2EJnuoBK25wuRGBvikwIFvweQp1/o
	 /+usmjNSJWRE0aidOtrgDVaLprWhOq1gGgxccz+h4LQm59Nd8EgpjKMQZM8mUQjg9H
	 QxMsSxWpgWj0JlXvGO+TFBpSsaSoT1/QOvstj2OvJ6+wF03X+ZyoWRPjxllQZyCYyT
	 HjYTVrAvW3+PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821C140705;
	Sat,  3 Oct 2026 18:38:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D242435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EB446069C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0MabNMnFCZA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:38:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F1B1860683
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791052702;
 b=RQukKu6SuKtBLcpwarnkBRQiBu14eTPc6kCf+SJTB0UJRqd0YCUSFAo85B2sNyhbwXjD
 iOZFaYhK1Fyu02i24+EWmeW7b5UdRXwHbYJeTGSwo0tiL+66dUfcfRSoaGwcIEdBia9vp
 7KHjOfm8vyIb4jWGBr3gkuoglxYYh/TVbe25i/G0+/BH5d6SPkfH3VkPhG5A0JKwPvCs0
 p6xpRnxtA1ctVM1DSUsqiiLZPMr5oF+OF9S/8zw32L5MyCQhA00FQZBZy4cb98lvTMyrQ
 ZKuPD2kH5qjOhoGJKJdPHVEbMQ1O9FU2Y9nPeRQNA9Qw95tVZ3a+SV1JeWc5BC6/tqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791052702;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=QRtuN50pDKY2BOatzzc6C0ygMJiP2EGYtEGbuAw61AI=;
 b=MoJ/ZNE1BSA6d4KT0CJHIRZIGgC5ElxwGzCCa62sli4ZwMWk+BdZhPfbnANy7GYhdOfU
 1aCyZdv8oEAA8pOW+qTliuwyVrjIIUWJYR0T/Jvq3d+bUQ9u9S1S1JWSHXoYtALt3d8p4
 oNRN8cEgQRzSLBrivVP8YhmnNiesPr1Z3j2Z62Aa3zfE4SkFBMoBqF9KzJQmQc10Fkhyy
 5JOvxUt6bti7r9L6GFd0HUWbUPZ4/uL0Hu6YOfvy2fuiqRv4MqgWPmKK+ljsacbq+L28b
 Y+9I6KpUH4Gx2ipeHhtESkD1+fZp0PH88w4CXRFa/6GFEnfgHhHDe/Ks30PQgr3f9lA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qrVZe34g; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1B1860683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:38:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C83C61A10FC;
 Sat,  3 Oct 2026 18:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B37B604FF;
 Sat,  3 Oct 2026 18:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7DF7C1032827F; 
 Sat,  3 Oct 2026 20:38:18 +0200 (CEST)
Date: Sat, 3 Oct 2026 20:38:17 +0200
To: =?utf-8?B?QmrDuHJu?= Damstedt Rasmussen <contact@bearware.dk>
Cc: buildroot@buildroot.org
Message-ID: <asFLloIF97IilsE5@windsurf>
References: <20261003180459.1243570-1-contact@bearware.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003180459.1243570-1-contact@bearware.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk-bin: CPE ID for
 openjdk-bin
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 08:04:59PM +0200, Bj=F8rn Damstedt Rasmussen wrote:
> The CPE ID on openjdk version 21.0.2 in NVD:
> https://nvd.nist.gov/products/cpe/search/results?keyword=3Dcpe:2.3:a:orac=
le:openjdk:21.0.2:*:*:*:*:*:*:*
> =

> HOST_OPENJDK_BIN_CPE_ID_VERSION has be overwritten to match NVD's
> versioning.
> =

> Signed-off-by: Bj=F8rn Damstedt Rasmussen <contact@bearware.dk>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
