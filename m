Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC476606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Puk3S7JN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF0040704;
	Wed, 28 Oct 2026 17:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paOdUvRtnOVG; Wed, 28 Oct 2026 17:22:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 95BF34070A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793208125;
	b=WRaxrMsCMS0Cwzs5Z2U5IwFWwJGLVUW/HJvVDmkaN7PAB13fecDvuwkk0DBPO3tHECcF
	 3y/vytrsl7W/HtnmS3/9lN2VElURoUkdu79XlN2WgzBC25J0X3xN4Jqe/st0jytHj61yi
	 mz/gR04yiyOUv9EyYzDovC30k2AfiHpsCjtrWWrEqDbtcCI6cCQFxIL3yKIWCSgxNcG+u
	 X8Vq1imBFBvzBbjYvByEo7XboBAtRjsbU1Rmh8J/v8Hrm5HiV1D+H7ozhT5npEYZu8dcq
	 0MYVGIwrI1RSSBIr9je3qZxj5JWXBI4+F+G6S046+n6Ffn5tBiFkDyLFt/CW7UntaYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793208125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uX1E1aI5/Gfrr9NwjrMyeVDk1agchbTvC7m89FQW8wo=;
	b=iQRoB25WcgC5ffm5777f7awIcijrLYS0L95pjqXBQki+3wBRiUiEeBVX7NIBhwc+CZTu
	 aks86MjXr4zglpFkcozD7VGkY0AX93A2iYPLlGrQtThE7oTteR2r7Qz0rYAU+Xy4PkSvv
	 70JaSEKxEJC5o+35S62hqc04v4pA8r2QDuB4eKPCqicWD9aV2NqA1XyN1OGDHRdWEMOgD
	 /YfKjUKn9lwyq7O+M6SS20fTf0PEP5d3S5q3+6jS+IHgnfFnsCJZIY08kIj5dPITqmpsp
	 y5fU0I8SkDYbx6FzBC0olZwUKn9co/CQh6E7PP5WK69yqHuDO7VgHyZLho2PNNEbo0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793208125;
	bh=uX1E1aI5/Gfrr9NwjrMyeVDk1agchbTvC7m89FQW8wo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Puk3S7JNt714ZajVE8zmfXtJTDC4HlbyOd0VSMwfBo6N6rzQsFnJCO1TKpupFTt2c
	 baYLKtA3KkPkiBPAGh0Jr4/26wrVM7SVBtNwLNzQhBWdiTabfSwUbLE0bNAnBNlc4z
	 J4QiqUtO7NJOcMzh/Y5kjwVz5WG9xppQDMuZQUL4slATwdTkZu4Ua1ZOcmmwqyoYZq
	 AKbAjM0fAJuceaSdIokx7CmzlBEAEZH5JSjLPu7Bytyn2oGZ5t8V9h2My96sTucX2i
	 8c5rGZb8nY9cGSLQnGVYnf37HXr25gmwheyfiMxGPHgTcmEo0BrtEfgrq/QGVbZf91
	 vQz4avW+F4SfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BF34070A;
	Wed, 28 Oct 2026 17:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F88E9F8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04C9440702
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzQWyv3_Hr0u for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 17:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F3BE406FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793208122;
 b=V5gpoqIq6+kokC3wg/xxdd9TPzAwcb3m7TTu+lVwpmRYUZKdJjk9vwtySiitpM8+8Hgm
 CqRAPMCnEeeHTZHuWAjj8SfAUKXe3jZWRhOH/bRqo/BEvwyq5GqVXq982CVicA1jxbu4p
 SOLlecGbuYBO87nWtNFh7n6rD05l7yDVX8hgiZ8+kMiEPZz9ROCNVQxThYmbiuhMtEg4o
 9RbpB9hHwF7QlYx5wamF6sYGPNe3pJq36Qt9IMpjp892qZEnO+8rrIGkN0nMRkdPANCmC
 JHSfqRrbm35na+Z4EjxQQn5FSlAtGIi3ZFzyfalGY65SLZHBq2ktNSGfsm6BslvwcVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793208122;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5aNffGyqeD015ziEA2//o8gGbDkT3RAPb8WQixtYODo=;
 b=erv+CjqA5zMUE/JVkIpnEJjeJDmT2Q1gORrDwjjiHaGsBMCQWOuDLUqJ4qqTfoOJ5kPt
 MZQkkadcaMB/unMQPdIyQwuNjmH8r/Oxo1Hb+EDRTJqDVfVhRXbxrYUQXXfcuAxceC2Jh
 MryyTWztyzwhFZPIwX+3pvGP9kN6pc4FzedEB9HxnHfCFDuDDxI8jqEDIbJ0U8w8xSPZl
 O1B5HlQ7u1FPA9lpbp2VvVR0TXOztNTt9Ce/5H3Ozz0cy5najLsf6VmmU4OkoPDTpAkK/
 yEL2HHbTP2k2OkdVIDgIFW3RziF6Bct0w3w/80U1Y/OcmcFpHfm3xt1Tc70ewRP8MZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=di9tVJf6; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F3BE406FC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:22:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E6FD54E41361;
 Wed, 28 Oct 2026 17:21:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B45E860769;
 Wed, 28 Oct 2026 17:21:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12B05103290AD; Wed, 28 Oct 2026 18:21:52 +0100 (CET)
Date: Wed, 28 Oct 2026 18:21:51 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, 
 Sen Hastings <sen@hastings.org>
Message-ID: <auIvJj81N8nyRZwO@windsurf>
References: <20261028155122.3226008-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261028155122.3226008-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v4 1/3] package/systemd: bump version to
 258.12
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 04:51:20PM +0100, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> This is a stable patch release, no changes to options/services. The
> default for the dns-servers option in meson_options.txt has changed to
> use different domain names for the Cloudflare DNS servers, but the
> same IP addresses.
> 
> Remove patch included upstream [1].
> 
> [1] https://github.com/systemd/systemd/commit/3ed9869c4780846b4a5380bf921073fa2fac0730
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Series applied to master, thanks!

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
