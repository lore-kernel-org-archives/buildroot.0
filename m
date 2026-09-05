Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6043C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 14:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A15640AD3;
	Sat,  5 Sep 2026 14:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vz0fRtsku03S; Sat,  5 Sep 2026 14:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CD17640ACA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788617876;
	b=CJcDjHO9LBF6LifXMJ8M1/VCWr70kktf+oZsLBEaLPGfCQhL4BH2qpAexPBzdSdphhCx
	 sDU7hFSDkUtK5y52KD/IoQXttHIDof0iAqh0iV16FyzGfI/ZrwYhQO0Pz4msLaob5eNvk
	 7soyKWvS8TJJ3i+TvU8ZFJLMrhbS60bRihRAATKoPhkHl3lHz2V7Rr/TY1we04zRPl4Re
	 CZqiCAOUrYa18dxN1cllioYsiyarfSGlHyIYTAh1hUV2Lh8q8DTzct839ab1eIZqJ5QV0
	 d1kGZzvI9xLh69J8WTiWovUOgeBtweM0iyYNZu1gEOCJaVP/bvwS2AT0HD/PxlwKniQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788617876;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=to54L9L4+W3xji6ewekRzLgYERaAaQ6WNl3IfPq5RO4=;
	b=ccEG3wH0FQHGmwXwKhI9DaOmjaeSce7rc9OOlzYxB41zCqd/lQwdKE/AnlpUlRS3B+ky
	 ObxKEMk5Xanlayv+geApFSFZMcogSRG7xbhIuGkudJKDfolOlpn3vP4CGGrCyPpaJz2/x
	 xrhwoBQQfa5qOmKebbudxcN56UOYxTxdAs6zVtrVVXuXW923AMxTznukMa5Wimk885EFu
	 Z/H5PEA9+Eqij95vnPMD1VMES8SDi51RW1cJG/99Aj+1F6SNHaCNsJRiWZgj1T5n7vpXz
	 Xh7s+ic6NA/cTOzqPpthgoe4El5d+OydP5HxdvOsc08qkxdBRrZtBUTseAkm5nxomaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788617876;
	bh=to54L9L4+W3xji6ewekRzLgYERaAaQ6WNl3IfPq5RO4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BQu6RKnidCx86ZEzr2ufE2yAWzGiy1iI70++h+soe3suWgMTFU80MYE8HjOz1DxQH
	 tFH8zNYLY1S68MZS4q2+/LSUvEPS/ne9foHmNyPivBJ3FqasymRw2xAXw6ji6Ee9nu
	 s/7W4/dW0QT10XscCIbJsCsEzjNM8SzRi770GdArAZoFPdzHMsIpaOai5YjVMfy11z
	 LCjfsRpuHZ6kXCt2hD+uVa1AMgrFmWszRG0jWFNG6Yx2QYDD7lYwWWZnDjxPnDtId9
	 MWoFxy1iAYYHdWlDnzvnCCY2xuFvqUSBLau4h3W1UrfVX10H2JHenHJwPM7l2psWy1
	 6qhGb0uhYx5Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD17640ACA;
	Sat,  5 Sep 2026 14:17:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C044105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DED26060B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9yTBQeh0w9K for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 14:17:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7B2B960604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788617874;
 b=A53MXZ/7ddgEwtegeLvDVEkGXiM7TLynGeTom3BoKnv/jtnwQ4NpewPjHndIP5KoFZLu
 khyR5omqz9pOjV7eUaJcEfqNpTcrnhrJw73zXWW5xFjxyeZWwfLrdatsnNqVtpDA8U08K
 v27uFE5FbpbHpelYCwhyJXgVX3rBfLvE7lCtm4gA/jIBKZUhMlI2vs8AREFraSxYvbrIV
 S/MWYSsulENCsQ4Ps69y+eQdWCXFKIwuKICWdHV+Gof0CD/MqT8Hp8JH4fRAZDyj1b4bX
 35aiSrgaKwDEV05nmu58glDzHPEI4LPZLUqUdx6biNvBrtl9hRtkWUUfar4I6al4ZXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788617874;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FtXt+QeIZFN3vu0CAh3lu6xN1v32sk5g25IM1z+YY9s=;
 b=Hv6ObHEuyvVTy3HZFT5UrXfghHdMLiJ+4Q9f5m4bMNKQk68NmPWuq7T/ZvABCtxE3cnq
 dtx5psFHnh7IfFlk68qKqLrB1eXh8Mrbrr2Zkpp40UzkXaynswDCQ1/amU4u3puEFXdBw
 0ZgIhnPTOjE7z4k22KlXXKK1obAe5aky+Pq8AgDAtAZKIKBJa4e27HwQ3j27WWwrPm1xi
 vK2tKWEydbX4yfPUMtlJTWOGpEYAmKs+0MZlck8Tq+f5nUByiyxfk6QK7wRl2HmqmhBE5
 nN5qunXFrrZpRWotNB20g5Ho5n+yz0U03haJh4Uob00sW8XUlDPqqv0TaEBhUMAUfAg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hOnTmig6; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B2B960604
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:17:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6756F1A18F9;
 Sat,  5 Sep 2026 14:17:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3BE9360233;
 Sat,  5 Sep 2026 14:17:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7A4811C783E9; 
 Sat,  5 Sep 2026 16:17:47 +0200 (CEST)
Date: Sat, 5 Sep 2026 16:17:47 +0200
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <apwkfNgsHbhHcgFj@windsurf>
References: <20260831214039.3575327-2-fbstachura@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260831214039.3575327-2-fbstachura@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 9.2
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

Hello Franciszek,

On Mon, Aug 31, 2026 at 11:40:40PM +0200, Franciszek Stachura wrote:
> Changelog:
> https://www.nano-editor.org/dist/v9/ChangeLog
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
