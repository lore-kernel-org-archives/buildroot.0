Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18735C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE52C80A82;
	Sun, 13 Sep 2026 19:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh8EFxA1wSSp; Sun, 13 Sep 2026 19:35:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7D9580CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328102;
	b=b/4Xc4q3q4JIVbapC7ZOhlO+uWpgkmvqQqaIoiUHCSQOh2R50IO9FrKnt32to5+qgrsc
	 X6nt8KwKtmjR6foUuaGVPtZjenpRL1nndh7R73EjFGeztuVGbhNDtTJjLABgB1TNbJeuM
	 /GvP14rlRQYud73RDBnUXiwPex08vhDK4G6YdodBTn8hqsetoI+ObdivMKJfQ422wk+zm
	 T5hFl7AR1Smmd/KQ1WD5+ae9RZYcK0mn9eW++AQ9w8W+eS3IsbvJWyOQuUxsHcZ9dZKnP
	 5Cs0r+MLSnjo4jOXCnHVA6Oyi6AZboxNkykHo3v5W+874XAzkgOiiH81TSMT77PDOWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=j1G10+im8c5eMKyULPPBiF3aMJ1JDv/RRnsygWAXFBc=;
	b=eMWKv5MLyOYLEn37X+uUMumnz4EwEnTvEjqMIAdoJnZM2ZrqkOuapx+wtO3GIiFDpNKh
	 CuTPwDI2p/onTvzGZx7zXUZ7733K5iYHAuaf+Cpswkk+UFE47VFsQButnyHmKMBVB4gZZ
	 UwZApI5lP+mm08ahcS3DfVAz0kDiryEooJECnI/YcZhPpBK+F19e0SgmfxoHlD6A9a6Uw
	 G9eMQ6USYkb5af7132LAo8ZEUlpvCOLY2s+n4S+Pyo3kayas2dO6XNq719Ut4GSHVjZRp
	 a0hmn38slRNDHjItxjMeJZigKwluw9RNQIrIA0YDt56TV7RZfSt29eOfZ6AFebdE77w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328102;
	bh=j1G10+im8c5eMKyULPPBiF3aMJ1JDv/RRnsygWAXFBc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ktSDyUro+7CEuaIbMeS4FfTq8jUBxqfFkUcUzbVaYyMFSM+BoELTN2jcsHAzUafBO
	 hdvOcnuAYMiQ1F37iljdrBKmJy8MBq7uFLnXNuL4orLeR+reh/h7Z3fZHjQEKn1te+
	 fxCfFTVE9S2RXfju0BPkBu/mKT6KHdhaH3u2MOjnryqwDWvjf8F/ejsMRH0sxgb8tc
	 z6K9bA9AHQ5OWxY9F5gERu5x1YSUcJrcw71yZUIpGxpPlGZ1g3jN92mnQ9D3PSkiuQ
	 oLYIUVvOZnAs3OUsUZPpPvj7bJ7Pp/QoqvoXwU3Q9UnFrIAg3CpfHixyTMlK5qWpQe
	 QVsqWfUA/c23g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D9580CEE;
	Sun, 13 Sep 2026 19:35:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EDFD23F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8467640063
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkJYvddV9jLw for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A58FB40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328099;
 b=IRG9X0b1oip/XWJG8oXD+2wdMH3qe2CYvvmBQCaL6nGAA+EQZ7JlXU8VExdLdBxLL34K
 ivYbpY5GRqYAgGkeusccD73X/d73O3ltRVJDNqoek5UpbPA11FqYOWOGH3PZvtPFtSpL3
 OnaOfI07VT6+YzgNwI/7oxw8lMRKa8/d4vOJ4MmyBhcaNa6UhmKZX1rhBdbsKpoQhFk6L
 6NNpvJyGFiBZQtGq441d9f7+sv2StdKq6ihpG5Jl04bk3nnfg3xRZbXe/VRWMLhqOum/L
 hrnuJv6kSULF1jCVirVA+c+0NdZkI7TCiHYmO3l0mmUBa1YSZFuTASXNDRowptaoiIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328099;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=DtblKgnSfzX/9Gl/yRMIWtk0gaf9Li5jG6WpEIagzMA=;
 b=KDaQA0wH1E8UbLIY9t1zRNJz5clZFiANunajAqpRZ9lMvgZeVtwLZc913iEAMxScK5qr
 v/9sHs2JHrIdoU6BNVRjmr+4Babsun1pW+/bsTwy1NuHTqC5vJh4UwJT1AhjjvNMFu00l
 DgbzYLcatjbrj0gJg5MGniGVhwMfSzf4HGtNad1TtuPP1O6WMl2OWKDPK9NiyDFVpsERi
 AZ79Y74knQkULwHS+yJ8HCMWYOzVWL93C0ZDOiSNki2RZG26vswnHUUk6RDnHPLgUSON4
 NZelRLq+MjpauWF+QFuByvcDc5cI18RiumcwCj57RzW7E0ZTxdU0tUi94P+MPQW4Dig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RExAric+; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A58FB40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2134AB00548;
 Sun, 13 Sep 2026 21:34:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:34:56 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:34:56 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260913160834.1668831-1-thomas.petazzoni@bootlin.com>
References: <20260913160834.1668831-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3f570f061b8a212d3e4130164c5a6f3b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/pulseview: add missing 'select
 BR2_PACKAGE_QT5GUI'
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

On 13/09/2026 18:08, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_PULSEVIEW selects BR2_PACKAGE_QT5BASE_PNG and
> BR2_PACKAGE_QT5BASE_WIDGETS, which both depend on
> BR2_PACKAGE_QT5BASE_GUI. It ends working because we also select
> BR2_PACKAGE_QT5SVG, which selects BR2_PACKAGE_QT5BASE_GUI, so there is
> no bug, but it's bit inconsistent to select sub-options that have a
> "depends on" without selecting the option they depend on.
> 
> This not a bug fix, it has no functional implication.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
