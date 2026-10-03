Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1285ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F2B413EC;
	Sat,  3 Oct 2026 12:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiYQYK6uhKX4; Sat,  3 Oct 2026 12:53:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F1020413E9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032038;
	b=Qb38nf8Fd36IbOW8vzzSTHUICBgwUPZZK9Ig06NBzNtMtcwsZhuL4TY/rY61CWi66g2Y
	 0RSxNuki5IWqlJ0bekhvBIwmiffc9sP6ClFjWeXQioqytS3pON0HqlwhpGmO5MApn4gXv
	 ezQPHFIKgf/UCAaBbKbbekKXwLI9tEHdrkiZjWoCrsVvh/dNf1HG4XYYtNkHV/qouYqaL
	 muyGZ3tCsMEnFzyhxVYA2Zan7Ejesli0yTRTUKTr8tnssP2gJ5ygv50288PxQJqHxowka
	 rpv/2qEiimSEjo4N4Z4ZDPaBgtMH6EHXQV8s7cWfdXX0NUxpsqfSa2Os28A/yT0XDvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mjx63HSBY6cxXY5xvmvYW8JK3uUDQxOya2ap97zYY90=;
	b=avLnqE5ro7JdK5dgyELz59V8MWuWiRLKsRp9WzxXwwcKTFhd3fJpjQrMAkjRGBNTnFow
	 NJ3iajvYXdU1xrkhbZiupaAaS2CZV4iyT2IGCp+pSKzqSQEvlB6THBBUMZZuH1kW1eE52
	 qsWlDlq6HbQXOwUKTY+oc3M78U13sRomahT0Gf9GV4BCJFS6q05+U7DyJQS6xb0/oAI3N
	 5VM1NcJDfNI2y4jOHGM5n2G1Y7WvuMgjyzJrZxolrSwcNstiGGH1xmB8u+e+AsZML6pig
	 sW20Iwb1mZcMFkUqkrQq/2vqrnlNWEh9ZQCKmQnPM1HquOf3O9m0DmeXZfv0Jf5ew8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032038;
	bh=Mjx63HSBY6cxXY5xvmvYW8JK3uUDQxOya2ap97zYY90=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYHyqQpPVnE41XzisdqbWkiDSqDs0DRm1pSkuHnh/2Ttdn9YWKsM6B6G+a9gC7wId
	 PoQuWvNMcgWxoUYaZHhB+g/+g3Z+/+GqbUQLcTG2TJh0eggHKeYrpl4d0OHf8a0pL3
	 qDPSZf89kLrRsFukDJLlht6fM7g/aDGgneW8j2MmagRjvG2bYdwNdqaA8xgf+s78WD
	 nV4T3X1R/sa1tGYsKWNofqwnqrTVaqulLPf4/lhRJXgbYxqasu6MBjGYszeBPdyHfK
	 agccwgtzfUXpV4MrNLjW3MH7a51gwegGGiH+CDx5CLZ9771wQC7kWFTBStNcz0Ysc8
	 v3F1d+dN12LZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1020413E9;
	Sat,  3 Oct 2026 12:53:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 757681A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 678CF4008E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4b96439mhgCt for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:53:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8674D40064
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032035;
 b=C2W6/f4uDZd1fkCCDxzHiiiTu8x+UgtW/9h4/agUXF2acvawvzxjSOgvwCURI/T8wyH2
 dZLQ6gw3VVRtM2AfL1z0iaD5jvRbogOQkq17wxLXQClxAQIc/nZaVPP6Je/Z97JmIc16g
 SYdWGiyF8jmPwqYlxn20uTg65OPXen2z05FC47F0htOfEOFF6XZ/ceHaAcbSTdWV2ksgD
 ZKX2gMr6okozmoblMbK3Yu3kbQZzFc/45HW1nnRjkv5BRIrEE8CP120efH8srQff86O/i
 TONHMe6aazNCPddgWyCQuaD2ds45taMzP8TOQhxThs8x4WLEIizyj7qfQXyPizaIoLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032035;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=x4MjD0NAXHLKvpq3CN3VlSBNsBjBGB64NEARziW5FSs=;
 b=jiqsRm7mJ8b53QLTc9qaduJlAZ0JcxkTS66sNgQsR514c3oNicjc1ZN++k3Rpo1Zqf1U
 aDlgj84ojS2E8djR8P6pGKPJizNulMGT88pqp60XBnriYhU2twZBhQV/T1SVe99/FFvu1
 nKmMXZgPxfw9Hg3Jqdd4HjBu8eHIS/gNBJcDLQ1+v2AMfYwZLkQMDnGV1utBa4n378iw2
 JSqn5DXEjffR0lf4//Vxkxd/DNyr1I4FaWpMySRs6kAaa/Nk47mikEPzdsVM+iEmSDk96
 Ck2tdezpJbud3ywt3DwyFX8D3dFK2YsJ46Y/MsfEn7HyxzQEv2qia/eW1TeYwcX6L6g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lPieW7ru; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8674D40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 73E7A4E41129;
 Sat,  3 Oct 2026 12:53:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 496B6604FF;
 Sat,  3 Oct 2026 12:53:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2A1910328318; 
 Sat,  3 Oct 2026 14:53:52 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:53:52 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD63Gzbl33MgGEP@windsurf>
References: <20261003084453.545653-28-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-28-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.5.10
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

On Sat, Oct 03, 2026 at 02:44:13AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
