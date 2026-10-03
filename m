Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A500CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2699B60F4B;
	Sat,  3 Oct 2026 16:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzKmYQD_3PbO; Sat,  3 Oct 2026 16:17:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 47C6B6068A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044222;
	b=k6Oyi0WL2XPqeZCEMntc6odpRAsmGCF3kxghjvVr/+AfSN92g7DkeU/+du0mfHmTBT1/
	 L5K4VgZ2lHUh2Ep7cGRGPnRa4z2L85UJ/8kOA8sP3jZcLV6G96qYd6oi68+HYCQKixHLF
	 rxz3H3nxuPudLoSsE78xsqf3g0codiTG88H6xKFFlTFXkJy+Xxle5CcyXJut10EEaOhg9
	 A0Wc8YL0jCYqipyboLQWxFTwkd65dDeNJbAJXyNFwWYOh6uXYAIxNpjDpVv3LTIkntxlK
	 FjF187+VWVWkAYfzUfJSyULUnl4ZsSrG0JWtFfMW9UdjwatRiytGSoj72zRdNpEIahg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wuyaEtPdrAkarlXMhkItUaSO9G2YIT+1l7LKROS60Lk=;
	b=bawvB0nIzf100Hf3CTzxgs7utJCiroNX62p45Vk26yVTpzs909YHrvLbFyUftX91ZvU6
	 53Objpl+WnavzkKaSYO7NqLvGdggnEr+O9NyPh9FZdYywiNjlh6E1wmf60sD9x3OpYiLJ
	 AeaYYwV+qqNJOY3JGRYqUlEs1DjXPusiSIflI40h6ZGTuoGOdiduYKB/lEomWt5Ev3rB9
	 bx5oFxatJUrmBvmAsySEtH+2kGagWdar8LOcOBCmIYe53JtACrJlDEa4vWoH76YWMqA61
	 fCgm6oabMEtPOZL82jpyBLxj6Czd9HWS6/M/MWCGO1VdjSaEmQRCsJdViPUpCGhD13A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044222;
	bh=wuyaEtPdrAkarlXMhkItUaSO9G2YIT+1l7LKROS60Lk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YspkmaUidxbXcsdu9UPrIkewdd4FHgCnQ/WEqgtWhws9HyNlQ2CEvsBma9Ef0+rYf
	 dw67oUTlEePU7yz2/0DQVS1DGNKI+0MUp5/kzJXDwPX6byeGeB27wh6aihiFZL4rGu
	 riqbth5pmgOhoK3r5/RZwIAfDaoanJWazjAOCAg2SB/ii0uiGdmpXFxXNr6CZe9nqp
	 Tt8dvPXsHC3P4O624IhKqWJn6INLNGbp2r2r1uDQbKQPOqpQAm3DIKGUVQBCoVFJo2
	 Ughkf2AQQNNss2WrpnWamdZHmvdPsw0TIHTExiz0AdfIQX2+rlipaUK7B2+3Wz6mr1
	 hhydPwDwrgFEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C6B6068A;
	Sat,  3 Oct 2026 16:17:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E547435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F4626068A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atGruZH-HLTj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:16:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EB69605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044219;
 b=PVdDlupgWc0FfZ1ahNcHd00TnfgsiDAYaC1K/4eIcVx9NVZvUieAokYgkBM+jXIz9pwR
 BQfEo/WwM2jQzD/IBa0Gna4AsG/wYTt74cRaOTnJxJvHwhLk/ndY/m4UwyBwZ+5OvmWGC
 i2YmQinhp7g2zkq6Wgf3h7KBXXSv4CZZ4EanxKbvXQvkiqBorbbaTI3/qXoSxKMxrLe56
 Zqnj8kvjoXb/nnukV3Og+9H9clnmxOKlnGQ9gyn2QPuXeLXfK7L95rK7ebNpVnJ7mz/Ms
 T9N55LpVQ3sv3IlBxmmV7F0T8xYyaNTTixUBmRai5Ld6fDjJQXxt7WgFEcz5wBB7VEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044219;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=O8VkoeBgDUwlhTizWcy4+2CM7y3tlVyjpSybuWEwjTo=;
 b=TJgx1e79TWyXpgXD3qT9rB4Jdd6THFJI7E3N/uK240hS8ui8oSWM4PK8aWx3QUvlNMsc
 7W/pM+kay2lMhzvgYwhDjR69JliyJ1DOx1jTnvomaNQmeKKJBH1h7zqMmGLRDnazkDiY0
 sTLx3cOIZJ5OKWePDbA2Q/Is2jzbObUUAFVHfCni8nsZraFKw6ssc7vMbn0U4UqDUs8Ot
 llRJ6D5U/jEuqlFa70KsLoe5Dgl5HyITKg2G8hgHRVuvE+JZcBm2sxHXTGwbpuJDdCTD2
 VUBpP3W+k0hdQAmdRgsZEc6VpTuu4wSjCERdwr2YnH/bgUW3mE4JWGD9VxG18blkKeg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ur27BQXS; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EB69605F1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 697294E41134
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 37F50604FF;
 Sat,  3 Oct 2026 16:16:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 468CB10328170; 
 Sat,  3 Oct 2026 18:16:56 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:16:55 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <asEqc-3L7USj_G5X@windsurf>
References: <20260923182403.2143949-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260923182403.2143949-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/gnu-efi: fix license information
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

On Wed, Sep 23, 2026 at 08:24:03PM +0200, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Split the confusing "and/or" for gnulib, so dual-licensed and GPL-only
> parts are clearly noted, and add the missing LGPL license. Lines in
> GNU_EFI_LICENSE are ordered the same way as the information is given
> in the LICENSE file.
> 
> The license situation of inc/subst/elf.h is curious: The file itself
> is licensed under LGPL-2.1-or-later, and used in gnu-efi under
> LGPL-3.0-or-later (accompanied by the appropriate license files),
> which in turn allows using it for object code under different terms
> with certain conditions (see section 3 of LGPL 3.0, as noted in the
> gnu-efi LICENSE file).
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

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
